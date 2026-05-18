# ------------------------------------------------------------------------------
# 1. Setup & Units
# ------------------------------------------------------------------------------
set sdc_version 2.0
set_units -time 1.0ns -capacitance 1.0pF
current_design pulpino_top

# ------------------------------------------------------------------------------
# 2. Clock Definitions
# ------------------------------------------------------------------------------
set clk_period 8.0

# Physical Clocks
create_clock -name CLK       -period ${clk_period} [get_ports clk]
create_clock -name JTAG_CLK  -period 100.0         [get_ports tck_i]
create_clock -name SPI_CLK   -period 40.0          [get_ports spi_clk_i]

# Virtual Clocks (Models the timing of the external UART/SPI/JTAG devices)
create_clock -name VCLK_ASYNC -period 100.0

# Define Asynchronous Relationships
# This tells the tool these clocks have no phase relationship. 
# It effectively "cuts" the timing paths between them.
set_clock_groups -asynchronous \
  -group [get_clocks CLK] \
  -group [get_clocks {JTAG_CLK}] \
  -group [get_clocks {SPI_CLK}] \
  -group [get_clocks VCLK_ASYNC]

# ------------------------------------------------------------------------------
# 3. Case Analysis (Internal Signals)
# ------------------------------------------------------------------------------
set_case_analysis 0 [get_pins clk_rst_gen_i/clk_sel_i]
set_case_analysis 0 [get_pins clk_rst_gen_i/testmode_i]
set_case_analysis 1 [get_pins core_region_i/CORE.RISCV_CORE/core_clock_gate_i/en_i]
set_case_analysis 1 [get_pins -hierarchical *cg_cell/en_i]
set_case_analysis 1 [get_pins p_clk/EN]

# ------------------------------------------------------------------------------
# 4. I/O Constraints
# ------------------------------------------------------------------------------
set delay_value [expr ${clk_period} * 0.2]
set_input_transition 0.5 [all_inputs]

# 4a. Identify your asynchronous input pins
set async_inputs [get_ports {uart_rx spi_sdi0_i spi_cs_i spi_master_sdi*_i tms_i tdi_i trstn_i scl_pad_i sda_pad_i pad_gpio[*]}]

# 4b. Synchronous Inputs (Only ports that actually transition with your CLK)
# We remove the clock ports and the async ports from the "all_inputs" list
set sync_inputs [remove_from_collection [all_inputs] [concat [get_ports {clk tck_i spi_clk_i}] ${async_inputs}]]
if {[sizeof_collection ${sync_inputs}] > 0} {
    set_input_delay -clock CLK ${delay_value} ${sync_inputs}
}

# 4c. Constrain Asynchronous Inputs using the Virtual Clock
# This prevents the -9652.1 violation because they are no longer timed against CLK
set_input_delay ${delay_value} -clock VCLK_ASYNC ${async_inputs}

# 4d. Outputs
set_output_delay -clock CLK ${delay_value} [all_outputs]

# Driving cell and load
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT [all_inputs]
set_load 0.05 [all_outputs]

# ------------------------------------------------------------------------------
# 5. Timing Exceptions
# ------------------------------------------------------------------------------
set_false_path -from [get_ports rst_n]
