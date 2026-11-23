`ifndef ERROR_TEST_SVH
`define ERROR_TEST_SVH

class error_test extends base_test;
  `uvm_component_utils(error_test)

  function new(string name = "error_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    error_seq seq;
    phase.raise_objection(this);
    seq = error_seq::type_id::create("seq");
    seq.start(m_tb_env.m_apb_agent.m_sequencer);
    #100ns;
    phase.drop_objection(this);
  endtask
endclass : error_test

`endif