####################################################################################################
## Setup, File read and RTL elaboration
####################################################################################################
#set_db / .max_print_messages 100
set_db [get_db designs pulpino_top] .multiple_driver_operation average
# 1. Update Design Name
set DESIGN pulpino_top ; # Set this to your top module name
set SYN_EFF medium 
set MAP_EFF medium
set OPT_EFF medium

set DATE [clock format [clock seconds] -format "%b%d-%T"]
set _OUTPUTS_PATH outputs_${DATE}
set _LOG_PATH logs_${DATE}

set_db write_db_use_relative_filepath true

# 2. Path to libraries
#../../../../tech/stdcell/CLOCK65LPLVT/3.2/libs 			
#../../../../tech/stdcell/PRHS65/7.1/libs \
#../../../../tech/io/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs 

set_db / .init_lib_search_path ". \
/usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs \
/usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs \
/usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs \
/usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs \
/usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs \
/usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs \
../rtl \
../rtl/components \
../rtl/conv_acc \
../rtl/includes \
"

# 3. Path to your specific RTL (Add your wrapper here)		pulpino_top_pads.sv random_stalls.sv
set_db init_hdl_search_path ". ../rtl \
../rtl/components \
../rtl/includes \
../rtl/conv_acc \
../ips/riscv \
../ips/axi/core2axi \
../ips/axi/axi_slice \
../ips/axi/axi_slice_dc \
../ips/axi/axi_mem_if_DP \
../ips/adv_dbg_if/rtl \
../ips/axi/axi_spi_slave \
../ips/axi/axi2apb \
../ips/axi/axi2apb \
../ips/apb/apb_node \
../ips/apb/apb_uart_sv \
../ips/apb/apb_gpio \
../ips/apb/apb2per \
../ips/apb/apb_spi_master \
../ips/apb/apb_timer \
../ips/apb/apb_event_unit \
../ips/apb/apb_i2c \
../ips/apb/apb_fll_if \
../ips/apb/apb_pulpino \
../ips/axi/axi_node \
../ips/apb/apb_uart \
../ips/riscv/include \
../ips/apb/apb_event_unit/include \
../ips/riscv/include \
../ips/axi/axi_slice \
../ips/axi/axi_mem_if_DP \
../ips/apb/apb_node \
../ips/axi/axi_spi_slave \
" 

set rtlList " \
input_handler.sv \
quantizer.sv \
max_pool.sv \
ofm_sram.sv \
out_map.sv \
partial_mult.sv \
accum_partial.sv \
filter_ctrl.sv \
filter_top.sv \
conv_top.sv \
apu_defines.sv \
apb_uart.sv \
apb_uart_sv.sv \
defines_event_unit.sv \
spi_slave_rx.sv \
spi_slave_tx.sv \
spi_slave_cmd_parser.sv \
spi_slave_regs.sv \
dc_data_buffer.v \
dc_token_ring.v \
dc_full_detector.v \
dc_synchronizer.v \
dc_token_ring_fifo_din.v \
dc_token_ring_fifo_dout.v \
spi_slave_dc_fifo.sv \
spi_master_clkgen.sv \
spi_master_tx.sv \
spi_master_rx.sv \
spi_master_fifo.sv \
spi_master_controller.sv \
spi_slave_controller.sv \
spi_slave_axi_plug.sv \
spi_slave_syncro.sv \
spi_master_apb_if.sv \
riscv_defines.sv \
io_generic_fifo.sv \
apb_spi_master.sv \
apb2per.sv \
axi_bus.sv \
config.sv \
debug_bus.sv \
axi_slice.sv \
axi_slice_dc_master.sv \
axi_slice_dc_slave.sv \
axi_mem_if_SP.sv \
adbg_tap_top.v \
adbg_axi_biu.sv \
adbg_crc32.v \
adbg_axi_module.sv \
adbg_or1k_status_reg.sv \
adbg_or1k_biu.sv \
adbg_or1k_module.sv \
adbg_top.sv \
adv_dbg_if.sv \
axi_spi_slave.sv \
axi2apb.sv \
axi2apb32.sv \
apb_node.sv \
apb_node_wrap.sv \
apb_gpio.sv \
apb_timer.sv \
timer.sv \
generic_service_unit.sv \
sleep_unit.sv \
apb_event_unit.sv \
i2c_master_bit_ctrl.sv \
i2c_master_byte_ctrl.sv \
apb_i2c.sv \
apb_fll_if.sv \
apb_pulpino.sv \
axi_AR_allocator.sv \
axi_AW_allocator.sv \
axi_multiplexer.sv \
axi_DW_allocator.sv \
axi_address_decoder_BW.sv \
axi_address_decoder_BR.sv \
axi_FanInPrimitive_Req.sv \
axi_RR_Flag_Req.sv \
axi_ArbitrationTree.sv \
axi_BW_allocator.sv \
axi_BR_allocator.sv \
axi_address_decoder_AR.sv \
axi_address_decoder_AW.sv \
axi_address_decoder_DW.sv \
axi_request_block.sv \
axi_response_block.sv \
axi_node.sv \
apu_core_package.sv \
cluster_clock_gating.sv \
cluster_clock_inverter.sv \
cluster_clock_mux2.sv \
dp_ram.sv \
generic_fifo.sv \
pulp_clock_gating.sv \
pulp_clock_inverter.sv \
apb_bus.sv \
rstgen.sv \
apb_uart_sv.sv \
sp_ram.sv \
riscv_core.sv \
riscv_fetch_fifo.sv \
riscv_register_file.sv \
riscv_decoder.sv \
riscv_prefetch_buffer.sv \
riscv_hwloop_controller.sv \
riscv_hwloop_regs.sv \
riscv_int_controller.sv \
riscv_controller.sv \
riscv_compressed_decoder.sv \
riscv_mult.sv \
riscv_alu_div.sv \
riscv_alu.sv \
riscv_cs_registers.sv \
riscv_debug_unit.sv \
axi_write_only_ctrl.sv \
riscv_if_stage.sv \
riscv_id_stage.sv \
riscv_ex_stage.sv \
riscv_load_store_unit.sv \
axi_aw_buffer.sv \
axi_ar_buffer.sv \
axi_w_buffer.sv \
axi_r_buffer.sv \
axi_b_buffer.sv \
axi_read_only_ctrl.sv \
core2axi.sv \
sp_ram_wrap.sv \
instr_mem.sv \
data_mem.sv \
pulp_clock_mux2.sv \
apb_mock_uart.sv \
axi2apb_wrap.sv \
axi_mem_if_SP_wrap.sv \
axi_node_intf_wrap.sv \
axi_slice_wrap.sv \
axi_spi_slave_wrap.sv \
boot_code.sv \
boot_rom_wrap.sv \
clk_rst_gen.sv \
core2axi_wrap.sv \
core_region.sv \
dp_ram_wrap.sv \
instr_ram_wrap.sv \
apb2conv_wrap.sv \
periph_bus_wrap.sv \
peripherals.sv \
ram_mux.sv \
pulpino_top.sv \
" 
# Note: synthesizing the whole SoC, keeping: "sp_ram_wrap.sv ..."

