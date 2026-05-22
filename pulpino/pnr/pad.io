version: 3

# ================================================ #
# CORNERS
# ================================================ #
Orient: R0
Pad: PcornerLL SW CORNERCELL_ST_SF_LIN
Orient: R0
Pad: PcornerLR SE CORNERCELL_ST_SF_LIN
Orient: R0
Pad: PcornerUR NE CORNERCELL_ST_SF_LIN
Orient: R0
Pad: PcornerUL NW CORNERCELL_ST_SF_LIN

# ================================================ #
# NORTH (Clocks, UART)
# ================================================ #
Pad: PVDD1    N VDD_ST_SF_LIN
Pad: PGND1    N GND_ST_SF_LIN
Pad: PGNDE1   N GNDE_ST_SF_LIN
Pad: PVDDE1   N VDDE_ST_SF_LIN

Pad: p_clk       N BD2SCARUDQP_1V8_SF_LIN
Pad: p_rst_n     N BD2SCARUDQP_1V8_SF_LIN
Pad: p_uart_tx   N BD2SCARUDQP_1V8_SF_LIN
Pad: p_uart_rx   N BD2SCARUDQP_1V8_SF_LIN


# ================================================ #
# WEST (SPI Master / Flash)
# ================================================ #
Pad: PVDD2    W VDD_ST_SF_LIN
Pad: PGND2    W GND_ST_SF_LIN


Pad: p_spi_sdo0_o W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdo1_o W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdo2_o W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdo3_o W BD8SCARUDQP_1V8_SF_LIN

Pad: p_spi_sdi0_i W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdi1_i W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdi2_i W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spi_sdi3_i W BD2SCARUDQP_1V8_SF_LIN



# ================================================ #
# SOUTH (JTAG)
# ================================================ #
Pad: PVDD3    S VDD_ST_SF_LIN
Pad: PGND3    S GND_ST_SF_LIN


Pad: p_tck    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_trstn  S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tms    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tdi    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tdo    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_fetch_enable_i    S BD2SCARUDQP_1V8_SF_LIN



# ================================================ #
# EAST (SPI Slave, GPIOs)
# ================================================ #
Pad: PVDD4    E VDD_ST_SF_LIN
Pad: PGND4    E GND_ST_SF_LIN
Pad: p_spis_mode1 E E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_mode0 E E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_clk  E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_cs  E BD2SCARUDQP_1V8_SF_LIN
Pad: p_gpio_8 E BD2SCARUDQP_1V8_SF_LIN
