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
    inout wire clk,
    inout wire rst_n,

    // JTAG Interface
    inout wire tck_i,
    inout wire trstn_i,
    inout wire tms_i,
    inout wire tdi_i,
    inout wire tdo_o,

    // UART Interface
    inout wire uart_tx,
    inout wire uart_rx,

    // I2C Interface
    inout wire scl_pad_i,
    inout wire sda_pad_i,

    // SPI Slave
    inout wire spi_clk_i,
    inout wire spi_cs_i,
    inout wire spi_sdo0_o,
    inout wire spi_sdi0_i,

    // SPI Master
    inout wire spi_master_clk_o,
    inout wire spi_master_csn0_o,
    inout wire spi_master_sdo0_o,
    inout wire spi_master_sdo1_o,
    inout wire spi_master_sdo2_o,
    inout wire spi_master_sdo3_o,
    inout wire spi_master_sdi0_i,
    inout wire spi_master_sdi1_i,
    inout wire spi_master_sdi2_i,
    inout wire spi_master_sdi3_i,

    // 32 Bidirectional GPIOs
    inout wire [31:0] pad_gpio
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
  wire pad_spis_clk, pad_spis_cs, pad_spis_miso, pad_spis_mosi;
  wire pad_spim_clk, pad_spim_csn0;
  wire pad_spim_sdo0, pad_spim_sdo1, pad_spim_sdo2, pad_spim_sdo3;
  wire pad_spim_sdi0, pad_spim_sdi1, pad_spim_sdi2, pad_spim_sdi3;
  wire [31:0] gpio_in, gpio_out, gpio_dir;

  // Hardwired internal signals for standard boot configuration
  logic clk_sel_i        = 1'b0;
  logic clk_standalone_i = 1'b0;
  logic testmode_i       = 1'b0;
  logic fetch_enable_i   = 1'b1;
  logic scan_enable_i    = 1'b0;
  wire  spi_sdi1_i       = 1'b0;
  wire  spi_sdi2_i       = 1'b0;
  wire  spi_sdi3_i       = 1'b0;
  logic uart_cts         = 1'b0;
  logic uart_dsr         = 1'b0;

  // Internal unconnected outputs that previously went to pads
  logic [1:0]       spi_mode_o;
  logic [1:0]       spi_master_mode_o;
  logic             spi_sdo1_o, spi_sdo2_o, spi_sdo3_o;
  logic             spi_master_csn1_o, spi_master_csn2_o, spi_master_csn3_o;
  logic             uart_rts, uart_dtr;
  logic [31:0][5:0] gpio_padcfg;
  logic [31:0][5:0] pad_cfg_o;
  logic [31:0]      pad_mux_o;

  // ==========================================
  // PHYSICAL PAD INSTANTIATIONS
  // ==========================================

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
  BD2SCARUDQP_1V8_SF_LIN p_i2c_scl (.ZI(pad_i2c_scl), .A(scl_pad_o), .EN(scl_padoen_o), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(scl_pad_i));
  BD2SCARUDQP_1V8_SF_LIN p_i2c_sda (.ZI(pad_i2c_sda), .A(sda_pad_o), .EN(sda_padoen_o), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(sda_pad_i));

  // --- SPI Slave ---
  BD2SCARUDQP_1V8_SF_LIN p_spis_clk  (.ZI(pad_spis_clk),  .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_clk_i));
  BD2SCARUDQP_1V8_SF_LIN p_spis_cs   (.ZI(pad_spis_cs),   .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_cs_i));
  BD2SCARUDQP_1V8_SF_LIN p_spis_mosi (.ZI(pad_spis_mosi), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdi0_i));
  BD2SCARUDQP_1V8_SF_LIN p_spis_miso (.ZI(),           .A(pad_spis_miso), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_sdo0_o));

  // --- SPI Master ---
  BD2SCARUDQP_1V8_SF_LIN p_spim_clk  (.ZI(), .A(pad_spim_clk),  .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_clk_o));
  BD2SCARUDQP_1V8_SF_LIN p_spim_csn  (.ZI(), .A(pad_spim_csn0), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_csn0_o));
  
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo0 (.ZI(), .A(pad_spim_sdo0), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo0_o));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo1 (.ZI(), .A(pad_spim_sdo1), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo1_o));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo2 (.ZI(), .A(pad_spim_sdo2), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo2_o));
  BD8SCARUDQP_1V8_SF_LIN p_spim_sdo3 (.ZI(), .A(pad_spim_sdo3), .EN(Low), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdo3_o));
  
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi0 (.ZI(pad_spim_sdi0), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi0_i));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi1 (.ZI(pad_spim_sdi1), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi1_i));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi2 (.ZI(pad_spim_sdi2), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi2_i));
  BD2SCARUDQP_1V8_SF_LIN p_spim_sdi3 (.ZI(pad_spim_sdi3), .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(spi_master_sdi3_i));

  // --- GPIOs ---
  genvar i;
  generate
      for (i = 0; i < 4; i++) begin : gen_gpio_pads
          BD2SCARUDQP_1V8_SF_LIN p_gpio (
              .ZI(gpio_in[i]), 
              .A(gpio_out[i]), 
              .EN(~gpio_dir[i]), 
              .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), 
              .IO(pad_gpio[i])
          );
      end
  endgenerate
assign gpio_in[31:4] = 28'b0;
 
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
    .spi_mode_o       (         ),
    .spi_sdo0_o       ( pad_spis_miso        ),
    .spi_sdo1_o       (         ),
    .spi_sdo2_o       (         ),
    .spi_sdo3_o       (         ),
    .spi_sdi0_i       ( pad_spis_mosi        ),
    .spi_sdi1_i       (         ),
    .spi_sdi2_i       (         ),
    .spi_sdi3_i       (         ),

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
    .spi_master_mode  (  ),
    .spi_master_sdo0  ( pad_spim_sdo0 ),
    .spi_master_sdo1  ( pad_spim_sdo1 ),
    .spi_master_sdo2  ( pad_spim_sdo2 ),
    .spi_master_sdo3  ( pad_spim_sdo3 ),
    .spi_master_sdi0  ( pad_spim_sdi0 ),
    .spi_master_sdi1  ( pad_spim_sdi1 ),
    .spi_master_sdi2  ( pad_spim_sdi2 ),
    .spi_master_sdi3  ( pad_spim_sdi3 ),

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
    .fetch_enable_i   ( fetch_enable_i    ),
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
