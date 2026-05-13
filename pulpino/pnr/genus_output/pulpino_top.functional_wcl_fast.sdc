# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Tue May 12 15:01:41 CEST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design pulpino_top

set_case_analysis 1 [get_pins core_region_i/CORE.RISCV_CORE/core_clock_gate_i/en_i]
set_case_analysis 1 [get_pins core_region_i/axi_slice_core2axi/WITH_SLICE.axi_slice_i/aw_buffer_i/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/axi_slice_core2axi/WITH_SLICE.axi_slice_i/ar_buffer_i/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/axi_slice_core2axi/WITH_SLICE.axi_slice_i/w_buffer_i/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/axi_slice_core2axi/WITH_SLICE.axi_slice_i/r_buffer_i/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/axi_slice_core2axi/WITH_SLICE.axi_slice_i/b_buffer_i/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins peripherals_i/axi2apb_i/genblk1.axi2apb_i/Slave_aw_buffer/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins peripherals_i/axi2apb_i/genblk1.axi2apb_i/Slave_ar_buffer/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins peripherals_i/axi2apb_i/genblk1.axi2apb_i/Slave_w_buffer/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins peripherals_i/axi2apb_i/genblk1.axi2apb_i/Slave_r_buffer/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins peripherals_i/axi2apb_i/genblk1.axi2apb_i/Slave_b_buffer/buffer_i/cg_cell/en_i]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_REQ_BLOCK_GEN[0].REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/en_i}]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_REQ_BLOCK_GEN[1].REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/en_i}]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_REQ_BLOCK_GEN[2].REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/en_i}]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_RESP_BLOCK_GEN[0].RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/en_i}]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_RESP_BLOCK_GEN[1].RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/en_i}]
set_case_analysis 1 [get_pins {axi_interconnect_i/axi_node_i/_RESP_BLOCK_GEN[2].RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/en_i}]
set_load -pin_load 0.05 [get_ports pad_clk]
set_load -pin_load 0.05 [get_ports pad_rst_n]
set_load -pin_load 0.05 [get_ports pad_uart_tx]
set_load -pin_load 0.05 [get_ports pad_uart_rx]
set_load -pin_load 0.05 [get_ports pad_spis_clk]
set_load -pin_load 0.05 [get_ports pad_spis_cs]
set_load -pin_load 0.05 [get_ports pad_spis_miso]
set_load -pin_load 0.05 [get_ports pad_spis_mosi]
set_load -pin_load 0.05 [get_ports pad_spim_clk]
set_load -pin_load 0.05 [get_ports pad_spim_csn0]
set_load -pin_load 0.05 [get_ports pad_spim_sdo0]
set_load -pin_load 0.05 [get_ports pad_spim_sdi0]
set_load -pin_load 0.05 [get_ports {pad_gpio[3]}]
set_load -pin_load 0.05 [get_ports {pad_gpio[2]}]
set_load -pin_load 0.05 [get_ports {pad_gpio[1]}]
set_load -pin_load 0.05 [get_ports {pad_gpio[0]}]
set_clock_gating_check -setup 0.0 
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_clk]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_rst_n]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_uart_tx]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_uart_rx]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spis_clk]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spis_cs]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spis_miso]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spis_mosi]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spim_clk]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spim_csn0]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spim_sdo0]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports pad_spim_sdi0]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports {pad_gpio[3]}]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports {pad_gpio[2]}]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports {pad_gpio[1]}]
set_driving_cell -lib_cell HS65_LL_BFX2 -library CORE65LPLVT -pin "Z" [get_ports {pad_gpio[0]}]
