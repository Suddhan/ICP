`include "axi_bus.sv"
`include "debug_bus.sv"

`define AXI_ADDR_WIDTH         32
`define AXI_DATA_WIDTH         32
`define AXI_ID_MASTER_WIDTH     2
`define AXI_ID_SLAVE_WIDTH      4
`define AXI_USER_WIDTH          1

module pulpino_top
  #(
    parameter USE_ZERO_RISCY       = 0,
    parameter RISCY_RV32F          = 0,
    parameter ZERO_RV32M           = 1,
    parameter ZERO_RV32E           = 0
  )
  (
    // Clock and Reset (Physical Pads)
    input wire clk,
    input wire rst_n,

    // JTAG Interface
    input wire tck_i,
    input wire trstn_i,
    input wire tms_i,
    input wire tdi_i,
    output wire tdo_o,

    // UART Interface
    output wire uart_tx,
    input wire uart_rx,

    // I2C Interface
    input wire scl_pad_i,
    input wire sda_pad_i,

    // SPI Slave
    input wire spi_clk_i,
    input wire spi_cs_i,
    output wire spi_sdo0_o,
    output wire spi_sdo1_o,
    output wire spi_sdo2_o,
    output wire spi_sdo3_o,
    input wire spi_sdi0_i,
    input wire spi_sdi1_i,
    input wire spi_sdi2_i,
    input wire spi_sdi3_i,
	output wire [1:0] spi_mode_o,
	//output wire use_qspi,
	input fetch_enable_i,

    // 32 Bidirectional GPIOs
	output pad_gpio
  );

  // ==========================================
  // PAD CONSTANTS
  // ==========================================
  wire High     = 1'b1;
  wire Low      = 1'b0;
  wire DontCare = 1'b0;

  // ==========================================
  // INTERNAL CORE WIRES (Previously ports)
  // ==========================================
  wire pad_clk, pad_rst_n;
  wire pad_jtag_tck, pad_jtag_trstn, pad_jtag_tms, pad_jtag_tdi, pad_jtag_tdo;
  wire pad_uart_tx, pad_uart_rx;
  wire pad_i2c_scl, scl_pad_o, scl_padoen_o;
  wire pad_i2c_sda, sda_pad_o, sda_padoen_o;
  wire pad_spis_clk, pad_spis_cs, pad_spi_sdi1_i, pad_spi_sdi0_i, pad_spi_sdi2_i, pad_spi_sdi3_i, pad_spi_sdo0_o, pad_spi_sdo1_o, pad_spi_sdo2_o, pad_spi_sdo3_o, pad_fetch_enable_i;
  //wire pad_spim_clk, pad_spim_csn0;
  //wire pad_spim_sdo0, pad_spim_sdo1, pad_spim_sdo2, pad_spim_sdo3;
  //wire pad_spim_sdi0, pad_spim_sdi1, pad_spim_sdi2, pad_spim_sdi3;
  logic [31:0]gpio_in;
  logic [31:0] gpio_dir;
  wire [1:0] pad_spi_mode_o;
  //wire [1:0] pad_spi_master_mode_o;
  /*  //SPI Master
    inout wire spi_master_clk,
    inout wire spi_master_csn0,
	inout wire [1:0] spi_master_mode,
    inout wire spi_master_sdo0,
    inout wire spi_master_sdo1,
    inout wire spi_master_sdo2,
    inout wire spi_master_sdo3,
    inout wire spi_master_sdi0,
    inout wire spi_master_sdi1,
    inout wire spi_master_sdi2,
    inout wire spi_master_sdi3,*/


  // Hardwired internal signals for standard boot configuration
  logic clk_sel_i        = 1'b0;
  logic clk_standalone_i = 1'b0;
  logic testmode_i       = 1'b0;
  logic [31:0] gpio_out;

  logic scan_enable_i    = 1'b0;
  /*wire  spi_sdi1_i       = 1'b0;
  wire  spi_sdi2_i       = 1'b0;
  wire  spi_sdi3_i       = 1'b0;*/
  logic uart_cts         = 1'b0;
  logic uart_dsr         = 1'b0;

  // Internal unconnected outputs that previously went to pads

  //logic             spi_sdo1_o, spi_sdo2_o, spi_sdo3_o;
  logic             spi_master_csn1_o, spi_master_csn2_o, spi_master_csn3_o;
  logic             uart_rts, uart_dtr;
  logic [31:0][5:0] gpio_padcfg;
  logic [31:0][5:0] pad_cfg_o;
  logic [31:0]      pad_mux_o;

  // ==========================================
  // PHYSICAL PAD INSTANTIATIONS
  // ==========================================
// input_pad_conf (ZI,      A,  EN,    TA,  TEN,  TM,   PUN,    PDN,    HYST, IO         )
//                (toCore,  -,  High,  -,   -,    Low,  High,   High,   Low,  fromOutside)

// output_pad_conf (ZI,            A,         EN,    TA,  TEN,  TM,    PUN,    PDN,   HYST, IO       )
//                 (unconnected,   fromCore,  Low,   -,   -,    Low,   High,   High,  Low,  toOutside)
  // --- Clock & Reset (Inputs) ---
  BD2SCARUDQP_1V8_SF_LIN p_clk     (.ZI(pad_clk),      .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(clk));
  BD2SCARUDQP_1V8_SF_LIN p_rst_n   (.ZI(pad_rst_n),    .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(rst_n));

  // --- JTAG ---
  BD2SCARUDQP_1V8_SF_LIN p_tck     (.ZI(pad_jtag_tck),    .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(tck_i));
  BD2SCARUDQP_1V8_SF_LIN p_trstn   (.ZI(pad_jtag_trstn),  .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(trstn_i));
  BD2SCARUDQP_1V8_SF_LIN p_tms     (.ZI(pad_jtag_tms),    .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(tms_i));
  BD2SCARUDQP_1V8_SF_LIN p_tdi     (.ZI(pad_jtag_tdi),    .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(tdi_i));
  BD2SCARUDQP_1V8_SF_LIN p_tdo     (.ZI(),         .A(pad_jtag_tdo),    .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(tdo_o));

  // --- UART ---
  BD2SCARUDQP_1V8_SF_LIN p_uart_tx (.ZI(),         .A(pad_uart_tx),  .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(uart_tx));
  BD2SCARUDQP_1V8_SF_LIN p_uart_rx (.ZI(pad_uart_rx),  .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(uart_rx));

  // --- I2C ---
  /*BD2SCARUDQP_1V8_SF_LIN p_i2c_scl (.ZI(pad_i2c_scl), .A(scl_pad_o), .EN(scl_padoen_o), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(scl_pad_i));
  BD2SCARUDQP_1V8_SF_LIN p_i2c_sda (.ZI(pad_i2c_sda), .A(sda_pad_o), .EN(sda_padoen_o), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(sda_pad_i));*/

  // --- SPI Slave ---
  BD2SCARUDQP_1V8_SF_LIN p_spis_clk  (.ZI(pad_spis_clk),  .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_clk_i));
  BD2SCARUDQP_1V8_SF_LIN p_spis_cs   (.ZI(pad_spis_cs),   .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_cs_i));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdi0_i (.ZI(pad_spi_sdi0_i), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdi0_i));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdi1_i (.ZI(pad_spi_sdi1_i), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdi1_i));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdi2_i (.ZI(pad_spi_sdi2_i), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdi2_i));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdi3_i (.ZI(pad_spi_sdi3_i), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdi3_i));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdo0_o (.ZI(), .A(pad_spi_sdo0_o),   .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdo0_o));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdo1_o (.ZI(), .A(pad_spi_sdo1_o),   .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdo1_o));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdo2_o (.ZI(), .A(pad_spi_sdo2_o),   .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdo2_o));
  BD2SCARUDQP_1V8_SF_LIN p_spi_sdo3_o (.ZI(), .A(pad_spi_sdo3_o),   .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdo3_o));
  BD2SCARUDQP_1V8_SF_LIN p_spis_mode0 (.ZI(),           .A(pad_spi_mode_o[0]), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_mode_o[0]));
  BD2SCARUDQP_1V8_SF_LIN p_spis_mode1 (.ZI(),           .A(pad_spi_mode_o[1]), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_mode_o[1]));
  //BD2SCARUDQP_1V8_SF_LIN p_spis_miso (.ZI(),           .A(pad_use_qspi), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(use_qspi));
  BD2SCARUDQP_1V8_SF_LIN p_fetch_enable_i  (.ZI(pad_fetch_enable_i),  .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(fetch_enable_i));

  // --- SPI Master ---
  /*BD2SCARUDQP_1V8_SF_LIN p_spim_clk  (.ZI(), .A(pad_spim_clk),  .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_clk));
  BD2SCARUDQP_1V8_SF_LIN p_spim_csn  (.ZI(), .A(pad_spim_csn0), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_csn0));
  BD2SCARUDQP_1V8_SF_LIN p_spim_mode0 (.ZI(),           .A(pad_spi_master_mode_o[0]), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_mode[0]));
  BD2SCARUDQP_1V8_SF_LIN p_spim_mode1 (.ZI(),           .A(pad_spi_master_mode_o[1]), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_mode[1]));

  
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo0 (.ZI(), .A(pad_spim_sdo0), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo0));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo1 (.ZI(), .A(pad_spim_sdo1), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo1));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo2 (.ZI(), .A(pad_spim_sdo2), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo2));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo3 (.ZI(), .A(pad_spim_sdo3), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo3));
  
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi0 (.ZI(pad_spim_sdi0), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi0));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi1 (.ZI(pad_spim_sdi1), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi1));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi2 (.ZI(pad_spim_sdi2), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi2));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi3 (.ZI(pad_spim_sdi3), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi3));*/


//  BD2SCARUDQP_1V8_SF_LIN p_gpio_8 (.ZI(gpio_in), .A(gpio_out), .EN(~gpio_dir), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_gpio));
  BD2SCARUDQP_1V8_SF_LIN p_gpio_8 (.ZI(), .A(gpio_out[8]), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_gpio));

 
  // ==========================================
  // ORIGINAL CORE LOGIC
  // ==========================================
  logic        clk_int;
  logic        fetch_enable_int;
  logic        core_busy_int;
  logic        clk_gate_core_int;
  logic [31:0] irq_to_core_int;

  logic        lock_fll_int;
  logic        cfgreq_fll_int;
  logic        cfgack_fll_int;
  logic [1:0]  cfgad_fll_int;
  logic [31:0] cfgd_fll_int;
  logic [31:0] cfgq_fll_int;
  logic        cfgweb_n_fll_int;
  logic        rstn_int;
  logic [31:0] boot_addr_int;

  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH     ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH     ),
    .AXI_ID_WIDTH   ( `AXI_ID_SLAVE_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH     )
  )
  slaves[2:0]();

  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  masters[2:0]();

  DEBUG_BUS
  debug();

  //----------------------------------------------------------------------------//
  // Clock and reset generation
  //----------------------------------------------------------------------------//
  clk_rst_gen
  clk_rst_gen_i
  (
      .clk_i            ( pad_clk              ),
      .rstn_i           ( pad_rst_n            ),

      .clk_sel_i        ( clk_sel_i        ),   
      .clk_standalone_i ( clk_standalone_i ),
      .testmode_i       ( testmode_i       ),
      .scan_i           ( 1'b0             ),
      .scan_o           (                  ),
      .scan_en_i        ( scan_enable_i    ),

      .fll_req_i        ( cfgreq_fll_int   ),
      .fll_wrn_i        ( cfgweb_n_fll_int ),
      .fll_add_i        ( cfgad_fll_int    ),
      .fll_data_i       ( cfgd_fll_int     ),
      .fll_ack_o        ( cfgack_fll_int   ),
      .fll_r_data_o     ( cfgq_fll_int     ),
      .fll_lock_o       ( lock_fll_int     ),

      .clk_o            ( clk_int          ),
      .rstn_o           ( rstn_int         )
    );

  //----------------------------------------------------------------------------//
  // Core region
  //----------------------------------------------------------------------------//
  core_region
  #(
    .AXI_ADDR_WIDTH       ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH       ( `AXI_DATA_WIDTH      ),
    .AXI_ID_MASTER_WIDTH  ( `AXI_ID_MASTER_WIDTH ),
    .AXI_ID_SLAVE_WIDTH   ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_USER_WIDTH       ( `AXI_USER_WIDTH      ),
    .USE_ZERO_RISCY       (  USE_ZERO_RISCY      ),
    .RISCY_RV32F          (  RISCY_RV32F         ),
    .ZERO_RV32M           (  ZERO_RV32M          ),
    .ZERO_RV32E           (  ZERO_RV32E          )
  )
  core_region_i
  (
    .clk            ( clk_int           ),
    .rst_n          ( rstn_int          ),

    .testmode_i     ( testmode_i        ),
    .fetch_enable_i ( fetch_enable_int  ),
    .irq_i          ( irq_to_core_int   ),
    .core_busy_o    ( core_busy_int     ),
    .clock_gating_i ( clk_gate_core_int ),
    .boot_addr_i    ( boot_addr_int     ),

    .core_master    ( masters[0]        ),
    .dbg_master     ( masters[1]        ),
    .data_slave     ( slaves[1]         ),
    .instr_slave    ( slaves[0]         ),
    .debug          ( debug             ),

    .tck_i          ( pad_jtag_tck             ),
    .trstn_i        ( pad_jtag_trstn           ),
    .tms_i          ( pad_jtag_tms             ),
    .tdi_i          ( pad_jtag_tdi             ),
    .tdo_o          ( pad_jtag_tdo             )
  );

  //----------------------------------------------------------------------------//
  // Peripherals
  //----------------------------------------------------------------------------//
  peripherals
  #(
    .AXI_ADDR_WIDTH      ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH      ( `AXI_DATA_WIDTH      ),
    .AXI_SLAVE_ID_WIDTH  ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_MASTER_ID_WIDTH ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH      ( `AXI_USER_WIDTH      )
  )
  peripherals_i
  (
    .clk_i            ( clk_int           ),
    .rst_n            ( rstn_int          ),

    .axi_spi_master   ( masters[2]        ),
    .debug            ( debug             ),

    .spi_clk_i        ( pad_spis_clk         ),
    .testmode_i       ( testmode_i        ),
    .spi_cs_i         ( pad_spis_cs          ),
    .spi_mode_o       ( pad_spi_mode_o        ),
    .spi_sdo0_o       ( pad_spi_sdo0_o        ),
    .spi_sdo1_o       ( pad_spi_sdo1_o        ),
    .spi_sdo2_o       ( pad_spi_sdo2_o        ),
    .spi_sdo3_o       ( pad_spi_sdo3_o        ),
    .spi_sdi0_i       ( pad_spi_sdi0_i        ),
    .spi_sdi1_i       ( pad_spi_sdi1_i        ),
    .spi_sdi2_i       ( pad_spi_sdi2_i        ),
    .spi_sdi3_i       ( pad_spi_sdi3_i        ),

    .slave            ( slaves[2]         ),

    .uart_tx          ( pad_uart_tx           ),
    .uart_rx          ( pad_uart_rx           ),
    .uart_rts         (           ),
    .uart_dtr         (           ),
    .uart_cts         (           ),
    .uart_dsr         (           ),

    .spi_master_clk   ( pad_spim_clk  ),
    .spi_master_csn0  ( pad_spim_csn0 ),
    .spi_master_csn1  (  ),
    .spi_master_csn2  (  ),
    .spi_master_csn3  (  ),
    .spi_master_mode  (  ),//pad_spi_master_mode_o
    .spi_master_sdo0  (  ),//pad_spim_sdo0
    .spi_master_sdo1  (  ),//pad_spim_sdo1
    .spi_master_sdo2  (  ),//pad_spim_sdo2
    .spi_master_sdo3  (  ),//pad_spim_sdo2
    .spi_master_sdi0  (  ),//pad_spim_sdi0
    .spi_master_sdi1  (  ),//pad_spim_sdi1
    .spi_master_sdi2  (  ),//pad_spim_sdi2
    .spi_master_sdi3  (  ),//pad_spim_sdi3

    .scl_pad_i        ( pad_i2c_scl         ),
    .scl_pad_o        ( scl_pad_o         ),
    .scl_padoen_o     ( scl_padoen_o      ),
    .sda_pad_i        ( pad_i2c_sda         ),
    .sda_pad_o        ( sda_pad_o         ),
    .sda_padoen_o     ( sda_padoen_o      ),

    .gpio_in          ( gpio_in           ),
    .gpio_out         ( gpio_out          ),
    .gpio_dir         ( gpio_dir          ),
    .gpio_padcfg      (        ),

    .core_busy_i      ( core_busy_int     ),
    .irq_o            ( irq_to_core_int   ),
    .fetch_enable_i   ( pad_fetch_enable_i    ),
    .fetch_enable_o   ( fetch_enable_int  ),
    .clk_gate_core_o  ( clk_gate_core_int ),

    .fll1_req_o       ( cfgreq_fll_int    ),
    .fll1_wrn_o       ( cfgweb_n_fll_int  ),
    .fll1_add_o       ( cfgad_fll_int     ),
    .fll1_wdata_o     ( cfgd_fll_int      ),
    .fll1_ack_i       ( cfgack_fll_int    ),
    .fll1_rdata_i     ( cfgq_fll_int      ),
    .fll1_lock_i      ( lock_fll_int      ),
    .pad_cfg_o        ( pad_cfg_o         ),
    .pad_mux_o        ( pad_mux_o         ),
    .boot_addr_o      ( boot_addr_int     )
  );

  //----------------------------------------------------------------------------//
  // Axi node
  //----------------------------------------------------------------------------//
  axi_node_intf_wrap
  #(
    .NB_MASTER      ( 3                    ),
    .NB_SLAVE       ( 3                    ),
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  axi_interconnect_i
  (
    .clk       ( clk_int    ),
    .rst_n     ( rstn_int   ),
    .test_en_i ( testmode_i ),

    .master    ( slaves     ),
    .slave     ( masters    ),

    .start_addr_i ( { 32'h1A10_0000, 32'h0010_0000, 32'h0000_0000 } ),
    .end_addr_i   ( { 32'h1A11_FFFF, 32'h001F_FFFF, 32'h000F_FFFF } )
  );

endmodule
