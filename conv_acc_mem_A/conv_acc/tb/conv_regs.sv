// =====================================================================
// Register model generated from Reference_Model_-_Sheet1.csv
// Single level: one block, one map. IFM and OFM are ordinary registers,
// declared as arrays.
//
//   Ctrl     0x000        Start (R/W, volatile)
//   Status   0x004        Busy, Done (RO, volatile)
//   WGT0     0x008        W[0:3]   R/W
//   WGT1     0x00C        W[4:7]   R/W
//   WGT2     0x010        W[8]     R/W
//   MAC_DBG  0x100        RO, volatile  ("copy of adder_out")
//   OFM[i]   0x200 + 4*i  RO, volatile      i = 0..783
//   IFM[i]   0x300 + 4*i  WO, 4 pixel bytes i = 0..195
//
// IFM (0x300-0x60C, WO) lies inside OFM (0x200-0xE3C, RO): a write to one of
// those addresses reaches IFM[i], a read reaches OFM[i+64]. The map keeps a
// separate lookup for WO registers, so a WO and an RO register may share an
// address. The lookup is direction-sensitive:
//   map.get_reg_by_offset(addr, 1)  -> the RO/RW register  (reads)
//   map.get_reg_by_offset(addr, 0)  -> the WO register     (writes)
// =====================================================================

