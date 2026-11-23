`ifndef OFM_READ_SEQ_SVH
`define OFM_READ_SEQ_SVH

class ofm_read_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(ofm_read_seq)

  function new(string name = "ofm_read_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item req;

    for (int i = 0; i < 784; i++) begin
      req = apb_seq_item::type_id::create($sformatf("ofm_req_%0d", i));
      start_item(req);
      req.addr        = 12'h200 + (i * 4);
      req.write       = 1'b0;
      req.wdata       = 32'h0;
      req.start_delay = 0;
      finish_item(req);
    end
  endtask
endclass : ofm_read_seq

`endif