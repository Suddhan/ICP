// =====================================================================
// Scoreboard 
// Per bus item (same structure as the FIFO scoreboard):
//   1. check bus response            (optional, see check_unmapped_resp)
//   2. check reads of non-volatile fields against the mirror (BEFORE the
//      predictor runs; afterwards the mirror already holds the value read)
//   3. model: checks for Status / OFM / MAC_DBG reads, side effects for
//      IFM writes and Start
//   4. forward the item to the predictor
//

// all inside compute_ofm() so a wrong assumption is a one-function fix.
// =====================================================================
class cnn_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(cnn_scoreboard)

  // ---- address map from the CSV ----------------------------------------
  localparam bit [11:0] ADDR_CTRL    = 32'h000;
  localparam bit [11:0] ADDR_STATUS  = 32'h004;
  localparam bit [11:0] ADDR_WGT0    = 32'h008;
  localparam bit [11:0] ADDR_WGT1    = 32'h00C;
  localparam bit [11:0] ADDR_WGT2    = 32'h010;
  localparam bit [11:0] ADDR_MAC_DBG = 32'h100;

  localparam int unsigned OFM_WORDS = 784;                        // OFM[0:783]
  localparam bit [11:0]   OFM_BASE  = 32'h200;
  localparam bit [11:0]   OFM_END   = OFM_BASE + 4*(OFM_WORDS-1); // 0xE3C

  localparam int unsigned IFM_WORDS = 196;                        // IFM[0:195]
  localparam bit [11:0]   IFM_BASE  = 32'h300;
  localparam bit [11:0]   IFM_END   = IFM_BASE + 4*(IFM_WORDS-1); // 0x60C

  localparam int unsigned IMG_W = 28;                             // 196*4 = 784 = 28*28
  localparam int unsigned IMG_H = 28;

  localparam bit PIXELS_SIGNED  = 1'b0;   // 8-bit pixels unsigned?
  localparam bit WEIGHTS_SIGNED = 1'b1;   // 8-bit weights two's complement?
  localparam int W8_MSB         = 31;     // W8 sits in byte lane [31:24] of WGT2
