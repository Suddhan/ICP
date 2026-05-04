#!/bin/bash
# \
exec vsim -64 -do "$0"

set TB   tb_ps
set TB_TEST $::env(TB_TEST)

# --- MODIFIED FOR GATE LEVEL SIMULATION ---
# 1. Added -t 1ps for 65nm timing precision
# 2. Added -sdftyp to back-annotate delays
# 3. Added -L to ensure the library is searched
set SDF_PATH "../../pnr/genus_output/pulpino_top.sdf"
set VSIM_FLAGS {"-GTEST=\"$TB_TEST\"" "+sdfmax /tb_ps/top_i=../../pnr/genus_output/pulpino_top.sdf" "+notimingchecks"} 
set MEMLOAD       "SPI"

source ./tcl_files/config/vsim.tcl
