`ifndef OFM_READ_TEST_SVH
`define OFM_READ_TEST_SVH

class ofm_read_test extends base_test;
  `uvm_component_utils(ofm_read_test)

  function new(string name = "ofm_read_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ofm_read_seq seq;
    phase.raise_objection(this);
    seq = ofm_read_seq::type_id::create("seq");
    seq.start(m_tb_env.m_apb_agent.m_sequencer);
    #100ns;
    phase.drop_objection(this);
  endtask
endclass : ofm_read_test

`endif