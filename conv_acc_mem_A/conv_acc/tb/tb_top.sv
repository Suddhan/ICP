//------------------------------------------------------------------------------
//
// This module is a top-level module for the TB with the conv accelerator DUT
//
// It instantiates all of the uVC interface instances and connects them to the RTL top.
// It also initializes the UVM test environment and runs the test and
// it creates the default top-level test configuration.
//
// The testbench uses the following uVC interfaces:
// - CLOCK IF: Generates a system clock.
// - RESET IF: Generates the reset signal.
// - APB IF: Drives and monitors the APB3 slave port of the DUT
//
//------------------------------------------------------------------------------
module tb_top;

    // Include basic packages
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Include optional packages
    import tb_pkg::*;

    // uVC TB signal variables 
    logic tb_clock;
    logic tb_reset_n;
    logic tb_psel;
    logic tb_penable;
    logic tb_pwrite;
    logic [11:0] tb_paddr;
    logic [31:0] tb_pwdata;
    logic [31:0] tb_prdata;
    logic tb_pready;
    logic tb_pslverr;

    // Instantiation of CLOCK uVC interface signal
    clock_if  i_clock_if();
    assign tb_clock = i_clock_if.clock;

    // Instantiation of RESET uVC interface signal
    reset_if  i_reset_if(.clk(tb_clock));
    assign tb_reset_n = i_reset_if.reset_n;

    // Instantiation of APB uVC interface signal
    apb_if  i_apb_if(.clk(tb_clock),.rst_n(tb_reset_n));
    assign tb_psel = i_apb_if.psel;
    assign tb_penable = i_apb_if.penable;
    assign tb_pwrite = i_apb_if.pwrite;
    assign tb_paddr = i_apb_if.paddr;
    assign tb_pwdata = i_apb_if.pwdata;
    assign i_apb_if.prdata = tb_prdata;
    assign i_apb_if.pready = tb_pready;
    assign i_apb_if.pslverr = tb_pslverr;

    // Instantiation of the CONV_TOP RTL top
    conv_top conv_top_dut 
    (
        .PCLK(tb_clock),
        .PRESETn(tb_reset_n),
        .PSEL(tb_psel),
        .PENABLE(tb_penable),
        .PWRITE(tb_pwrite),
        .PADDR(tb_paddr),
        .PWDATA(tb_pwdata),
        .PRDATA(tb_prdata),
        .PREADY(tb_pready),
        .PSLVERR(tb_pslverr)
    );

    // Initialize TB configuration
    initial begin
        top_config  m_top_config;
        // Create TB top configuration and store it into UVM config DB.
        m_top_config = new("m_top_config");
        uvm_config_db #(top_config)::set(null,"tb_top","top_config", m_top_config);
        // Save all virtual interface instances into configuration
        m_top_config.m_clock_config.m_vif = i_clock_if;
        m_top_config.m_reset_config.m_vif = i_reset_if;
        m_top_config.m_apb_config.m_vif = i_apb_if;
    end

    // Start UVM test_base environment
    initial begin
        run_test();
    end

endmodule
