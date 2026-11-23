//------------------------------------------------------------------------------
// full_conv_seq class
//------------------------------------------------------------------------------
`ifndef FULL_CONV_SEQ_SVH
`define FULL_CONV_SEQ_SVH

class full_conv_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(full_conv_seq)

  function new(string name = "full_conv_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item req;
    bit done = 0;
    int poll_cnt = 0;
    int max_polls = 10000;

    // 1. Clear CTRL (0x000 = 0)
    req = apb_seq_item::type_id::create("clear_ctrl");
    start_item(req);
    req.addr  = 12'h000;
    req.write = 1'b1;
    req.wdata = 32'h0000_0000;
    finish_item(req);

    // 2. Start Convolution: CTRL[0] = 1
    req = apb_seq_item::type_id::create("start_conv");
    start_item(req);
    req.addr  = 12'h000;
    req.write = 1'b1;
    req.wdata = 32'h0000_0001;
    finish_item(req);

    // 3. Load 9 Weights via WGT0 (0x008), WGT1 (0x00C), WGT2 (0x010)
    req = apb_seq_item::type_id::create("wgt0");
    start_item(req);
    req.addr = 12'h008; req.write = 1'b1; req.wdata = 32'h0102_0304;
    finish_item(req);

    req = apb_seq_item::type_id::create("wgt1");
    start_item(req);
    req.addr = 12'h00C; req.write = 1'b1; req.wdata = 32'h0506_0708;
    finish_item(req);

    req = apb_seq_item::type_id::create("wgt2");
    start_item(req);
    req.addr = 12'h010; req.write = 1'b1; req.wdata = 32'h0900_0000;
    finish_item(req);

    // 4. Stream 196 packed IFM words into 0x300 - 0x60C
    for (int i = 0; i < 196; i++) begin
      req = apb_seq_item::type_id::create($sformatf("ifm_wr_%0d", i));
      start_item(req);
      req.addr  = 12'h300 + (i * 4);
      req.write = 1'b1;
      req.wdata = $urandom();
      finish_item(req);
    end

    // 5. Poll STATUS (0x004) until DONE bit (bit 1) is high
    while (!done && (poll_cnt < max_polls)) begin
      req = apb_seq_item::type_id::create("poll_status");
      start_item(req);
      req.addr  = 12'h004;
      req.write = 1'b0;
      finish_item(req);
      done = req.rdata[1];
      poll_cnt++;
    end

    if (!done) begin
      `uvm_error(get_type_name(), "Timed out waiting for DONE bit in STATUS (0x004)")
    end

    // 6. Read 784 OFM pixels from 0x200 to 0xE3C
    for (int i = 0; i < 784; i++) begin
      req = apb_seq_item::type_id::create($sformatf("ofm_rd_%0d", i));
      start_item(req);
      req.addr  = 12'h200 + (i * 4);
      req.write = 1'b0;
      finish_item(req);
    end
  endtask

endclass : full_conv_seq

`endif
