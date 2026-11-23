`ifndef FULL_CONV_TEST_SVH
`define FULL_CONV_TEST_SVH

class full_conv_test extends base_test;
  `uvm_component_utils(full_conv_test)

  function new(string name = "full_conv_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    full_conv_seq seq;
    phase.raise_objection(this);
    seq = full_conv_seq::type_id::create("seq");
    seq.start(m_tb_env.m_apb_agent.m_sequencer);
    #200ns;
    phase.drop_objection(this);
  endtask
endclass : full_conv_test

`endif