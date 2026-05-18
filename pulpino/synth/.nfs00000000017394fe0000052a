# ------------------------------------------------------------------------------
# 1. Setup & Units
# ------------------------------------------------------------------------------
set sdc_version 2.0
set_units -time 1.0ns -capacitance 1.0pF
current_design pulpino_top
#set_db / .multiple_driver_operation average

# ------------------------------------------------------------------------------
# 2. Clock Definitions
# ------------------------------------------------------------------------------
set clk_period 8.0

# Main System Clock
#changed from clk -> pad_clk
create_clock -name CLK -period ${clk_period} [get_ports pad_clk]		

# JTAG Clock 
#changed from tck_i -> pad_jtag_tck
# Verified as tck_i in pulpino_top.sv
create_clock -name JTAG_CLK -period 100.0 [get_ports pad_jtag_tck]		

# SPI/Flash Clock (Fixes the failed generated clock)
#changed from spi_clk_i -> pad_spis_clk
create_clock -name SPI_CLK -period 40 [get_ports pad_spis_clk]		

# Note: Using spi_master_clk_o found via your get_db search
#create_generated_clock -name FLASH_CLK \
#    -source [get_ports clk] \
#    -divide_by 2 \
#    [get_ports spi_master_clk_o]

# Define clock groups to show JTAG and System clocks are independent
set_clock_groups -asynchronous \
  -group [get_clocks CLK] \
  -group [get_clocks JTAG_CLK] \
  -group [get_clocks SPI_CLK]

# ------------------------------------------------------------------------------
# 3. Case Analysis (Resolves blocked paths)
# ------------------------------------------------------------------------------
# Primary selection and test signals
#set_case_analysis 0 [get_ports clk_sel_i]
set_case_analysis 0 [get_pins clk_rst_gen_i/clk_sel_i]
#set_case_analysis 0 [get_ports testmode_i]
set_case_analysis 0 [get_pins clk_rst_gen_i/testmode_i]
#set_case_analysis 1 [get_ports fetch_enable_i]
#set_case_analysis 1 [get_pins core_region_i/fetch_enable_i]

# RISC-V Core Clock Gate (The specific path from your terminal output)
set_case_analysis 1 [get_pins core_region_i/CORE.RISCV_CORE/core_clock_gate_i/en_i]
# Force peripheral and memory clock gates open
#set_case_analysis 1 [get_pins -hierarchical *en_i]
set_case_analysis 1 [get_pins -hierarchical *cg_cell/en_i]
set_case_analysis 1 [get_pins -hierarchical *spi_slave_i/*/en_i]
# ------------------------------------------------------------------------------
# 4. I/O Constraints
# ------------------------------------------------------------------------------
set delay_value [expr ${clk_period} * 0.2]

# Exclude both clock inputs from delay constraints to avoid "Clock-as-data"
# was {clk tck_i} before
set clk_ports [get_ports {pad_clk pad_jtag_tck}]

set_input_delay -clock CLK ${delay_value} [remove_from_collection [all_inputs] ${clk_ports}]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT [remove_from_collection [all_inputs] ${clk_ports}]

set_output_delay -clock CLK ${delay_value} [all_outputs]
set_load 0.05 [all_outputs]

# ------------------------------------------------------------------------------
# 5. Timing Exceptions
# ------------------------------------------------------------------------------
set_false_path -from [get_ports rst_n]
