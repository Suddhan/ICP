`ifndef IFM_BACKPRESSURE_TEST_SVH
`define IFM_BACKPRESSURE_TEST_SVH

class ifm_backpressure_test extends base_test;
  `uvm_component_utils(ifm_backpressure_test)

  function new(string name = "ifm_backpressure_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ifm_backpressure_seq seq;
    phase.raise_objection(this);
    seq = ifm_backpressure_seq::type_id::create("seq");
    seq.start(m_tb_env.m_apb_agent.m_sequencer);
    #100ns;
    phase.drop_objection(this);
  endtask
endclass : ifm_backpressure_test

`endif