// ---- Ctrl ------------------------------------------------------------
class cnn_ctrl_reg extends uvm_reg;
  `uvm_object_utils(cnn_ctrl_reg)
  rand uvm_reg_field start;

  function new(string name = "cnn_ctrl_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    start = uvm_reg_field::type_id::create("start");
    // CSV: "Bits = 1", R/W, volatile=Yes, reset 0.  Assumed bit [0].
    // Volatile because it is expected to self-clear (TODO(spec)).
    //               parent size lsb access volatile reset has_rst rand indiv
    start.configure(this,   1,   0, "RW",  1,       1'h0, 1,      0,   0);
  endfunction
endclass

// ---- Status ----------------------------------------------------------
class cnn_status_reg extends uvm_reg;
  `uvm_object_utils(cnn_status_reg)
  rand uvm_reg_field busy;
  rand uvm_reg_field done;

  function new(string name = "cnn_status_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    busy = uvm_reg_field::type_id::create("busy");
    done = uvm_reg_field::type_id::create("done");
    busy.configure(this, 1, 0, "RO", 1, 1'h0, 1, 0, 0);   // [0]
    done.configure(this, 1, 1, "RO", 1, 1'h0, 1, 0, 0);   // [1]
  endfunction
endclass

// ---- WGT0 / WGT1 / WGT2: same layout, one class, three instances -----
class cnn_wgt_reg extends uvm_reg;
  `uvm_object_utils(cnn_wgt_reg)
  rand uvm_reg_field w;      // packed 8-bit weights, see scoreboard for lane order

  function new(string name = "cnn_wgt_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    w = uvm_reg_field::type_id::create("w");
    // CSV: 32 bits, R/W, not volatile, reset 0
    w.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 0);
  endfunction
endclass

// ---- MAC_DBG ---------------------------------------------------------
class cnn_mac_dbg_reg extends uvm_reg;
  `uvm_object_utils(cnn_mac_dbg_reg)
  rand uvm_reg_field adder_out;

  function new(string name = "cnn_mac_dbg_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    adder_out = uvm_reg_field::type_id::create("adder_out");
    // CSV gives no field name or width; name taken from the Notes column,
    // width assumed 32 (TODO(spec)).
    adder_out.configure(this, 32, 0, "RO", 1, 32'h0, 1, 0, 0);
  endfunction
endclass

// ---- OFM[i]: one 32-bit read-only result word ------------------------
class cnn_ofm_reg extends uvm_reg;
  `uvm_object_utils(cnn_ofm_reg)
  rand uvm_reg_field data;

  function new(string name = "cnn_ofm_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    data = uvm_reg_field::type_id::create("data");
    // CSV: [31:0], RO, volatile=Yes (hardware writes it), reset 0
    data.configure(this, 32, 0, "RO", 1, 32'h0, 1, 0, 0);
  endfunction
endclass

// ---- IFM[i]: one write-only word holding four 8-bit pixels -----------
// CSV rows: [31:24] first pixel, [23:16] second, [15:8] third, [7:0] fourth.
class cnn_ifm_reg extends uvm_reg;
  `uvm_object_utils(cnn_ifm_reg)
  rand uvm_reg_field p0;     // [31:24] first pixel
  rand uvm_reg_field p1;     // [23:16] second pixel
  rand uvm_reg_field p2;     // [15:8]  third pixel
  rand uvm_reg_field p3;     // [7:0]   fourth pixel

  function new(string name = "cnn_ifm_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    p0 = uvm_reg_field::type_id::create("p0");
    p1 = uvm_reg_field::type_id::create("p1");
    p2 = uvm_reg_field::type_id::create("p2");
    p3 = uvm_reg_field::type_id::create("p3");
    // WO, not volatile, reset 0. Randomizable so sequences can generate images.
    //            parent size lsb access volatile reset  has_rst rand indiv
    p0.configure(this,   8,  24, "WO",  0,       8'h0,  1,      1,   0);
    p1.configure(this,   8,  16, "WO",  0,       8'h0,  1,      1,   0);
    p2.configure(this,   8,   8, "WO",  0,       8'h0,  1,      1,   0);
    p3.configure(this,   8,   0, "WO",  0,       8'h0,  1,      1,   0);
  endfunction
endclass

// ---- Block -----------------------------------------------------------
class cnn_reg_block extends uvm_reg_block;
  `uvm_object_utils(cnn_reg_block)

  localparam int unsigned OFM_WORDS = 784;          // OFM[0:783]
  localparam int unsigned IFM_WORDS = 196;          // IFM[0:195]
  localparam uvm_reg_addr_t OFM_BASE = 'h200;       // last word at 0xE3C
  localparam uvm_reg_addr_t IFM_BASE = 'h300;       // last word at 0x60C

  rand cnn_ctrl_reg    ctrl;
  rand cnn_status_reg  status;
  rand cnn_wgt_reg     wgt0;
  rand cnn_wgt_reg     wgt1;
  rand cnn_wgt_reg     wgt2;
  rand cnn_mac_dbg_reg mac_dbg;

  // Not declared 'rand': randomizing the block would otherwise randomize
  // ~1000 registers. Randomize individual IFM registers when you need to.
  cnn_ofm_reg ofm [OFM_WORDS];
  cnn_ifm_reg ifm [IFM_WORDS];

  uvm_reg_map map;

  function new(string name = "cnn_reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    ctrl    = cnn_ctrl_reg   ::type_id::create("ctrl");
    status  = cnn_status_reg ::type_id::create("status");
    wgt0    = cnn_wgt_reg    ::type_id::create("wgt0");
    wgt1    = cnn_wgt_reg    ::type_id::create("wgt1");
    wgt2    = cnn_wgt_reg    ::type_id::create("wgt2");
    mac_dbg = cnn_mac_dbg_reg::type_id::create("mac_dbg");

    ctrl   .configure(this, null, ""); ctrl   .build();
    status .configure(this, null, ""); status .build();
    wgt0   .configure(this, null, ""); wgt0   .build();
    wgt1   .configure(this, null, ""); wgt1   .build();
    wgt2   .configure(this, null, ""); wgt2   .build();
    mac_dbg.configure(this, null, ""); mac_dbg.build();

    // base address must match what PADDR looks like at the peripheral's pins
    map = create_map("map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);

    //            register  offset  bus rights
    map.add_reg(ctrl,      'h000,  "RW");
    map.add_reg(status,    'h004,  "RO");
    map.add_reg(wgt0,      'h008,  "RW");
    map.add_reg(wgt1,      'h00C,  "RW");
    map.add_reg(wgt2,      'h010,  "RW");
    map.add_reg(mac_dbg,   'h100,  "RO");

    // OFM: 784 read-only words from 0x200
    for (int i = 0; i < OFM_WORDS; i++) begin
      ofm[i] = cnn_ofm_reg::type_id::create($sformatf("ofm_%0d", i));
      ofm[i].configure(this, null, "");
      ofm[i].build();
      map.add_reg(ofm[i], OFM_BASE + 4*i, "RO");
      // Keep the built-in RAL test sequences away from these (see notes).
      uvm_resource_db#(bit)::set({"REG::", ofm[i].get_full_name()}, "NO_REG_TESTS", 1);
    end

    // IFM: 196 write-only words from 0x300, overlapping OFM[64..259]
    for (int i = 0; i < IFM_WORDS; i++) begin
      ifm[i] = cnn_ifm_reg::type_id::create($sformatf("ifm_%0d", i));
      ifm[i].configure(this, null, "");
      ifm[i].build();
      map.add_reg(ifm[i], IFM_BASE + 4*i, "WO");
      uvm_resource_db#(bit)::set({"REG::", ifm[i].get_full_name()}, "NO_REG_TESTS", 1);
    end

    lock_model();
  endfunction
endclass
