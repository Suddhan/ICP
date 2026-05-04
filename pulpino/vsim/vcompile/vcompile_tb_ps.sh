#!/bin/tcsh
#source ${PULP_PATH}/vsim/vcompile/colors.csh

set LIB_NAME="pulpino_lib"
set LIB_PATH="${VSIM_PATH}/modelsim_libs/${LIB_NAME}"
set TB_PATH="/h/d5/c/ne3026sr-s/ICProject/pulpino/tb"
echo "${Green}--> Compiling Testbench... ${NC} ${TB_PATH}"

# Compile Packages
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} /h/d5/c/ne3026sr-s/ICProject/pulpino/tb/pkg_spi.sv || goto error

# Compile Models and Testbench
# Added +incdir+ for the netlist includes
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} ${TB_PATH}/if_spi_master.sv || goto error
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH}                                                ${TB_PATH}/if_spi_slave.sv     || goto error
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH}                                                ${TB_PATH}/i2c_eeprom_model.sv || goto error
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} ${TB_PATH}/uart.sv || goto error
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} +incdir+/h/d5/c/ne3026sr-s/ICProject/pulpino/rtl/includes/ ${TB_PATH}/tb_ps.sv || goto error
#vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} +incdir+${RTL_PATH}/includes/ ${TB_PATH}/tb_wrapper.sv || goto error		#added later

# DPI components for JTAG and Memory
vlog -quiet -sv -work ${LIB_NAME} +incdir+${TB_PATH} -dpiheader ${TB_PATH}/jtag_dpi/dpiheader.h ${TB_PATH}/jtag_dpi.sv || goto error
vlog -quiet -64 -work ${LIB_NAME} -ccflags "-I${TB_PATH}/jtag_dpi/ -m64" -dpicpppath `which gcc` ${TB_PATH}/jtag_dpi/jtag_dpi.c || goto error

echo "${Green}--> Testbench compiled into ${LIB_NAME}.${NC}"
exit 0

error:
exit 1
