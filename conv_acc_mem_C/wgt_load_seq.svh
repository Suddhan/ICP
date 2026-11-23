`ifndef WGT_LOAD_SEQ_SVH
`define WGT_LOAD_SEQ_SVH

class wgt_load_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(wgt_load_seq)

  rand bit signed [7:0] weights[9];

  constraint c_weights {
    foreach (weights[i]) weights[i] inside {[-128:127]};
  }

  function new(string name = "wgt_load_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item req;

    // WGT0 (0x008): W[0] in [31:24] .. W[3] in [7:0] per cnn_scoreboard
    req = apb_seq_item::type_id::create("wgt0_req");
    start_item(req);
    req.addr  = 12'h008;
    req.write = 1'b1;
    req.wdata = {weights[0], weights[1], weights[2], weights[3]};
    finish_item(req);

    // WGT1 (0x00C): W[4] in [31:24] .. W[7] in [7:0] per cnn_scoreboard
    req = apb_seq_item::type_id::create("wgt1_req");
    start_item(req);
    req.addr  = 12'h00C;
    req.write = 1'b1;
    req.wdata = {weights[4], weights[5], weights[6], weights[7]};
    finish_item(req);

    // WGT2 (0x010): W[8] in [31:24] (W8_MSB = 31) per cnn_scoreboard
    req = apb_seq_item::type_id::create("wgt2_req");
    start_item(req);
    req.addr  = 12'h010;
    req.write = 1'b1;
    req.wdata = {weights[8], 24'h0};
    finish_item(req);
  endtask
endclass : wgt_load_seq

`endif