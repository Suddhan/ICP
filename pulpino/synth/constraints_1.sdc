# ------------------------------------------------------------------------------
# Specify units and design
# ------------------------------------------------------------------------------
set sdc_version 2.0
set_units -time 1.0ns -capacitance 1.0pF
current_design top

# ------------------------------------------------------------------------------
# Clock Definitions
# ------------------------------------------------------------------------------
# Define a clock for the synthesis, with the name `CLK`. 
# We set the period to `5.0` time units (time units = 1.0ns), that is low on 0.0ns and goes high on 2.5ns
# The clock `CLK` is defined to be located on the ports of clk, i.e. on the outside of the clock pad.
set clk_freq 125.0 ; # MHz				//changed the clock frequency from 150->125 MHz
set clk_period [expr 1000.0/${clk_freq}]
create_clock -name "CLK" -period ${clk_period} -waveform [list 0.0 [expr ${clk_period}/2]] [get_ports clk]

# Flash clock is generated from main clock every other clock cycle.
# Thus, we define it with generate clock and divide down the freq. by 2.
create_generated_clock -name FLASH_CLK \
    -source [get_ports clk] \
    -divide_by 2 \
    [get_ports flash_clk]


#Emulating clock tree for more realistic synthesis results
#Also adding source latency since clock is generated outside chip
set_clock_uncertainty 0.4 [get_clocks CLK]
set_false_path -from [get_ports resetn]			#added later
set_clock_transition [expr ${clk_period}*0.04] [get_clocks CLK]
set_clock_latency -source 0.1 [get_clocks CLK]
set_clock_skew [expr ${clk_period}*0.02] [get_clocks CLK]

# ------------------------------------------------------------------------------
# IO configuration 
# Sets constant values to pins or ports to be used by timing engine
# ------------------------------------------------------------------------------
set_case_analysis 1 [get_pins {clk_pad_in/EN clk_pad_in/PDN clk_pad_in/PUN}]
set_case_analysis 0 [get_pins {clk_pad_in/TM clk_pad_in/TEN}]

set inputPads [get_db [get_db insts -if {.name ==*pad_in*}] .name]
foreach pad $inputPads {
    # Lets do the same thing for the other pads
    set_case_analysis 1 [get_pins ${pad}/EN]
    set_case_analysis 1 [get_pins ${pad}/PDN]
    set_case_analysis 1 [get_pins ${pad}/PUN]
    set_case_analysis 0 [get_pins ${pad}/HYST]
}

# ------------------------------------------------------------------------------
# Input Delays (External Logic -> Chip)
# ------------------------------------------------------------------------------
# Signal traveling to other logic outside of chip, this takes some time
# This isn't a real project, thus we have some "realistic dealy" but not based on a real physical component
set INPUT_DELAY 1.6

# Reset and IRQs - should be synch
set_input_delay -clock CLK $INPUT_DELAY [get_ports {resetn irq_5 irq_6 irq_7}]

# Serial RX
set_input_delay -clock CLK $INPUT_DELAY [get_ports ser_rx]

# Flash Inputs
set_input_delay -clock CLK $INPUT_DELAY [get_ports {flash_io0_di flash_io1_di flash_io2_di flash_io3_di}]

# Assume inputs are driven from an external chip that has a driver that looks lik BUFX40 from our library
set_driving_cell -lib_cell *BFX40 -pin Z [get_ports {flash_io*_di* irq* resetn ser_rx}]

# ------------------------------------------------------------------------------
# Output Delays (Chip -> External Logic)
# ------------------------------------------------------------------------------
# Signal traveling from chip to outside logic, this takes some time
# This isn't a real project, thus we have some "realistic dealy" but not based on a real physical component
set OUTPUT_DELAY 1.6

# Serial TX
set_output_delay -clock CLK $OUTPUT_DELAY [get_ports ser_tx]

# Flash Control outputs
set_output_delay -clock FLASH_CLK $OUTPUT_DELAY [get_ports flash_csb]

# Flash Data Outputs
set_output_delay -clock FLASH_CLK $OUTPUT_DELAY [get_ports {flash_io0_do flash_io1_do flash_io2_do flash_io3_do}]
set_output_delay -clock FLASH_CLK $OUTPUT_DELAY [get_ports {flash_io?_oe}]

# ------------------------------------------------------------------------------
# Load
# ------------------------------------------------------------------------------
# Assume outputs drive a standard load (e.g., 10pF for PCB traces)
set_load 2.0 [all_outputs]
