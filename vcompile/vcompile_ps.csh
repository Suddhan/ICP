#!/bin/tcsh

set IP=pulpino
set IP_NAME="PULPino"

#set scriptPath [file dirname [file normalize [info script]]]

if (! $?VSIM_PATH ) then
    setenv VSIM_PATH `pwd`/../
endif

setenv MSIM_LIBS_PATH ${VSIM_PATH}/modelsim_libs
set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"

mkdir -p ${MSIM_LIBS_PATH}

if (! -d ${LIB_PATH}) then
    vlib ${LIB_PATH}
endif

# Map the primary libraries
vmap ${LIB_NAME} ${LIB_PATH}
vmap work ${LIB_PATH}

# --- FIX FOR error_doc.txt ---
# Map all IP libraries to the main lib path to satisfy netlist references
foreach lib ( axi_spi_slave_lib axi_spi_master_lib apb_uart_lib apb_gpio_lib \
              apb_i2c_lib apb_spi_master_lib apb_timer_lib apb_event_unit_lib \
              axi_mem_if_DP_lib axi2apb_lib adv_dbg_if_lib apb2per_lib )
    vmap $lib ${LIB_PATH}
end

if (! $?PULP_PATH ) then
	echo "hiiiiiii :)))))\n\t `pwd`"
    setenv PULP_PATH `pwd`/..
	echo "pulp path is ${PULP_PATH}"
endif

setenv IPS_PATH       ${PULP_PATH}/../ips
setenv RTL_PATH       ${PULP_PATH}/../rtl
setenv TB_PATH        ${PULP_PATH}/../tb

source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/vcompile/colors.csh

# Compile 65nm Standard Cell Primitives
vlog -quiet -work ${LIB_NAME} /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/behaviour/verilog/CORE65LPLVT.v || exit 1
vlog -quiet -work ${LIB_NAME} /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/behaviour/verilog/CLOCK65LPLVT.v || exit 1
# Compile SRAM Macro Primitives
vlog -quiet -work ${LIB_NAME} /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/behaviour/verilog/SPHS100909.v || exit 1
vlog -quiet -work ${LIB_NAME} /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/behaviour/verilog/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z.v || exit 1
vlog -quiet -work ${LIB_NAME} /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/behaviour/verilog/PRHS65.v || exit 1

echo "Compiling GLS netlist"
vlog -quiet -work ${LIB_NAME} /h/d5/c/ne3026sr-s/ICProject/pulpino/pnr/genus_output/pulpino_top.v || exit 1

echo "compiling tb"
#vlog -quiet -work ${LIB_NAME} ../tb/tb_ps.sv || exit 1
source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/vcompile/vcompile_tb_ps.sh


echo "--> Libraries mapped and 65nm primitives compiled."
exit 0