set_db max_cpus_per_server 8
set_db information_level 9
set_db pbs_mmmc_flow true
set_db tns_opto true 
set_db lp_insert_clock_gating true 
set_db auto_ungroup none 
set_db init_ground_nets {GND GNDE}
set_db init_power_nets {VDD VDDE}
set_db lib_lef_consistency_check_enable false

# 4. Read Constraints (Make sure mmmc.tcl defines your clock)
read_mmmc mmmc.tcl

# 5. Read Physical Info (LEF files are critical for SRAM area calculation)
read_physical -lef " \
/usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/technology.lef \
/usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/viarule_generate.lef \
/usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/sites.lef \
/usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/CADENCE/LEF/CORE65LPLVT_soc.lef \
/usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/CADENCE/LEF/CLOCK65LPLVT_soc.lef \
/usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/CADENCE/LEF/PRHS65_soc.lef \
/usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/CADENCE/LEF/SPHS100909_soc.lef \
/usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/LEF/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z.lef\
/usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/LEF/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z.lef\
"

# Set dont_use on cells 
set_db [get_db lib_cells -if {.name == *CLOCK65*}] .dont_use true
set_db [get_db lib_cells *HS65_LLP_CNHLS*] .dont_use false

set_db [get_db lib_cells -if {.name == *_SDF*}] .dont_use true 
set_db lp_insert_discrete_clock_gating_logic true

# 6. READ AND ELABORATE
read_hdl -language sv $rtlList
read_hdl -language vhdl { 
  ../ips/apb/apb_uart/slib_input_sync.vhd
  ../ips/apb/apb_uart/slib_input_filter.vhd
  ../ips/apb/apb_uart/slib_edge_detect.vhd
  ../ips/apb/apb_uart/slib_fifo.vhd
  ../ips/apb/apb_uart/slib_clock_div.vhd
  ../ips/apb/apb_uart/uart_interrupt.vhd
  ../ips/apb/apb_uart/uart_transmitter.vhd
  ../ips/apb/apb_uart/uart_receiver.vhd
  ../ips/apb/apb_uart/uart_baudgen.vhd
  ../ips/apb/apb_uart/apb_uart.vhd  
}

read_hdl -language sv ../rtl/pulp_pads_top.sv
suspend
elaborate $DESIGN

# 7. CRITICAL: Protect the SRAM Macros
set_db [get_db designs:$DESIGN .insts rows[*].col[*].i_sram] .preserve true
#suspend
init_design
check_design -all
#suspend

####################################################################################################
## Synthesizing the design
####################################################################################################

# Generic Synthesis (RTL -> Generic Gates)
syn_generic
report_metric -format html -out_file metrics_generic.html

# Map Synthesis (Generic -> ST65nm Gates)
syn_map
report_metric -format html -out_file metrics_map.html

# Optimization (Timing & Power)
syn_opt
report_metric -format html -out_file metrics_opt.html

####################################################################################################
## Reporting & Handoff
####################################################################################################

# Write Reports
report_timing > $_OUTPUTS_PATH/timing.rpt
report_area   > $_OUTPUTS_PATH/area.rpt
report_power  > $_OUTPUTS_PATH/power.rpt
report_gates  > $_OUTPUTS_PATH/gates.rpt
write_hdl > outputs/pulpino_top_netlist.v

# Handoff to Innovus (Place & Route)
write_design -innovus -base_name ../pnr/genus_output/$DESIGN
write_sdf -precision 4 > ../pnr/genus_output/$DESIGN.sdf

puts "Synthesis Finished for $DESIGN"


