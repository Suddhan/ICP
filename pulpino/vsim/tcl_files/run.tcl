#!/bin/bash
# \
#exec vsim -64 -do "$0"

#set TB_TEST $::env(TB_TEST)
#set VSIM_FLAGS    "-GTEST=\"$TB_TEST\""

#set TB            tb
#set MEMLOAD       "PRELOAD"

#source ./tcl_files/config/vsim.tcl

#!/bin/bash
# \
exec vsim -64 -do "$0"

set TB_TEST $::env(TB_TEST)

# --- MODIFIED FOR GATE LEVEL SIMULATION ---
# 1. Added -t 1ps for 65nm timing precision
# 2. Added -sdftyp to back-annotate delays
# 3. Added -L to ensure the library is searched
set SDF_PATH "/h/d9/g/su2577su-s/etin35_project/pulpino/pnr/genus_output/pulpino_top.sdf"
set VSIM_FLAGS "-t 1ps -sdftyp /pulpino_tb/pulpino_top_i=$SDF_PATH -GTEST=\"$TB_TEST\""
# ------------------------------------------

set TB            tb
set MEMLOAD       "PRELOAD"

source ./tcl_files/config/vsim.tcl
