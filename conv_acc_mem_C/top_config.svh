//------------------------------------------------------------------------------
// top_config class
//
// Top level configuration object for top level component.
// This class is intended to be used by the UVM configuration database.
//
// It contains the configuration objects for each agent in the system and
// configures them appropriately for the test.
//
//------------------------------------------------------------------------------
`ifndef TOP_CONFIG_SVH
`define TOP_CONFIG_SVH

class top_config extends uvm_object;
  `uvm_object_utils(top_config)

  clock_config m_clock_config;
  reset_config m_reset_config;
  apb_config   m_apb_config;

  function new(string name = "top_config");
    super.new(name);

    m_clock_config = clock_config::type_id::create("m_clock_config");
    m_clock_config.is_active = 1;
    m_clock_config.clock_period = 10;

    m_reset_config = reset_config::type_id::create("m_reset_config");
    m_reset_config.is_active = 1;
    m_reset_config.has_monitor = 1;

    m_apb_config = apb_config::type_id::create("m_apb_config");
    m_apb_config.is_active = UVM_ACTIVE;
    m_apb_config.has_monitor = 1;
  endfunction

endclass : top_config

`endif
