`ifndef IFM_BACKPRESSURE_SEQ_SVH
`define IFM_BACKPRESSURE_SEQ_SVH

class ifm_backpressure_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(ifm_backpressure_seq)

  function new(string name = "ifm_backpressure_seq");
    super.new(name);
  endfunction

  virtual task body();
    apb_seq_item req;

    for (int i = 0; i < 196; i++) begin
      req = apb_seq_item::type_id::create($sformatf("ifm_req_%0d", i));
      start_item(req);

      if (!req.randomize() with {
        addr == 12'h300 + (i * 4);
        write == 1'b1;
        start_delay dist {0 := 80, [1:3] := 20};
      }) begin
        `uvm_fatal(get_type_name(), "IFM sequence randomization failed!")
      end

      finish_item(req);
    end
  endtask
endclass : ifm_backpressure_seq

`endif