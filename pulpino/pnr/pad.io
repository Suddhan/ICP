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
#Pad: PGNDE2   W GNDE_ST_SF_LIN
#Pad: PVDDE2   W VDDE_ST_SF_LIN

Pad: p_spim_clk  W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spim_csn  W BD2SCARUDQP_1V8_SF_LIN

# Note: The SDO pins use the 8mA high-drive cell!
Pad: p_spim_sdo0 W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdo1 W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdo2 W BD8SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdo3 W BD8SCARUDQP_1V8_SF_LIN

Pad: p_spim_sdi0 W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdi1 W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdi2 W BD2SCARUDQP_1V8_SF_LIN
Pad: p_spim_sdi3 W BD2SCARUDQP_1V8_SF_LIN



# ================================================ #
# SOUTH (JTAG, I2C)
# ================================================ #
Pad: PVDD3    S VDD_ST_SF_LIN
Pad: PGND3    S GND_ST_SF_LIN
#Pad: PGNDE3   S GNDE_ST_SF_LIN
#Pad: PVDDE3   S VDDE_ST_SF_LIN

Pad: p_tck    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_trstn  S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tms    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tdi    S BD2SCARUDQP_1V8_SF_LIN
Pad: p_tdo    S BD2SCARUDQP_1V8_SF_LIN

Pad: p_i2c_scl S BD2SCARUDQP_1V8_SF_LIN
Pad: p_i2c_sda S BD2SCARUDQP_1V8_SF_LIN



# ================================================ #
# EAST (SPI Slave, GPIOs)
# ================================================ #
Pad: PVDD4    E VDD_ST_SF_LIN
Pad: PGND4    E GND_ST_SF_LIN
#Pad: PGNDE4   E GNDE_ST_SF_LIN
#Pad: PVDDE4   E VDDE_ST_SF_LIN

Pad: p_spis_clk  E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_cs   E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_mosi E BD2SCARUDQP_1V8_SF_LIN
Pad: p_spis_miso E BD2SCARUDQP_1V8_SF_LIN

Pad: gen_gpio_pads[0].p_gpio E BD2SCARUDQP_1V8_SF_LIN
Pad: gen_gpio_pads[1].p_gpio E BD2SCARUDQP_1V8_SF_LIN
Pad: gen_gpio_pads[2].p_gpio E BD2SCARUDQP_1V8_SF_LIN
Pad: gen_gpio_pads[3].p_gpio E BD2SCARUDQP_1V8_SF_LIN
