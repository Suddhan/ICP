// Pad-level wrapper for PULPino SoC

module pulpino_top_pads (
    // Physical Package Pins (The "P" ports of the Faraday Cells)
    input  wire        pad_ref_clk_i,
    input  wire        pad_rst_n_i,
    
    // SPI Slave Interface (For Bootloading)
    input  wire        pad_spi_clk_i,
    input  wire        pad_spi_csn_i,
    input  wire        pad_spi_mosi_i,
    output wire        pad_spi_miso_o,
    
    // UART Interface
    input  wire        pad_uart_rx_i,
    output wire        pad_uart_tx_o,
    
    // GPIO (Bidirectional)
    inout  wire [31:0] pad_gpio_io
);

    // --- 1. Internal Logic Signals (Connects Pads to SoC) ---
    logic        s_clk_internal;
    logic        s_rst_n_internal;
    logic        s_spi_clk_internal;
    logic        s_spi_csn_internal;
    logic        s_spi_mosi_internal;
    logic        s_spi_miso_internal;
    logic        s_uart_rx_internal;
    logic        s_uart_tx_internal;
    
    logic [31:0] s_gpio_in;
    logic [31:0] s_gpio_out;
    logic [31:0] s_gpio_en; // Enable signal from SoC to control Pad direction

    // --- 2. Input Pad Instantiations (PIBI) ---
    PIBI i_pad_ref_clk (.P(pad_ref_clk_i),  .Z(s_clk_internal));
    PIBI i_pad_rst     (.P(pad_rst_n_i),    .Z(s_rst_n_internal));
    PIBI i_pad_spi_clk (.P(pad_spi_clk_i),  .Z(s_spi_clk_internal));
    PIBI i_pad_spi_csn (.P(pad_spi_csn_i),  .Z(s_spi_csn_internal));
    PIBI i_pad_spi_mosi(.P(pad_spi_mosi_i), .Z(s_spi_mosi_internal));
    PIBI i_pad_uart_rx (.P(pad_uart_rx_i),  .Z(s_uart_rx_internal));

    // --- 3. Output Pad Instantiations (POT8 - 8mA drive) ---
    POT8 i_pad_spi_miso (.I(s_spi_miso_internal), .P(pad_spi_miso_o));
    POT8 i_pad_uart_tx  (.I(s_uart_tx_internal),   .P(pad_uart_tx_o));

    // --- 4. Bidirectional GPIO Pads (PDB22DG) ---
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : gen_gpio_pads
            // OEN is usually Active Low for Faraday pads (0 = Output, 1 = Input)
            PDB22DG i_pad_gpio (
                .I(s_gpio_out[i]), 
                .OEN(!s_gpio_en[i]), 
                .P(pad_gpio_io[i]), 
                .C(s_gpio_in[i])
            );
        end
    endgenerate

    // --- 5. The PULPino SoC Instance ---
    pulpino_top i_soc (
        // Clock and Reset
        .clk_i           (s_clk_internal),
        .rst_n           (s_rst_n_internal),
        
        // SWITCHED CLOCK SOURCE: 
        // We tie the internal mux selector to 1 to use ref_clk bypass
        .clk_sel_i       (1'b1), 

        // SPI Slave
        .spi_clk_i       (s_spi_clk_internal),
        .spi_csn_i       (s_spi_csn_internal),
        .spi_mosi_i      (s_spi_mosi_internal),
        .spi_miso_o      (s_spi_miso_internal),

        // UART
        .uart_rx_i       (s_uart_rx_internal),
        .uart_tx_o       (s_uart_tx_internal),

        // GPIO
        .gpio_in_o       (s_gpio_in),
        .gpio_out_i      (s_gpio_out),
        .gpio_dir_i      (s_gpio_en)
    );

endmodule
