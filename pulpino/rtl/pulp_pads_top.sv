`timescale 1ns / 1ps

module pulpino_chip (
    // Clock and Reset
    inout wire pad_clk,
    inout wire pad_rst_n,

    // JTAG Interface
    inout wire pad_jtag_tck,
    inout wire pad_jtag_trstn,
    inout wire pad_jtag_tms,
    inout wire pad_jtag_tdi,
    inout wire pad_jtag_tdo,

    // UART Interface
    inout wire pad_uart_tx,
    inout wire pad_uart_rx,
    
    // I2C Interface
    inout wire pad_i2c_scl,
    inout wire pad_i2c_sda,

    // SPI Slave (For programming/debugging the SoC)
    inout wire pad_spis_clk,
    inout wire pad_spis_cs,
    inout wire pad_spis_miso, // mapped to sdo0
    inout wire pad_spis_mosi, // mapped to sdi0

    // SPI Master (For external SPI Flash)
    inout wire pad_spim_clk,
    inout wire pad_spim_csn0,
    inout wire pad_spim_sdo0,
    inout wire pad_spim_sdo1,
    inout wire pad_spim_sdo2,
    inout wire pad_spim_sdo3,
    inout wire pad_spim_sdi0,
    inout wire pad_spim_sdi1,
    inout wire pad_spim_sdi2,
    inout wire pad_spim_sdi3,

    // 32 Bidirectional GPIOs
    inout wire [31:0] pad_gpio
);

    // ==========================================
    // 1. PAD CONSTANTS
    // ==========================================
    wire High     = 1'b1;
    wire Low      = 1'b0;
    wire DontCare = 1'b0;

    // ==========================================
    // 2. INTERNAL CORE WIRES
    // ==========================================
    wire c_clk, c_rst_n;
    wire c_jtag_tck, c_jtag_trstn, c_jtag_tms, c_jtag_tdi, c_jtag_tdo;
    wire c_uart_tx, c_uart_rx;
    wire c_i2c_scl_i, c_i2c_scl_o, c_i2c_scl_oen;
    wire c_i2c_sda_i, c_i2c_sda_o, c_i2c_sda_oen;
    wire c_spis_clk, c_spis_cs, c_spis_miso, c_spis_mosi;
    wire c_spim_clk, c_spim_csn0;
    wire c_spim_sdo0, c_spim_sdo1, c_spim_sdo2, c_spim_sdo3;
    wire c_spim_sdi0, c_spim_sdi1, c_spim_sdi2, c_spim_sdi3;
    
    wire [31:0] c_gpio_in;
    wire [31:0] c_gpio_out;
    wire [31:0] c_gpio_dir;

    // ==========================================
    // 3. PHYSICAL PAD INSTANTIATIONS
    // ==========================================

    // --- Clock & Reset (Inputs) ---
    BD2SCARUDQP_1V8_SF_LIN p_clk     (.ZI(c_clk),    .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_clk));
    BD2SCARUDQP_1V8_SF_LIN p_rst_n   (.ZI(c_rst_n),  .A(DontCare), .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_rst_n));

    // --- JTAG ---
    BD2SCARUDQP_1V8_SF_LIN p_tck     (.ZI(c_jtag_tck),   .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_jtag_tck));
    BD2SCARUDQP_1V8_SF_LIN p_trstn   (.ZI(c_jtag_trstn), .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_jtag_trstn));
    BD2SCARUDQP_1V8_SF_LIN p_tms     (.ZI(c_jtag_tms),   .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_jtag_tms));
    BD2SCARUDQP_1V8_SF_LIN p_tdi     (.ZI(c_jtag_tdi),   .A(DontCare),   .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_jtag_tdi));
    BD2SCARUDQP_1V8_SF_LIN p_tdo     (.ZI(),             .A(c_jtag_tdo), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_jtag_tdo));

    // --- UART ---
    BD2SCARUDQP_1V8_SF_LIN p_uart_tx (.ZI(),          .A(c_uart_tx), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_uart_tx));
    BD2SCARUDQP_1V8_SF_LIN p_uart_rx (.ZI(c_uart_rx), .A(DontCare),  .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_uart_rx));

    // --- I2C (Bidirectional Open-Drain) ---
    // Note: I2C padoen from PULPino is active-low (0 = output enabled)
    BD2SCARUDQP_1V8_SF_LIN p_i2c_scl (.ZI(c_i2c_scl_i), .A(c_i2c_scl_o), .EN(c_i2c_scl_oen), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_i2c_scl));
    BD2SCARUDQP_1V8_SF_LIN p_i2c_sda (.ZI(c_i2c_sda_i), .A(c_i2c_sda_o), .EN(c_i2c_sda_oen), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_i2c_sda));

    // --- SPI Slave (Programming Interface) ---
    BD2SCARUDQP_1V8_SF_LIN p_spis_clk  (.ZI(c_spis_clk),  .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spis_clk));
    BD2SCARUDQP_1V8_SF_LIN p_spis_cs   (.ZI(c_spis_cs),   .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spis_cs));
    BD2SCARUDQP_1V8_SF_LIN p_spis_mosi (.ZI(c_spis_mosi), .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spis_mosi));
    BD2SCARUDQP_1V8_SF_LIN p_spis_miso (.ZI(),            .A(c_spis_miso), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spis_miso));

    // --- SPI Master (Flash Interface - Using 8mA drive for outputs) ---
    BD2SCARUDQP_1V8_SF_LIN p_spim_clk  (.ZI(),             .A(c_spim_clk),  .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_clk));
    BD2SCARUDQP_1V8_SF_LIN p_spim_csn  (.ZI(),             .A(c_spim_csn0), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_csn0));
    
    BD8SCARUDQP_1V8_SF_LIN p_spim_sdo0 (.ZI(),             .A(c_spim_sdo0), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdo0));
    BD8SCARUDQP_1V8_SF_LIN p_spim_sdo1 (.ZI(),             .A(c_spim_sdo1), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdo1));
    BD8SCARUDQP_1V8_SF_LIN p_spim_sdo2 (.ZI(),             .A(c_spim_sdo2), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdo2));
    BD8SCARUDQP_1V8_SF_LIN p_spim_sdo3 (.ZI(),             .A(c_spim_sdo3), .EN(Low),  .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdo3));
    
    BD2SCARUDQP_1V8_SF_LIN p_spim_sdi0 (.ZI(c_spim_sdi0),  .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdi0));
    BD2SCARUDQP_1V8_SF_LIN p_spim_sdi1 (.ZI(c_spim_sdi1),  .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdi1));
    BD2SCARUDQP_1V8_SF_LIN p_spim_sdi2 (.ZI(c_spim_sdi2),  .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdi2));
    BD2SCARUDQP_1V8_SF_LIN p_spim_sdi3 (.ZI(c_spim_sdi3),  .A(DontCare),    .EN(High), .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), .IO(pad_spim_sdi3));

    // --- GPIOs (Bidirectional) ---
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : gen_gpio_pads
            // PULPino gpio_dir: 1 = output, 0 = input
            // Pad EN: Low = output, High = input
            // Therefore, EN = ~c_gpio_dir
            BD2SCARUDQP_1V8_SF_LIN p_gpio (
                .ZI(c_gpio_in[i]), 
                .A(c_gpio_out[i]), 
                .EN(~c_gpio_dir[i]), 
                .TA(DontCare), .TEN(DontCare), .TM(Low), .PUN(High), .PDN(High), .HYST(Low), 
                .IO(pad_gpio[i])
            );
        end
    endgenerate

    // ==========================================
    // 4. POWER, GROUND AND CORNER PADS
    // ==========================================
    // DO NOT FORGET to add your physical library's power pads here before PnR!
    // Example:
    // PVDD_PAD pvdd_1 (); 
    // PVSS_PAD pvss_1 ();
    // PCORNER_PAD corner_1 ();

    // ==========================================
    // 5. PULPINO CORE INSTANTIATION
    // ==========================================
    pulpino_top #(
        .USE_ZERO_RISCY(0),
        .RISCY_RV32F(0),
        .ZERO_RV32M(1),
        .ZERO_RV32E(0)
    ) i_core (
        .clk               (c_clk),
        .rst_n             (c_rst_n),

        // Hardwired configurations for standard boot
        .clk_sel_i         (1'b0),
        .clk_standalone_i  (1'b0),
        .testmode_i        (1'b0),
        .fetch_enable_i    (1'b1),
        .scan_enable_i     (1'b0),

        // SPI Slave (Programming)
        .spi_clk_i         (c_spis_clk),
        .spi_cs_i          (c_spis_cs),
        .spi_sdi0_i        (c_spis_mosi),
        .spi_sdi1_i        (1'b0),
        .spi_sdi2_i        (1'b0),
        .spi_sdi3_i        (1'b0),
        .spi_sdo0_o        (c_spis_miso),
        .spi_sdo1_o        (),
        .spi_sdo2_o        (),
        .spi_sdo3_o        (),
        .spi_mode_o        (),

        // SPI Master (Flash)
        .spi_master_clk_o  (c_spim_clk),
        .spi_master_csn0_o (c_spim_csn0),
        .spi_master_csn1_o (),
        .spi_master_csn2_o (),
        .spi_master_csn3_o (),
        .spi_master_sdo0_o (c_spim_sdo0),
        .spi_master_sdo1_o (c_spim_sdo1),
        .spi_master_sdo2_o (c_spim_sdo2),
        .spi_master_sdo3_o (c_spim_sdo3),
        .spi_master_sdi0_i (c_spim_sdi0),
        .spi_master_sdi1_i (c_spim_sdi1),
        .spi_master_sdi2_i (c_spim_sdi2),
        .spi_master_sdi3_i (c_spim_sdi3),
        .spi_master_mode_o (),

        // I2C
        .scl_pad_i         (c_i2c_scl_i),
        .scl_pad_o         (c_i2c_scl_o),
        .scl_padoen_o      (c_i2c_scl_oen),
        .sda_pad_i         (c_i2c_sda_i),
        .sda_pad_o         (c_i2c_sda_o),
        .sda_padoen_o      (c_i2c_sda_oen),

        // UART
        .uart_tx           (c_uart_tx),
        .uart_rx           (c_uart_rx),
        .uart_rts          (),
        .uart_dtr          (),
        .uart_cts          (1'b0),
        .uart_dsr          (1'b0),

        // GPIO
        .gpio_in           (c_gpio_in),
        .gpio_out          (c_gpio_out),
        .gpio_dir          (c_gpio_dir),
        .gpio_padcfg       (), // Pad config outputs are ignored dynamically here

        // JTAG
        .tck_i             (c_jtag_tck),
        .trstn_i           (c_jtag_trstn),
        .tms_i             (c_jtag_tms),
        .tdi_i             (c_jtag_tdi),
        .tdo_o             (c_jtag_tdo),

        // Extra config outputs (unconnected)
        .pad_cfg_o         (),
        .pad_mux_o         ()
    );

endmodule
