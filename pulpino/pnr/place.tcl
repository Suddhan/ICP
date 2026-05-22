push_snapshot_stack

set stage place
check_design -type $stage -out_file ./verify/${stage}/check_design.rpt ; # Checks that all prerequisites to run all or part of the hierarchical or block implementation flow are met.

# Set max density
set_db place_global_max_density 0.5

## Place standard cells

set_db place_global_ignore_scan true ;

set_db timing_analysis_type best_case_worst_case ; 


# Temporarily add fillers, we use the area argument as we cant place fillers 

add_fillers -area [ lindex [ get_db current_design .core_bbox] 0 ]

# Sroute - Connect our stripes in M4 to stripes in M1
route_special -connect {core_pin floating_stripe} -layer_change_range { M1(1) M6(6) } -block_pin_target {nearest_target} -pad_pin_port_connect {all_port one_geom} -pad_pin_target {nearest_target} -core_pin_target {first_after_row_end} -floating_stripe_target {block_ring pad_ring ring stripe ring_pin block_pin followpin} -allow_jogging 1 -crossover_via_layer_range { M1(1) M6(6) } -nets { VDD GND } -allow_layer_change 1 -block_pin use_lef -target_via_layer_range { M1(1) M6(6) }


delete_filler

place_opt_design

# Check timing
time_design -pre_cts

pop_snapshot_stack
create_snapshot -categories all -label place
report_metric -format html -out_file metrics.html

#=============================================================================
# pre-CTS
#=============================================================================
push_snapshot_stack
# Increase slack to make life easier for ourselves
set_db opt_setup_target_slack 0.5
set_db opt_hold_target_slack 0.1 ; # Dont overdo this one, as area will explode with buffers
# Optimize for new target setup slack
opt_design -pre_cts

# Resolve DRVs
set_db opt_fix_fanout_load true
opt_design -pre_cts -drv

# Check timing
time_design -pre_cts

pop_snapshot_stack
create_snapshot -categories all -label pre-cts
report_metric -format html -out_file metrics.html

#=============================================================================
# Clock Tree Synthesis (CTS)
#=============================================================================
push_snapshot_stack
set stage cts
check_design -type $stage -out_file ./verify/${stage}/check_design.rpt ; # Checks that all prerequisites to run all or part of the hierarchical or block implementation flow are met.

# Set buffer cells that the clock tree synthesis can use
set_db cts_buffer_cells {*CNBF*}

# Set inverter cells that the clock tree synthesis can use
set_db cts_inverter_cells {*CNIV*}

# Set clock gating cells that the clock tree synthesis can use
set_db cts_clock_gating_cells {*CNHLS*}

# Set logic cells that the clock tree synthesis can use
set_db cts_logic_cells {*CNMUX* *CNOR* *CNNOR* *CNNAND*}

# Hold fixing cells, cant be set like previous
set_db opt_hold_cells [get_db [get_db base_cells -if {.name == "*_BF*"}] .name] 

set_db cts_primary_delay_corner delay_corner_wcl_slow

# Using on chip variation for timing
set_db timing_analysis_type ocv
create_clock_tree_spec -out_file ccopt.spec
source ./ccopt.spec

# Run clock tree synthesis
ccopt_design

pop_snapshot_stack
create_snapshot -categories all -label cts
report_metric -format html -out_file metrics.html

#=============================================================================
# postCTS
#=============================================================================
push_snapshot_stack

## Check timing
# Setup
set_db opt_fix_fanout_load true ; # By default DRV fanout is not fixed after postCTS, enable to allow fanout fix
time_design -post_cts
set_db opt_setup_target_slack 0.05
opt_design -post_cts
opt_design -post_cts -drv

set_db design_flow_effort standard ; # Hold optimization is disabled during express mode, hence set to standard or extreme

# Hold
time_design -post_cts -hold
opt_design -post_cts -hold

pop_snapshot_stack
create_snapshot -categories all -label post-cts
report_metric -format html -out_file metrics.html
#=============================================================================
# Route
#=============================================================================
set stage route
check_design -type $stage -out_file ./verify/${stage}/check_design.rpt ; 
push_snapshot_stack

# Routing attributes
set_db route_design_antenna_diode_insertion true
set_db route_design_antenna_cell_name [get_db [get_db base_cells -if {.name == *ANTPROT*}] .name]

set_db design_flow_effort standard
set_db timing_analysis_type ocv ; # On chip variation required at route stage

route_design


# Setup
time_design -post_route
opt_design -post_route
opt_design -post_route -drv

# Hold
time_design -post_route -hold
opt_design -post_route -hold


# Add filler cells
add_fillers

# Write report/metric
pop_snapshot_stack
create_snapshot -categories all -label route
report_metric -format html -out_file metrics.html

#   DRC fixes
check_drc -out_file ./verify/route/check_drc.rpt

# Fix DRCs
fix_via -min_step
route_eco -fix_drc

check_pg_shorts -out_file verify/route/check_pg_shorts.rpt
check_connectivity -out_file ./verify/route/check_connectivity.rpt
check_process_antenna -out_file verify/route/check_process_antenna.rpt
check_well_taps -max_distance 30 -report verify/route/check_well_taps.rpt




# Write output
write_db innovus_output/ -common 
write_netlist innovus_output/top.v
write_sdf -map_setuphold split -map_recrem split -precision 4 innovus_output/top.sdf

# Hide violations
set_layer_preference violation -is_visible 0

# Show finished banner
show_done
