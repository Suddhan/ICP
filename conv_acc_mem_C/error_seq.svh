`ifndef ERROR_SEQ_SVH
`define ERROR_SEQ_SVH

class error_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(error_seq)

  function new(string name = "error_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item req;
    bit [11:0] bad_addresses[] = '{12'hE40, 12'h150, 12'h610};

    foreach (bad_addresses[i]) begin
      req = apb_seq_item::type_id::create($sformatf("err_read_req_%0d", i));
      start_item(req);
      req.addr  = bad_addresses[i];
      req.write = 1'b0;
      req.wdata = 32'h0;
      finish_item(req);

      req = apb_seq_item::type_id::create($sformatf("err_write_req_%0d", i));
      start_item(req);
      req.addr  = bad_addresses[i];
      req.write = 1'b1;
      req.wdata = 32'hDEAD_BEEF;
      finish_item(req);
    end
  endtask
endclass : error_seq

`endif