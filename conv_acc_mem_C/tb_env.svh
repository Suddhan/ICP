//------------------------------------------------------------------------------
// tb_env class
//
// This class represents the environment of the TB (Test Bench) which is
// composed by the different agents and the scoreboard
// The environment is initialized by getting the TB configuration from the UVM
// database and then creating all the components
//
// The environment connects the monitor analysis ports of the agents to the
// scoreboard
//
//------------------------------------------------------------------------------
`ifndef TB_ENV_SVH
`define TB_ENV_SVH

class tb_env extends uvm_env;
  `uvm_component_utils(tb_env)

  top_config    m_top_config;
  clock_agent   m_clock_agent;
  reset_agent   m_reset_agent;
  apb_agent     m_apb_agent;
  scoreboard    m_scoreboard;
  conv_coverage m_conv_coverage;

  function new(string name = "tb_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(top_config)::get(this, "", "top_config", m_top_config) &&
        !uvm_config_db#(top_config)::get(null, "tb_top", "top_config", m_top_config)) begin
      `uvm_fatal(get_type_name(), "Cannot find top_config in uvm_config_db")
    end

    uvm_config_db#(clock_config)::set(this, "m_clock_agent*", "config", m_top_config.m_clock_config);
    uvm_config_db#(reset_config)::set(this, "m_reset_agent*", "config", m_top_config.m_reset_config);
    uvm_config_db#(apb_config)::set(this, "m_apb_agent*", "config", m_top_config.m_apb_config);

    m_clock_agent   = clock_agent::type_id::create("m_clock_agent", this);
    m_reset_agent   = reset_agent::type_id::create("m_reset_agent", this);
    m_apb_agent     = apb_agent::type_id::create("m_apb_agent", this);
    m_scoreboard    = scoreboard::type_id::create("m_scoreboard", this);
    m_conv_coverage = conv_coverage::type_id::create("m_conv_coverage", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_apb_agent.m_monitor.m_analysis_port.connect(m_scoreboard.analysis_export);
    m_apb_agent.m_monitor.m_analysis_port.connect(m_conv_coverage.analysis_export);
  endfunction

endclass : tb_env

`endif