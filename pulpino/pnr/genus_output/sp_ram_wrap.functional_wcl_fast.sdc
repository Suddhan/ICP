# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Thu Apr 02 15:44:20 CEST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design sp_ram_wrap

create_clock -name "CLK" -period 8.0 -waveform {0.0 4.0} [get_ports clk]
set_clock_transition 0.32 [get_clocks CLK]
set_load -pin_load 10.0 [get_ports {rdata_o[31]}]
set_load -pin_load 10.0 [get_ports {rdata_o[30]}]
set_load -pin_load 10.0 [get_ports {rdata_o[29]}]
set_load -pin_load 10.0 [get_ports {rdata_o[28]}]
set_load -pin_load 10.0 [get_ports {rdata_o[27]}]
set_load -pin_load 10.0 [get_ports {rdata_o[26]}]
set_load -pin_load 10.0 [get_ports {rdata_o[25]}]
set_load -pin_load 10.0 [get_ports {rdata_o[24]}]
set_load -pin_load 10.0 [get_ports {rdata_o[23]}]
set_load -pin_load 10.0 [get_ports {rdata_o[22]}]
set_load -pin_load 10.0 [get_ports {rdata_o[21]}]
set_load -pin_load 10.0 [get_ports {rdata_o[20]}]
set_load -pin_load 10.0 [get_ports {rdata_o[19]}]
set_load -pin_load 10.0 [get_ports {rdata_o[18]}]
set_load -pin_load 10.0 [get_ports {rdata_o[17]}]
set_load -pin_load 10.0 [get_ports {rdata_o[16]}]
set_load -pin_load 10.0 [get_ports {rdata_o[15]}]
set_load -pin_load 10.0 [get_ports {rdata_o[14]}]
set_load -pin_load 10.0 [get_ports {rdata_o[13]}]
set_load -pin_load 10.0 [get_ports {rdata_o[12]}]
set_load -pin_load 10.0 [get_ports {rdata_o[11]}]
set_load -pin_load 10.0 [get_ports {rdata_o[10]}]
set_load -pin_load 10.0 [get_ports {rdata_o[9]}]
set_load -pin_load 10.0 [get_ports {rdata_o[8]}]
set_load -pin_load 10.0 [get_ports {rdata_o[7]}]
set_load -pin_load 10.0 [get_ports {rdata_o[6]}]
set_load -pin_load 10.0 [get_ports {rdata_o[5]}]
set_load -pin_load 10.0 [get_ports {rdata_o[4]}]
set_load -pin_load 10.0 [get_ports {rdata_o[3]}]
set_load -pin_load 10.0 [get_ports {rdata_o[2]}]
set_load -pin_load 10.0 [get_ports {rdata_o[1]}]
set_load -pin_load 10.0 [get_ports {rdata_o[0]}]
set_clock_gating_check -setup 0.0 
set_clock_uncertainty -setup 0.16 [get_clocks CLK]
set_clock_uncertainty -hold 0.16 [get_clocks CLK]
