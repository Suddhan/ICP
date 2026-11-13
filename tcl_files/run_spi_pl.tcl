#!/bin/bash
# \
exec vsim -64 -do "$0"

#set TB   tb_pl
set TB   pulpino_lib.tb_pl
if {[info exists  ::env(TB_TEST)]} {
	set TB_TEST $::env(TB_TEST)
} else {
	set TB_TEST "helloworld"
}

# --- MODIFIED FOR GATE LEVEL SIMULATION ---
# 1. Added -t 1ps for 65nm timing precision
# 2. Added -L pulpino_lib to find HS65_LLP cells
#	+nosdfwarn 
# 3. Added +notimingchecks for initial debug (can be removed for final timing verification)

#Add the SDF file path +notimingchecks \-suppress 3261
set SDF_PATH "/h/d5/c/ne3026sr-s/ICProject/pulpino/pnr/innovus_output/top.sdf"

set VSIM_FLAGS " \
	+notimingchecks    \
	-t 1ps \
    -L pulpino_lib \
    -L work \
    -sdfmax /tb_pl/top_i=$SDF_PATH \
    -sdfnoerror \
    -sdfnowarn" 


set MEMLOAD "SPI"

# Execute the simulation
# Ensure you are calling vsim with the -L flags defined in VSIM_FLAGS
source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/tcl_files/config/vsim_pl.tcl
source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/tcl_files/force_deposit.tcl
