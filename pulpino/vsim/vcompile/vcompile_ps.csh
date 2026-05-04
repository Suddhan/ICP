#!/bin/tcsh
set IP=pulpino
set IP_NAME="PULPino"

if (! $?VSIM_PATH ) then
    setenv VSIM_PATH `pwd`
endif

# 1. Define the absolute path to the libraries
setenv MSIM_LIBS_PATH ${VSIM_PATH}/modelsim_libs
set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"

# 2. Physically create the directory structure
mkdir -p ${MSIM_LIBS_PATH}

# 3. Create the library at that SPECIFIC path (not just locally)
if (! -d ${LIB_PATH}) then
    vlib ${LIB_PATH}
endif

# 4. Map it correctly in the .ini file
vmap ${LIB_NAME} ${LIB_PATH}
vmap work ${LIB_PATH}
 
if (! $?PULP_PATH ) then
  setenv PULP_PATH      `pwd`/..
endif



source ${PULP_PATH}/vsim/vcompile/colors.csh
#rm -r modelsim_libs
#mkdir modelsim_libs

#rm -r work
#mkdir work
#---------------------------------Added-----------------------------
# Compile standard cell primitives into the work library
vlog -quiet -work ${LIB_PATH} /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/behaviour/verilog/CORE65LPLVT.v || goto error
# Compile SRAM macro primitives into the work library
vlog -quiet -work ${LIB_PATH} /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/behaviour/verilog/SPHS100909.v || goto error
#-------------------------------------------------------------------
vlog -quiet -work ${LIB_PATH} /h/d9/g/su2577su-s/etin35_project/pulpino/synth/outputs/pulpino_top_netlist.v || goto error
echo ""
echo "${Green}--> Compiling riscv core... ${NC}"

source ${PULP_PATH}/vsim/vcompile/ips/vcompile_riscv.csh || exit 1
source ${PULP_PATH}/vsim/vcompile/rtl/vcompile_tb_ps.sh || exit 1

echo "${Green}--> RiscV core compilation Complete! ${NC}"
echo ""