o.

  // ---- configuration knobs ---------------------------------------------
  bit enable_checks        = 1;
  bit check_unmapped_resp  = 0;  // 1: expect PSLVERR exactly on unmapped addresses
                                 //    (CSV does not say; FIFO spec did)
  bit check_ofm            = 1;  // 0: skip OFM data compare (if the compute
                                 //    assumptions are not yet confirmed)
  bit use_strobes          = 1;  // 0 for APB3, or a monitor that leaves strb unset
  int unsigned max_ofm_err_per_run = 10;

  // ---- connections (set by the env) ------------------------------------
  uvm_analysis_imp #(apb_item, cnn_scoreboard) apb_export;
  cnn_reg_block                 regmodel;
  uvm_reg_predictor #(apb_item) predictor;

  // ---- model state -----------------------------------------------------
  typedef enum { RG_NONE, RG_CTRL, RG_STATUS, RG_WGT, RG_MAC_DBG, RG_OFM, RG_IFM } region_e;
  typedef enum { PH_RESET,     // never started since reset
                 PH_RUNNING,   // Start written, Done not yet observed
                 PH_DONE } phase_e;  // Done observed since the last Start

  protected phase_e    m_phase;
  protected bit [31:0] m_ifm     [IFM_WORDS];   // what software has written
  protected bit [31:0] m_ofm_exp [OFM_WORDS];   // computed at Start

  // ---- statistics ------------------------------------------------------
  int unsigned n_items, n_starts, n_mirror_checks, n_status_checks;
  int unsigned n_ofm_checks, n_ofm_skipped, n_errors;
  protected int unsigned m_ofm_err_run;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    apb_export = new("apb_export", this);
    reset_model();
  endfunction

  function void configure(cnn_reg_block rm, uvm_reg_predictor #(apb_item) p);
    regmodel  = rm;
    predictor = p;
  endfunction

  // Call after the DUT is reset (the env's apply_reset_to_mirror() does).
  function void reset_model();
    m_phase       = PH_RESET;
    m_ofm_err_run = 0;
    foreach (m_ifm[i])     m_ifm[i]     = '0;   // CSV: reset 0
    foreach (m_ofm_exp[i]) m_ofm_exp[i] = '0;
  endfunction

  // ===================================================================
  // Entry point: one call per completed bus transfer
  // ===================================================================
  function void write(apb_item item);
    region_e rg;

    if (regmodel == null || predictor == null)
      `uvm_fatal("SCB", "configure() was not called before the first item")

    n_items++;
    rg = classify(item.addr, item.write);

    if (enable_checks) begin
      check_bus_response(item, rg);
      if (!item.slverr) check_read_against_mirror(item, rg);   // OLD mirror
    end

    if (!item.slverr) begin
      if (item.write) model_write(item, rg);
      else if (enable_checks) model_read(item, rg);
    end

    predictor.bus_in.write(item);
  endfunction

  // ===================================================================
  // Address decode
  // IFM (0x300-0x60C, WO) lies INSIDE OFM (0x200-0xE3C, RO), so direction
  // decides: a write there is IFM, a read there is OFM.
  // ===================================================================
  function region_e classify(bit [31:0] addr, bit is_write);
    if (addr[1:0] != 2'b00) return RG_NONE;               // unaligned

    if (addr >= IFM_BASE && addr <= IFM_END)
      return is_write ? RG_IFM : RG_OFM;
    if (addr >= OFM_BASE && addr <= OFM_END)
      return RG_OFM;                                       // writes ignored (RO)

    case (addr)
      ADDR_CTRL:                       return RG_CTRL;
      ADDR_STATUS:                     return RG_STATUS;
      ADDR_WGT0, ADDR_WGT1, ADDR_WGT2: return RG_WGT;
      ADDR_MAC_DBG:                    return RG_MAC_DBG;
      default:                         return RG_NONE;
    endcase
  endfunction

  function void err(string msg);
    n_errors++;
    `uvm_error("SCB", msg)
  endfunction

  // ===================================================================
  // 1. Bus response
  // ===================================================================
  function void check_bus_response(apb_item item, region_e rg);
    // unaligned addresses, nor for writes to RO registers (assumed ignored,
    // no error). Off by default.
    if (!check_unmapped_resp) return;
    if (rg == RG_NONE && !item.slverr)
      err($sformatf("Unmapped address 0x%08h accepted without PSLVERR", item.addr));
    if (rg != RG_NONE && item.slverr)
      err($sformatf("PSLVERR on mapped address 0x%08h", item.addr));
  endfunction

  // ===================================================================
  // 2. Non-volatile fields vs the mirror (here: WGT0..2)
  // ===================================================================
  function void check_read_against_mirror(apb_item item, region_e rg);
    uvm_reg        reg_h;
    uvm_reg_field  flds[$];
    uvm_reg_data_t mask, exp_v, got_v;

    if (item.write) return;
    if (rg != RG_CTRL && rg != RG_STATUS && rg != RG_WGT && rg != RG_MAC_DBG) return;

    reg_h = regmodel.default_map.get_reg_by_offset(item.addr, 1);
    if (reg_h == null) return;

    reg_h.get_fields(flds);
    foreach (flds[i]) begin
      if (flds[i].get_compare() != UVM_CHECK) continue;   // volatile: model checks it
      mask  = ((64'h1 << flds[i].get_n_bits()) - 1);
      exp_v = flds[i].get_mirrored_value() & mask;
      got_v = (item.rdata >> flds[i].get_lsb_pos()) & mask;
      n_mirror_checks++;
      if (got_v !== exp_v)
        err($sformatf("%s.%s: expected 0x%0h (mirror), read 0x%0h",
                      reg_h.get_name(), flds[i].get_name(), exp_v, got_v));
    end
  endfunction

  // ===================================================================
  // 3a. Writes: IFM contents and the Start trigger
  // ===================================================================
  function void model_write(apb_item item, region_e rg);
    bit [3:0] be = use_strobes ? item.strb : 4'hF;

    case (rg)
      RG_IFM: begin
        int unsigned idx = (item.addr - IFM_BASE) >> 2;
        for (int b = 0; b < 4; b++)
          if (be[b]) m_ifm[idx][8*b +: 8] = item.wdata[8*b +: 8];
      end

      RG_CTRL:
        // Start is assumed to be bit 0 (CSV says only "Bits = 1").
        if (be[0] && item.wdata[0]) on_start();

      default: ;   // WGT: the mirror holds it. RO registers/OFM: ignored.
    endcase
  endfunction

  function void on_start();
    compute_ofm();            // snapshot: weights from the mirror, IFM from m_ifm
    m_phase       = PH_RUNNING;
    m_ofm_err_run = 0;
    n_starts++;
  endfunction

  // ---------------------------------------------------------------------
  // THE reference computation. Every assumption about the convolution is
  //   * 3x3 kernel, row-major: W0 W1 W2 / W3 W4 W5 / W6 W7 W8
  //   * cross-correlation (kernel not flipped), stride 1
  //   * 'same' size output with ZERO padding: 28x28 -> 28x28 (784 OFM words)
  //     (a 'valid' convolution would give 26x26 = 676 results)
  //   * OFM stored row-major, one 32-bit word per output
  //   * pixels/weights signedness per PIXELS_SIGNED / WEIGHTS_SIGNED
  // ---------------------------------------------------------------------
  function void compute_ofm();
    bit [31:0] r0, r1, r2;
    bit [7:0]  w   [9];
    bit [7:0]  pix [IFM_WORDS*4];
    int        acc, pv, wv, rr, cc, k;

    // weights from the register mirror (non-volatile, kept current by the predictor)
    r0 = regmodel.wgt0.w.get_mirrored_value();
    r1 = regmodel.wgt1.w.get_mirrored_value();
    r2 = regmodel.wgt2.w.get_mirrored_value();
    for (int n = 0; n < 4; n++) begin
      w[n]   = r0[31 - 8*n -: 8];     // W0..W3
      w[4+n] = r1[31 - 8*n -: 8];     // W4..W7
    end
    w[8] = r2[W8_MSB -: 8];           // W8

    // unpack the image: pixel 4i is the word's first (MSB) byte
    for (int p = 0; p < IFM_WORDS*4; p++)
      pix[p] = m_ifm[p/4][31 - 8*(p%4) -: 8];

    for (int r = 0; r < IMG_H; r++) begin
      for (int c = 0; c < IMG_W; c++) begin
        acc = 0;
        for (int i = -1; i <= 1; i++) begin
          for (int j = -1; j <= 1; j++) begin
            rr = r + i;
            cc = c + j;
            if (rr >= 0 && rr < IMG_H && cc >= 0 && cc < IMG_W) begin
              k = (i + 1) * 3 + (j + 1);
              if (PIXELS_SIGNED)  pv = $signed(pix[rr*IMG_W + cc]); else pv = pix[rr*IMG_W + cc];
              if (WEIGHTS_SIGNED) wv = $signed(w[k]);               else wv = w[k];
              acc += pv * wv;
            end
          end
        end
        m_ofm_exp[r*IMG_W + c] = acc;
      end
    end
  endfunction

  // ===================================================================
  // 3b. Reads: Status, OFM, MAC_DBG
  // ===================================================================
  function void model_read(apb_item item, region_e rg);
    case (rg)
      RG_STATUS:  check_status(item);
      RG_OFM:     check_ofm_read(item);
      RG_MAC_DBG: check_mac_dbg(item);
      default: ;
    endcase
  endfunction

  // The model cannot know the cycle on which Busy rises or Done sets, so the
  // check is a legality check on the sequence of observed values:
  //   never started : busy=0, done=0
  //   started       : busy and done never both 1; the first read with
  //                   busy=0,done=1 means the run has finished
  //   finished      : busy=0, done=1 until the next Start
  // right after Start may still show busy=0,done=0 (propagation delay).
  function void check_status(apb_item item);
    bit busy = item.rdata[0];
    bit done = item.rdata[1];

    n_status_checks++;
    case (m_phase)
      PH_RESET:
        if (busy || done)
          err($sformatf("Status before any Start: busy=%0b done=%0b, expected 0/0", busy, done));

      PH_RUNNING: begin
        if (busy && done)
          err("Status: busy and done both set");
        else if (done && !busy)
          m_phase = PH_DONE;
      end

      PH_DONE:
        if (busy || !done)
          err($sformatf("Status after completion: busy=%0b done=%0b, expected 0/1", busy, done));
    endcase
  endfunction

  function void check_ofm_read(apb_item item);
    int unsigned idx = (item.addr - OFM_BASE) >> 2;
    bit [31:0]   exp_v;

    if (!check_ofm) return;

    case (m_phase)
      PH_RESET: exp_v = '0;                 // CSV: reset value 0
      PH_DONE:  exp_v = m_ofm_exp[idx];
      default: begin                        // PH_RUNNING: contents indeterminate
        n_ofm_skipped++;
        return;
      end
    endcase

    n_ofm_checks++;
    if (item.rdata !== exp_v) begin
      m_ofm_err_run++;
      if (m_ofm_err_run <= max_ofm_err_per_run)
        err($sformatf("OFM[%0d] @0x%08h: expected 0x%08h, read 0x%08h",
                      idx, item.addr, exp_v, item.rdata));
      else begin
        n_errors++;   // counted, message suppressed
        if (m_ofm_err_run == max_ofm_err_per_run + 1)
          `uvm_warning("SCB", "Further OFM mismatches in this run are counted but not printed")
      end
    end
  endfunction


  // so only the reset value is checked.
  function void check_mac_dbg(apb_item item);
    if (m_phase == PH_RESET && item.rdata !== 32'h0)
      err($sformatf("MAC_DBG before any Start: 0x%08h, expected 0", item.rdata));
  endfunction

  // ===================================================================
  function void check_phase(uvm_phase phase);
    if (m_phase == PH_RUNNING)
      `uvm_warning("SCB", "Start was written but Done was never observed")
  endfunction

  function void report_phase(uvm_phase phase);
    `uvm_info("SCB", $sformatf("items=%0d starts=%0d mirror_checks=%0d status_checks=%0d ofm_checks=%0d ofm_skipped=%0d errors=%0d",
              n_items, n_starts, n_mirror_checks, n_status_checks,
              n_ofm_checks, n_ofm_skipped, n_errors), UVM_LOW)
    if (n_items == 0)
      `uvm_warning("SCB", "Scoreboard saw no bus items: is the monitor connected?")
    if (n_starts == 0)
      `uvm_warning("SCB", "No Start seen: OFM/status behaviour was not exercised")
  endfunction

endclass