######################################################################

# Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Thu Apr 02 15:44:20 CEST 2026

# This file contains the Genus script for design:sp_ram_wrap

######################################################################

set_db -quiet information_level 9
set_db -quiet init_lib_search_path {.  /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs  /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs  /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs  /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs  /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs  /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs  }
set_db -quiet design_mode_process 100.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_route_early_global false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet lp_insert_clock_gating true
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 32 0.0 19.0} {to_generic 1 33 0 19} {first_condense 0 33 0 20} {PBS_Generic_Opt-Post 1 33 0.890663 19.890663} {{PBS_Generic-Postgen HBO Optimizations} 0 33 0.0 19.890663} {PBS_TechMap-Start 0 35 0.0 20.890663} {{PBS_TechMap-Premap HBO Optimizations} 0 35 0.0 20.890663} {second_condense 0 35 0 21} {reify 0 35 0 22} {{PBS_Techmap-Global Mapping} 0 35 0.5874570000000006 21.47812} {{PBS_TechMap-Datapath Postmap Operations} 1 36 0.9875340000000001 22.465654} {{PBS_TechMap-Postmap HBO Optimizations} 0 36 0.0 22.465654} {{PBS_TechMap-Postmap Clock Gating} 0 36 0.0 22.465654} {{PBS_TechMap-Postmap Cleanup} 1 37 0.9959880000000005 23.461642} {PBS_Techmap-Post_MBCI 0 37 0.0 23.461642} {incr_opt 1 38 0 25} }
set_db -quiet init_ground_nets {GND GNDE}
set_db -quiet init_power_nets {VDD VDDE}
set_db -quiet timing_adjust_tns_of_complex_flops false
set_db -quiet tinfo_tstamp_file .rs_ne3026sr-s.tstamp
set_db -quiet metric_enable true
set_db -quiet write_db_use_relative_filepath true
set_db -quiet max_cpus_per_server 4
set_db -quiet use_area_from_lef true
set_db -quiet flow_metrics_snapshot_uuid d06a838d-4426-4d55-a7a3-47520ef45606
set_db -quiet read_qrc_tech_file_rc_corner true
if {[vfind design:sp_ram_wrap -mode view_wcl_slow] eq ""} {
 create_mode -name view_wcl_slow -design design:sp_ram_wrap 
}
if {[vfind design:sp_ram_wrap -mode INACTIVE_functional_wcl_fast] eq ""} {
 create_mode -name INACTIVE_functional_wcl_fast -inactive -design design:sp_ram_wrap 
}
if {[vfind design:sp_ram_wrap -mode INACTIVE_functional_wcl_typical] eq ""} {
 create_mode -name INACTIVE_functional_wcl_typical -inactive -design design:sp_ram_wrap 
}
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet layer_aware_buffer true
set_db -quiet ple_mode global
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPHRQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPRQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LLS_SDFPSQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPBTQX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQNX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHQX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQNTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQNTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPHRQTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQNX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPQX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQNX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPRQX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQNX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQTX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQTX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQTX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQTX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQTX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQX4 .avoid true
set_db -quiet lib_cell:wcl_slow/CORE65LPLVT/HS65_LL_SDFPSQX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX10 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX14 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX21 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX24 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX31 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX34 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX41 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX52 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX62 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LLP_CNHLSX82 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CAPX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CAPX35 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CAPX53 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CAPX9 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNAND2X17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNAND2X38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX10 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX103 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX124 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX14 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX21 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX24 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX31 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX34 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_0 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_1 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_10 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_11 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_12 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_13 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_14 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_16 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_18 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_19 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_2 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_20 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_21 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_22 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_23 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_3 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_4 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_5 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_6 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_8 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX38_9 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX41 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX45 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX48 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX52 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX55 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX58 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX62 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNBFX82 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX10 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX103 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX124 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX14 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX21 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX24 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX27 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX3 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX31 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX34 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX41 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX45 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX48 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX52 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX55 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX58 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX62 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNIVX82 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNMUX21X15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNMUX31X16 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNMUX41X17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNMUXI21X16 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNMUXI31X17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNAND2AX18 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNAND2X18 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNAND2X24 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNOR2AX15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNOR2X15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNNOR2X24 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNOR2X17 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNOR2X38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNOR3X15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNSDFPRQTX15 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNSDFPSQTX16 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_CNXOR2X38 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC2X4 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC2X7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC2X9 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC4X4 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC4X7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC4X9 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC6X4 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC6X7 .avoid true
set_db -quiet lib_cell:wcl_slow/CLOCK65LPLVT/HS65_LL_DLYIC6X9 .avoid true
set_db -quiet library_domain:timing_cond_wcl_slow .wireload_selection wireload_selection:wcl_slow/CORE65LPLVT/default_by_area
set_db -quiet operating_condition:wcl_slow/CORE65LPLVT/wc_1.00V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/CORE65LPLVT/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/CLOCK65LPLVT/wc_1.00V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/CLOCK65LPLVT/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/wc_1.00V_1.65V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/wc_1.00V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/SPHS100909/wc_1.10V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/SPHS100909/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/PRHS65/wc_1.00V_125C_10y .tree_type balanced_tree
set_db -quiet operating_condition:wcl_slow/PRHS65/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name CLK -mode mode:sp_ram_wrap/view_wcl_slow -domain domain_1 -period 8000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -design design:sp_ram_wrap port:sp_ram_wrap/clk
set_db -quiet clock:sp_ram_wrap/view_wcl_slow/CLK .slew {320.0 320.0 320.0 320.0}
set_db -quiet clock:sp_ram_wrap/view_wcl_slow/CLK .clock_source_late_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/view_wcl_slow/CLK .clock_source_early_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/view_wcl_slow/CLK .clock_setup_uncertainty {160.0 160.0}
set_db -quiet clock:sp_ram_wrap/view_wcl_slow/CLK .clock_hold_uncertainty {160.0 160.0}
define_clock -name CLK -mode mode:sp_ram_wrap/INACTIVE_functional_wcl_fast -domain domain_1 -period 8000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -design design:sp_ram_wrap port:sp_ram_wrap/clk
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK .slew {320.0 320.0 320.0 320.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK .clock_source_late_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK .clock_source_early_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK .clock_setup_uncertainty {160.0 160.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK .clock_hold_uncertainty {160.0 160.0}
define_clock -name CLK -mode mode:sp_ram_wrap/INACTIVE_functional_wcl_typical -domain domain_1 -period 8000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -design design:sp_ram_wrap port:sp_ram_wrap/clk
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK .slew {320.0 320.0 320.0 320.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK .clock_source_late_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK .clock_source_early_latency {100.0 100.0 100.0 100.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK .clock_setup_uncertainty {160.0 160.0}
set_db -quiet clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK .clock_hold_uncertainty {160.0 160.0}
define_cost_group -design design:sp_ram_wrap -name CLK
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:sp_ram_wrap/view_wcl_slow/CLK -name create_clock_delay_domain_1_CLK_R_0 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/view_wcl_slow/create_clock_delay_domain_1_CLK_R_0 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:sp_ram_wrap/view_wcl_slow/CLK -edge_fall -name create_clock_delay_domain_1_CLK_F_0 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/view_wcl_slow/create_clock_delay_domain_1_CLK_F_0 .clock_network_latency_included true
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK -name create_clock_delay_domain_1_CLK_R_0_1 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/INACTIVE_functional_wcl_fast/create_clock_delay_domain_1_CLK_R_0_1 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK -edge_fall -name create_clock_delay_domain_1_CLK_F_0_1 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/INACTIVE_functional_wcl_fast/create_clock_delay_domain_1_CLK_F_0_1 .clock_network_latency_included true
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK -name create_clock_delay_domain_1_CLK_R_0_2 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/INACTIVE_functional_wcl_typical/create_clock_delay_domain_1_CLK_R_0_2 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK -edge_fall -name create_clock_delay_domain_1_CLK_F_0_2 port:sp_ram_wrap/clk
set_db -quiet external_delay:sp_ram_wrap/INACTIVE_functional_wcl_typical/create_clock_delay_domain_1_CLK_F_0_2 .clock_network_latency_included true
path_group -paths [specify_paths -lenient -mode mode:sp_ram_wrap/view_wcl_slow -to clock:sp_ram_wrap/view_wcl_slow/CLK]  -name CLK -group cost_group:sp_ram_wrap/CLK -user_priority -1047552
path_group -paths [specify_paths -lenient -mode mode:sp_ram_wrap/INACTIVE_functional_wcl_fast -to clock:sp_ram_wrap/INACTIVE_functional_wcl_fast/CLK]  -name CLK -group cost_group:sp_ram_wrap/CLK -user_priority -1047552
path_group -paths [specify_paths -lenient -mode mode:sp_ram_wrap/INACTIVE_functional_wcl_typical -to clock:sp_ram_wrap/INACTIVE_functional_wcl_typical/CLK]  -name CLK -group cost_group:sp_ram_wrap/CLK -user_priority -1047552
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
# END DFT SECTION
set_db -quiet design:sp_ram_wrap .seq_reason_deleted_internal {}
set_db -quiet design:sp_ram_wrap .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 376198} {cell_count 65} {utilization  0.00} {runtime 1 33 0 19} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 376633} {cell_count 252} {utilization  0.00} {runtime 0 33 0 20} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 376633} {cell_count 252} {utilization  0.00} {runtime 0 35 0 21} }{reify {wns 214748365} {tns 0} {vep 0} {area 376346} {cell_count 125} {utilization  0.00} {runtime 0 35 0 22} }{incr_opt {wns 214748365} {tns 0} {vep 0} {area 376175} {cell_count 129} {utilization  0.00} {runtime 1 38 0 25} }}
set_db -quiet design:sp_ram_wrap .is_sop_cluster true
set_db -quiet design:sp_ram_wrap .seq_mbci_coverage 0.0
set_db -quiet design:sp_ram_wrap .hdl_filelist {{default -sv {SYNTHESIS} {../rtl/sp_ram_wrap.sv} {. ../rtl} {}}}
set_db -quiet design:sp_ram_wrap .hdl_user_name sp_ram_wrap
set_db -quiet design:sp_ram_wrap .verification_directory fv/sp_ram_wrap
set_db -quiet design:sp_ram_wrap .lp_clock_gating_max_flops inf
set_db -quiet design:sp_ram_wrap .arch_filename ../rtl/sp_ram_wrap.sv
set_db -quiet design:sp_ram_wrap .entity_filename ../rtl/sp_ram_wrap.sv
set_db -quiet port:sp_ram_wrap/clk .original_name clk
set_db -quiet port:sp_ram_wrap/rstn_i .original_name rstn_i
set_db -quiet port:sp_ram_wrap/en_i .original_name en_i
set_db -quiet {port:sp_ram_wrap/addr_i[14]} .original_name {addr_i[14]}
set_db -quiet {port:sp_ram_wrap/addr_i[13]} .original_name {addr_i[13]}
set_db -quiet {port:sp_ram_wrap/addr_i[12]} .original_name {addr_i[12]}
set_db -quiet {port:sp_ram_wrap/addr_i[11]} .original_name {addr_i[11]}
set_db -quiet {port:sp_ram_wrap/addr_i[10]} .original_name {addr_i[10]}
set_db -quiet {port:sp_ram_wrap/addr_i[9]} .original_name {addr_i[9]}
set_db -quiet {port:sp_ram_wrap/addr_i[8]} .original_name {addr_i[8]}
set_db -quiet {port:sp_ram_wrap/addr_i[7]} .original_name {addr_i[7]}
set_db -quiet {port:sp_ram_wrap/addr_i[6]} .original_name {addr_i[6]}
set_db -quiet {port:sp_ram_wrap/addr_i[5]} .original_name {addr_i[5]}
set_db -quiet {port:sp_ram_wrap/addr_i[4]} .original_name {addr_i[4]}
set_db -quiet {port:sp_ram_wrap/addr_i[3]} .original_name {addr_i[3]}
set_db -quiet {port:sp_ram_wrap/addr_i[2]} .original_name {addr_i[2]}
set_db -quiet {port:sp_ram_wrap/addr_i[1]} .original_name {addr_i[1]}
set_db -quiet {port:sp_ram_wrap/addr_i[0]} .original_name {addr_i[0]}
set_db -quiet {port:sp_ram_wrap/wdata_i[31]} .original_name {wdata_i[31]}
set_db -quiet {port:sp_ram_wrap/wdata_i[30]} .original_name {wdata_i[30]}
set_db -quiet {port:sp_ram_wrap/wdata_i[29]} .original_name {wdata_i[29]}
set_db -quiet {port:sp_ram_wrap/wdata_i[28]} .original_name {wdata_i[28]}
set_db -quiet {port:sp_ram_wrap/wdata_i[27]} .original_name {wdata_i[27]}
set_db -quiet {port:sp_ram_wrap/wdata_i[26]} .original_name {wdata_i[26]}
set_db -quiet {port:sp_ram_wrap/wdata_i[25]} .original_name {wdata_i[25]}
set_db -quiet {port:sp_ram_wrap/wdata_i[24]} .original_name {wdata_i[24]}
set_db -quiet {port:sp_ram_wrap/wdata_i[23]} .original_name {wdata_i[23]}
set_db -quiet {port:sp_ram_wrap/wdata_i[22]} .original_name {wdata_i[22]}
set_db -quiet {port:sp_ram_wrap/wdata_i[21]} .original_name {wdata_i[21]}
set_db -quiet {port:sp_ram_wrap/wdata_i[20]} .original_name {wdata_i[20]}
set_db -quiet {port:sp_ram_wrap/wdata_i[19]} .original_name {wdata_i[19]}
set_db -quiet {port:sp_ram_wrap/wdata_i[18]} .original_name {wdata_i[18]}
set_db -quiet {port:sp_ram_wrap/wdata_i[17]} .original_name {wdata_i[17]}
set_db -quiet {port:sp_ram_wrap/wdata_i[16]} .original_name {wdata_i[16]}
set_db -quiet {port:sp_ram_wrap/wdata_i[15]} .original_name {wdata_i[15]}
set_db -quiet {port:sp_ram_wrap/wdata_i[14]} .original_name {wdata_i[14]}
set_db -quiet {port:sp_ram_wrap/wdata_i[13]} .original_name {wdata_i[13]}
set_db -quiet {port:sp_ram_wrap/wdata_i[12]} .original_name {wdata_i[12]}
set_db -quiet {port:sp_ram_wrap/wdata_i[11]} .original_name {wdata_i[11]}
set_db -quiet {port:sp_ram_wrap/wdata_i[10]} .original_name {wdata_i[10]}
set_db -quiet {port:sp_ram_wrap/wdata_i[9]} .original_name {wdata_i[9]}
set_db -quiet {port:sp_ram_wrap/wdata_i[8]} .original_name {wdata_i[8]}
set_db -quiet {port:sp_ram_wrap/wdata_i[7]} .original_name {wdata_i[7]}
set_db -quiet {port:sp_ram_wrap/wdata_i[6]} .original_name {wdata_i[6]}
set_db -quiet {port:sp_ram_wrap/wdata_i[5]} .original_name {wdata_i[5]}
set_db -quiet {port:sp_ram_wrap/wdata_i[4]} .original_name {wdata_i[4]}
set_db -quiet {port:sp_ram_wrap/wdata_i[3]} .original_name {wdata_i[3]}
set_db -quiet {port:sp_ram_wrap/wdata_i[2]} .original_name {wdata_i[2]}
set_db -quiet {port:sp_ram_wrap/wdata_i[1]} .original_name {wdata_i[1]}
set_db -quiet {port:sp_ram_wrap/wdata_i[0]} .original_name {wdata_i[0]}
set_db -quiet port:sp_ram_wrap/we_i .original_name we_i
set_db -quiet {port:sp_ram_wrap/be_i[3]} .original_name {be_i[3]}
set_db -quiet {port:sp_ram_wrap/be_i[2]} .original_name {be_i[2]}
set_db -quiet {port:sp_ram_wrap/be_i[1]} .original_name {be_i[1]}
set_db -quiet {port:sp_ram_wrap/be_i[0]} .original_name {be_i[0]}
set_db -quiet port:sp_ram_wrap/bypass_en_i .original_name bypass_en_i
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .original_name {rdata_o[31]}
set_db -quiet {port:sp_ram_wrap/rdata_o[31]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .original_name {rdata_o[30]}
set_db -quiet {port:sp_ram_wrap/rdata_o[30]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .original_name {rdata_o[29]}
set_db -quiet {port:sp_ram_wrap/rdata_o[29]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .original_name {rdata_o[28]}
set_db -quiet {port:sp_ram_wrap/rdata_o[28]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .original_name {rdata_o[27]}
set_db -quiet {port:sp_ram_wrap/rdata_o[27]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .original_name {rdata_o[26]}
set_db -quiet {port:sp_ram_wrap/rdata_o[26]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .original_name {rdata_o[25]}
set_db -quiet {port:sp_ram_wrap/rdata_o[25]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .original_name {rdata_o[24]}
set_db -quiet {port:sp_ram_wrap/rdata_o[24]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .original_name {rdata_o[23]}
set_db -quiet {port:sp_ram_wrap/rdata_o[23]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .original_name {rdata_o[22]}
set_db -quiet {port:sp_ram_wrap/rdata_o[22]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .original_name {rdata_o[21]}
set_db -quiet {port:sp_ram_wrap/rdata_o[21]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .original_name {rdata_o[20]}
set_db -quiet {port:sp_ram_wrap/rdata_o[20]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .original_name {rdata_o[19]}
set_db -quiet {port:sp_ram_wrap/rdata_o[19]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .original_name {rdata_o[18]}
set_db -quiet {port:sp_ram_wrap/rdata_o[18]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .original_name {rdata_o[17]}
set_db -quiet {port:sp_ram_wrap/rdata_o[17]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .original_name {rdata_o[16]}
set_db -quiet {port:sp_ram_wrap/rdata_o[16]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .original_name {rdata_o[15]}
set_db -quiet {port:sp_ram_wrap/rdata_o[15]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .original_name {rdata_o[14]}
set_db -quiet {port:sp_ram_wrap/rdata_o[14]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .original_name {rdata_o[13]}
set_db -quiet {port:sp_ram_wrap/rdata_o[13]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .original_name {rdata_o[12]}
set_db -quiet {port:sp_ram_wrap/rdata_o[12]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .original_name {rdata_o[11]}
set_db -quiet {port:sp_ram_wrap/rdata_o[11]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .original_name {rdata_o[10]}
set_db -quiet {port:sp_ram_wrap/rdata_o[10]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .original_name {rdata_o[9]}
set_db -quiet {port:sp_ram_wrap/rdata_o[9]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .original_name {rdata_o[8]}
set_db -quiet {port:sp_ram_wrap/rdata_o[8]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .original_name {rdata_o[7]}
set_db -quiet {port:sp_ram_wrap/rdata_o[7]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .original_name {rdata_o[6]}
set_db -quiet {port:sp_ram_wrap/rdata_o[6]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .original_name {rdata_o[5]}
set_db -quiet {port:sp_ram_wrap/rdata_o[5]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .original_name {rdata_o[4]}
set_db -quiet {port:sp_ram_wrap/rdata_o[4]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .original_name {rdata_o[3]}
set_db -quiet {port:sp_ram_wrap/rdata_o[3]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .original_name {rdata_o[2]}
set_db -quiet {port:sp_ram_wrap/rdata_o[2]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .original_name {rdata_o[1]}
set_db -quiet {port:sp_ram_wrap/rdata_o[1]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_pin_cap_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_capacitance_max {10000.0 10000.0}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_capacitance_min 10000.0
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_pin_cap_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_capacitance_min_by_mode {{mode:sp_ram_wrap/view_wcl_slow 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast 10000.0} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical 10000.0}}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_pin_cap_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_capacitance_max_by_mode {{mode:sp_ram_wrap/view_wcl_slow {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_fast {10000.0 10000.0}} {mode:sp_ram_wrap/INACTIVE_functional_wcl_typical {10000.0 10000.0}}}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .original_name {rdata_o[0]}
set_db -quiet {port:sp_ram_wrap/rdata_o[0]} .external_pin_cap {10000.0 10000.0}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .original_name {{rows[0].col[0].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .single_bit_orig_name {rows[0].col[0].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[0].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[7]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[6]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[5]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[4]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[3]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[2]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[1]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/Q[0]} .original_name {rows[0].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[0].i_sram/RY} .original_name {rows[0].col[0].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .original_name {{rows[0].col[1].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .single_bit_orig_name {rows[0].col[1].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[1].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[7]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[6]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[5]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[4]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[3]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[2]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[1]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/Q[0]} .original_name {rows[0].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[1].i_sram/RY} .original_name {rows[0].col[1].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .original_name {{rows[0].col[2].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .single_bit_orig_name {rows[0].col[2].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[2].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[7]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[6]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[5]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[4]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[3]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[2]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[1]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/Q[0]} .original_name {rows[0].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[2].i_sram/RY} .original_name {rows[0].col[2].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .original_name {{rows[0].col[3].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .single_bit_orig_name {rows[0].col[3].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[0].col[3].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[7]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[6]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[5]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[4]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[3]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[2]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[1]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/Q[0]} .original_name {rows[0].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[0].col[3].i_sram/RY} .original_name {rows[0].col[3].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .original_name {{rows[1].col[0].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .single_bit_orig_name {rows[1].col[0].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[0].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[7]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[6]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[5]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[4]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[3]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[2]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[1]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/Q[0]} .original_name {rows[1].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[0].i_sram/RY} .original_name {rows[1].col[0].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .original_name {{rows[1].col[1].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .single_bit_orig_name {rows[1].col[1].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[1].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[7]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[6]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[5]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[4]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[3]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[2]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[1]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/Q[0]} .original_name {rows[1].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[1].i_sram/RY} .original_name {rows[1].col[1].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .original_name {{rows[1].col[2].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .single_bit_orig_name {rows[1].col[2].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[2].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[7]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[6]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[5]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[4]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[3]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[2]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[1]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/Q[0]} .original_name {rows[1].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[2].i_sram/RY} .original_name {rows[1].col[2].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .original_name {{rows[1].col[3].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .single_bit_orig_name {rows[1].col[3].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[1].col[3].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[7]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[6]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[5]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[4]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[3]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[2]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[1]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/Q[0]} .original_name {rows[1].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[1].col[3].i_sram/RY} .original_name {rows[1].col[3].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .original_name {{rows[2].col[0].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .single_bit_orig_name {rows[2].col[0].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[0].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[7]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[6]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[5]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[4]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[3]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[2]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[1]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/Q[0]} .original_name {rows[2].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[0].i_sram/RY} .original_name {rows[2].col[0].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .original_name {{rows[2].col[1].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .single_bit_orig_name {rows[2].col[1].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[1].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[7]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[6]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[5]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[4]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[3]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[2]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[1]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/Q[0]} .original_name {rows[2].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[1].i_sram/RY} .original_name {rows[2].col[1].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .original_name {{rows[2].col[2].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .single_bit_orig_name {rows[2].col[2].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[2].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[7]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[6]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[5]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[4]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[3]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[2]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[1]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/Q[0]} .original_name {rows[2].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[2].i_sram/RY} .original_name {rows[2].col[2].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .original_name {{rows[2].col[3].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .single_bit_orig_name {rows[2].col[3].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[2].col[3].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[7]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[6]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[5]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[4]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[3]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[2]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[1]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/Q[0]} .original_name {rows[2].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[2].col[3].i_sram/RY} .original_name {rows[2].col[3].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .original_name {{rows[3].col[0].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .single_bit_orig_name {rows[3].col[0].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[0].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[7]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[6]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[5]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[4]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[3]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[2]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[1]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/Q[0]} .original_name {rows[3].col[0].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[0].i_sram/RY} .original_name {rows[3].col[0].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .original_name {{rows[3].col[1].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .single_bit_orig_name {rows[3].col[1].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[1].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[7]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[6]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[5]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[4]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[3]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[2]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[1]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/Q[0]} .original_name {rows[3].col[1].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[1].i_sram/RY} .original_name {rows[3].col[1].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .original_name {{rows[3].col[2].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .single_bit_orig_name {rows[3].col[2].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[2].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[7]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[6]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[5]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[4]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[3]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[2]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[1]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/Q[0]} .original_name {rows[3].col[2].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[2].i_sram/RY} .original_name {rows[3].col[2].i_sram/RY}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .original_name {{rows[3].col[3].i_sram}}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .single_bit_orig_name {rows[3].col[3].i_sram}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .gint_phase_inversion false
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .dont_touch true
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .dont_touch_reason {inherited sp_ram_wrap}
set_db -quiet {inst:sp_ram_wrap/rows[3].col[3].i_sram} .preserve true
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[7]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[6]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[5]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[4]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[3]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[2]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[1]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/Q[0]} .original_name {rows[3].col[3].i_sram/Q}
set_db -quiet {pin:sp_ram_wrap/rows[3].col[3].i_sram/RY} .original_name {rows[3].col[3].i_sram/RY}
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
# BEGIN GLO TBR TABLE
set_db -quiet design:sp_ram_wrap .set_boundary_change_new {start restore}
set_db -quiet design:sp_ram_wrap .set_boundary_change_new {finish restore}
# END GLO TBR TABLE
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 21.14-s082_1
## flowkit v21.12-s008_1
## Written on 15:44:20 02-Apr 2026
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}
if {[is_attribute flow_plugin_steps -obj_type root]} {set_db flow_plugin_steps {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_remark -obj_type root]} {set_db flow_remark {}}
if {[is_attribute flow_features -obj_type root]} {set_db flow_features {}}
if {[is_attribute flow_feature_values -obj_type root]} {set_db flow_feature_values {}}
if {[is_attribute flow_write_db_args -obj_type root]} {set_db flow_write_db_args {}}
if {[is_attribute flow_write_db_sdc -obj_type root]} {set_db flow_write_db_sdc true}
if {[is_attribute flow_write_db_common -obj_type root]} {set_db flow_write_db_common false}
if {[is_attribute flow_post_db_overwrite -obj_type root]} {set_db flow_post_db_overwrite {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}
if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid d06a838d-4426-4d55-a7a3-47520ef45606}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_db flow_db_directory dbs}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_current_cache -obj_type root]} {set_db flow_current_cache {}}
if {[is_attribute flow_step_order_cache -obj_type root]} {set_db flow_step_order_cache {}}
if {[is_attribute flow_step_results_cache -obj_type root]} {set_db flow_step_results_cache {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_execute_in_global -obj_type root]} {set_db flow_execute_in_global true}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_db flow_overwrite_db false}
if {[is_attribute flow_print_run_information -obj_type root]} {set_db flow_print_run_information false}
if {[is_attribute flow_verbose -obj_type root]} {set_db flow_verbose true}
if {[is_attribute flow_print_run_information_full -obj_type root]} {set_db flow_print_run_information_full false}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_init_header_tcl -obj_type root]} {set_db flow_init_header_tcl {}}
if {[is_attribute flow_init_footer_tcl -obj_type root]} {set_db flow_init_footer_tcl {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_step_last_number -obj_type root]} {set_db flow_step_last_number 0}
if {[is_attribute flow_autoload_applets -obj_type root]} {set_db flow_autoload_applets false}
if {[is_attribute flow_autoload_dir -obj_type root]} {set_db flow_autoload_dir error}
if {[is_attribute flow_skip_auto_db_save -obj_type root]} {set_db flow_skip_auto_db_save true}
if {[is_attribute flow_skip_auto_generate_metrics -obj_type root]} {set_db flow_skip_auto_generate_metrics false}
if {[is_attribute flow_top -obj_type root]} {set_db flow_top {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_yaml_script -obj_type root]} {set_db flow_yaml_script {}}
if {[is_attribute flow_cla_enabled_features -obj_type root]} {set_db flow_cla_enabled_features {}}
if {[is_attribute flow_cla_inject_tcl -obj_type root]} {set_db flow_cla_inject_tcl {}}
if {[is_attribute flow_error_message -obj_type root]} {set_db flow_error_message {}}
if {[is_attribute flow_error_errorinfo -obj_type root]} {set_db flow_error_errorinfo {}}
if {[is_attribute flow_exclude_time_for_init_flow -obj_type root]} {set_db flow_exclude_time_for_init_flow false}
if {[is_attribute flow_error_write_db -obj_type root]} {set_db flow_error_write_db true}
if {[is_attribute flow_advanced_metric_isolation -obj_type root]} {set_db flow_advanced_metric_isolation flow}
if {[is_attribute flow_yaml_root -obj_type root]} {set_db flow_yaml_root {}}
if {[is_attribute flow_yaml_root_dir -obj_type root]} {set_db flow_yaml_root_dir {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}

#############################################################
#####   User Defined Attributes   ###########################

