`ifndef WGT_LOAD_TEST_SVH
`define WGT_LOAD_TEST_SVH

class wgt_load_test extends base_test;
  `uvm_component_utils(wgt_load_test)

  function new(string name = "wgt_load_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    wgt_load_seq seq;
    phase.raise_objection(this);
    seq = wgt_load_seq::type_id::create("seq");
    if (!seq.randomize()) begin
      `uvm_fatal(get_type_name(), "Randomization failed for wgt_load_seq")
    end
    seq.start(m_tb_env.m_apb_agent.m_sequencer);
    #100ns;
    phase.drop_objection(this);
  endtask
endclass : wgt_load_test

`endif