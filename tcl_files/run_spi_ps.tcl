#!/bin/bash
# \
exec vsim -64 -do "$0"

set TB   tb_ps
if {[info exists  ::env(TB_TEST)]} {
	set TB_TEST $::env(TB_TEST)
} else {
	set TB_TEST "helloworld"
}

# --- MODIFIED FOR GATE LEVEL SIMULATION ---
# 1. Added -t 1ps for 65nm timing precision
# 2. Added -L pulpino_lib to find HS65_LLP cells
# 3. Added +notimingchecks for initial debug (can be removed for final timing verification)

set SDF_PATH "/h/d5/c/ne3026sr-s/ICProject/pulpino/pnr/genus_output/pulpino_top.sdf"

set VSIM_FLAGS " \
    -t 1ps \
    -L pulpino_lib \
    -L work \
    -sdfmax /tb_ps/top_i=$SDF_PATH \
	-sdfnoerror \
	+nosdfwarn \
    +notimingchecks " 


set MEMLOAD "SPI"

# Execute the simulation
# Ensure you are calling vsim with the -L flags defined in VSIM_FLAGS
source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/tcl_files/config/vsim_ps.tcl
source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/tcl_files/force_deposit.tcl
