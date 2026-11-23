//------------------------------------------------------------------------------
// Class base_test
// 
// Base class for all UVM test derived from uvm_test
// 
// This class contains the basic structure of UVM test class and provides some
// basic sequence and environment to make it easier for users to create
// test cases.
// 
// This class includes:
//  - base_test: Base class for all UVM test derived from uvm_test
//  - base_test::build_phase: Function to build the class within UVM build phase
//  - base_test::run_phase: Start UVM test in running phase
// 
// This class is a part of the test library.
// 
//------------------------------------------------------------------------------
`ifndef BASE_TEST_SVH
`define BASE_TEST_SVH

class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  top_config m_top_config;
  tb_env     m_tb_env;

  function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(top_config)::get(this, "", "top_config", m_top_config) &&
        !uvm_config_db#(top_config)::get(null, "tb_top", "top_config", m_top_config)) begin
      `uvm_fatal(get_name(), "Cannot find <top_config> TB configuration!")
    end

    m_tb_env = tb_env::type_id::create("m_tb_env", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_name(), $sformatf("Starting test: '%s'", get_name()), UVM_LOW)
  endtask

endclass : base_test

`endif
