

set_db [get_db base_cells -if {.class == core}] .symmetry xy ;	# Issue with stdcells not having symmetry in lef files, forced xy to fix this. (NOT a nice solution) /KW

# Set design attributes
set_db design_process_node 65

set_db design_top_routing_layer M7
set_db design_bottom_routing_layer M2 
set_db design_flow_effort standard ; # {express standard extreme}
set_db design_power_effort low ; # {none low high}
set_db place_global_place_io_pins true
# Set timing attributes
set_db timing_analysis_cppr           both
set_db timing_analysis_type           ocv


set_preference CmdLogMode 2 ; 
set_db add_fillers_cells [get_db [get_db base_cells *HS65_LS_FILLERCELL*] .name] 


#core size
set core_dx [expr [get_db [lindex [get_db insts -if {.name == *sram*}] 0] .bbox.dx] * 10] ;
set core_dy 1410 ; 
create_floorplan -site CORE -core_size $core_dx $core_dy 40 40 40 40
#Set sram name
set sram0 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 0]
set sram1 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 1]
set sram2 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 2]
set sram3 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 3]
set sram4 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 4]
set sram5 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 5]
set sram6 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 6]
set sram7 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 7]
set sram8 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 8]
set sram9 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 9]
set sram10 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 10]
set sram11 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 11]
set sram12 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 12]
set sram13 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 13]
set sram14 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 14]
set sram15 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 15]
set sram16 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 16]
set sram17 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 17]
set sram18 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 18]
set sram19 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 19]
set sram20 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 20]
set sram21 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 21]
set sram22 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 22]
set sram23 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 23]
set sram24 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 24]
set sram25 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 25]
set sram26 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 26]
set sram27 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 27]
set sram28 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 28]
set sram29 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 29]
set sram30 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 30]
set sram31 [lindex [get_db [get_db insts -if {.name == *i_sram*}] .name ] 31]


#//To delete srams
#delete_inst -inst [get_db [get_db insts -if {.name == *i_sram*}] .name]

#Placing the 32 srams
create_relative_floorplan -place $sram0 -ref_type core_boundary -horizontal_edge_separate {1 0 1} -vertical_edge_separate {0 0 0}
for {set i 1} {$i < 10} {incr i} {
    create_relative_floorplan -place [set sram$i] -ref_type object -ref [set sram[expr {$i-1}]] -horizontal_edge_separate {1 0 1} -vertical_edge_separate {2 0 0}
}

create_relative_floorplan -place $sram10 -ref_type core_boundary -horizontal_edge_separate {3 0 3} -vertical_edge_separate {0 0 0} -orient {R180}
for {set i 11} {$i < 20} {incr i} {
    create_relative_floorplan -place [set sram$i] -ref_type object -ref [set sram[expr {$i-1}]] -horizontal_edge_separate {3 0 3} -vertical_edge_separate {2 0 0} -orient {R180}
}

create_relative_floorplan -place $sram20 -ref_type object -ref $sram0 -horizontal_edge_separate {3 -20 1} -vertical_edge_separate {0 0 0} -orient {R90}
for {set i 21} {$i < 26} {incr i} {
    create_relative_floorplan -place [set sram$i] -ref_type object -ref [set sram[expr {$i-1}]] -horizontal_edge_separate {3 0 1} -vertical_edge_separate {0 0 0} -orient {R90}
}

create_relative_floorplan -place $sram26 -ref_type object -ref $sram9 -horizontal_edge_separate {3 -20 1} -vertical_edge_separate {2 0 2}  -orient {R270}
for {set i 27} {$i < 32} {incr i} {
    create_relative_floorplan -place [set sram$i] -ref_type object -ref [set sram[expr {$i-1}]] -horizontal_edge_separate {3 0 1} -vertical_edge_separate {2 0 2} -orient {R270}
}

#Fix the srams
set_db [get_db insts -if {.name == *sram*}] .place_status fixed

create_place_halo -insts *sram* -halo_deltas {10 10 10 10}

select_obj [get_db insts -if {.name == *i_sram*}]
split_row -selected
deselect_obj -all


#Add power
create_net -name VDD -power
create_net -name GND -ground
create_net -name GNDE -ground
create_net -name VDDE -power
create_net -name VDDE1V8 -power

delete_global_net_connections

connect_global_net VDD -type pg_pin -pin_base_name vdd -inst_base_name *
connect_global_net GND -type pg_pin -pin_base_name gnd -inst_base_name *
connect_global_net VDD -type tie_hi -pin_base_name vdd -inst_base_name *
connect_global_net GND -type tie_lo -pin_base_name gnd -inst_base_name *

connect_global_net GND -type pg_pin -pin_base_name GND -inst_base_name *
connect_global_net VDD -type pg_pin -pin_base_name VDD -inst_base_name *
connect_global_net GND -type pg_pin -pin_base_name GNDE -inst_base_name *
connect_global_net VDDE -type pg_pin -pin_base_name VDDE -inst_base_name *
connect_global_net VDDE -type pg_pin -pin_base_name VDDE1V8 -inst_base_name *


#Add pad fillers
set leftPads [get_db [get_db io_constraints -if {.side == west}] .inst]
deselect_obj -all
select_obj $leftPads
space_selected -space 98 -fix_side top
add_io_fillers -cells [get_db [get_db base_cells -if {.name == *IOFILLER?_*LIN}] .name] -side left -filler_orient R270

set topPads [get_db [get_db io_constraints -if {.side == north}] .inst]
deselect_obj -all
select_obj $topPads
space_selected -space 100 -fix_side right
add_io_fillers -cells [get_db [get_db base_cells -if {.name == *IOFILLER?_*LIN}] .name] -side top -filler_orient R180

set rightPads [get_db [get_db io_constraints -if {.side == east}] .inst]
deselect_obj -all
select_obj $rightPads
space_selected -space 150 -fix_side bottom
add_io_fillers -cells [get_db [get_db base_cells -if {.name == *IOFILLER?_*LIN}] .name] -side right -filler_orient R90


set bottomPads [get_db [get_db io_constraints -if {.side == south}] .inst]
deselect_obj -all
select_obj $bottomPads
space_selected -space 130 -fix_side left
add_io_fillers -cells [get_db [get_db base_cells -if {.name == *IOFILLER?_*LIN}] .name] -side bottom -filler_orient R0

suspend 

######################################
#           Power routing
#      Rings, stripes, vias
######################################
## Power rings

# Core ring
delete_all_power_preroutes
set_db add_stripes_stacked_via_top_layer AP ; # Should not be needed just yet
add_rings -spacing 4 -width 10 -layer {top M7 bottom M7 left M6 right M6} -jog_distance 0.07 -offset 0.1 -nets {VDD GND}

# Macro rings

# Since the macros are place in the top row, and already have a power ring on the western, northern, and eastern side,
# we can probably get away with a single stripe on the southern side of the macros.
select_obj [get_db insts -if {.name == *sram*}] ; # Select all macros named *sram*
add_rings -around cluster -layer {top M7 bottom M7 left M6 right M6} -nets {VDD GND} -skip_side {top left right} -spacing 4 -width 10 -type block_rings
deselect_obj -all

# In order to get a good power supply, we should add rings between the macros as well in a high metal layer
#select_obj [get_db insts -if {.name == *sram*}] ; # Select all macros named *sram*
#set_db add_stripes_stacked_via_bottom_layer M6 ; # Dont connect to pins just yet
#add_rings -around selected -layer {top M7 bottom M7 left M6 right M6} -nets {VDD GND} -skip_side {top bottom} -spacing 4 -width 10 -type block_rings
#add_rings -around selected -layer {top M7 bottom M7 left M6 right M6} -nets {VDD GND} -spacing 4 -width 10 -type block_rings


### Sroute  
# Explanation : Our VDD and GND pads needs to connect to the power rings - otherwise our power rings would just be floating!
#               The connection in these pads are on layer M6 respectively M7. 
#               We use the special route to tell the tool to connect the `pad_pins` (i.e., the pin connection of the pads) for the net VDD resp. GND
#               We also add -inst [..] to only do this for our VDD pads and GND pads.
route_special -connect pad_pin -nets {VDD} -pad_pin_layer_range {M5 M7} -inst [get_db [get_db insts -if {.base_cell == *VDD_*}] .name ]
route_special -connect pad_pin -nets {GND} -pad_pin_layer_range {M7 M7} -inst [get_db [get_db insts -if {.base_cell == *GND_*}] .name ]
route_special -connect core_pin -nets {VDD GND}   


### Stripes

set_db add_stripes_ignore_block_check false
set_db add_stripes_break_at none
set_db add_stripes_route_over_rows_only false
set_db add_stripes_rows_without_stripes_only false
set_db add_stripes_extend_to_closest_target ring
set_db add_stripes_stop_at_last_wire_for_area true
set_db add_stripes_spacing_type edge_to_edge
set_db add_stripes_spacing_from_block 0

set_db add_stripes_orthogonal_only true
set_db add_stripes_allow_jog { padcore_ring  block_ring }
set_db add_stripes_skip_via_on_pin {  standardcell }
set_db add_stripes_skip_via_on_wire_shape {  noshape   }

# Connect to power pins in M4
set_db add_stripes_stacked_via_bottom_layer M4
# Horzontal, m7
add_stripes -nets {VDD GND} -layer M7 -direction horizontal -width 10 -spacing 4 -set_to_set_distance 70 -start_from top -start_offset 35 -insts [get_db [get_db insts -if {.name == *sram*}] .name]
# Vertical, M6
add_stripes -nets {VDD GND} -layer M6 -direction vertical -width 10 -spacing 4 -set_to_set_distance 120 -start_from left -start_offset 55 -insts [get_db [get_db insts -if {.name == *sram*}] .name]



## Power stripes
set_db add_stripes_stripe_min_length 50 ; # We are blocking off the macros, but the core rings are outside. Use this to avoid getting a short stripe on the northern side that doesnt connect to anything
# M7 - horizontal
add_stripes -width 10 -spacing 3 -direction horizontal -layer M7 -nets {VDD GND}  -set_to_set_distance 150 -start_from bottom -start_offset 50 -stop_offset 50 -area_blockage [get_db [get_db insts -if {.name == *sram*}] .bbox]
# M6 - vertical
set_db add_stripes_trim_antenna_back_to_shape block_ring ; # Avoid dangling wires near macros
add_stripes -width 10 -spacing 3 -direction horizontal -layer M6 -nets {VDD GND}  -set_to_set_distance 140 -start_from left -start_offset 100 -stop_offset 50 -area_blockage [get_db [get_db insts -if {.name == *sram*}] .bbox]



# M5 - horizontal
add_stripes -width 3 -spacing 2 -direction horizontal -layer M5 -nets {VDD GND}  -set_to_set_distance 60 -start_from top -start_offset 20 -stop_offset 0 -area_blockage [get_db [get_db insts -if {.name == *sram*}] .bbox]
# M4 - vertical
set_db add_stripes_stacked_via_bottom_layer M3
set_db add_stripes_trim_antenna_back_to_shape {block_ring}
set_db add_stripes_trim_antenna_max_distance 10
set macroLowerLeftY [lindex [lindex [get_db [get_db insts -if {.name == *sram*}] .bbox] 0] 10]
set macroUpperRightY [lindex [lindex [get_db [get_db insts -if {.name == *sram*}] .bbox] 0] 9]
add_stripes -width 3 -spacing 2 -direction vertical -layer M4 -nets {VDD GND}  -set_to_set_distance 60 -start_from left -start_offset 10 -stop_offset 10 -area_blockage [list 0 $macroLowerLeftY 800 $macroUpperRightY]

## Well taps
delete_inst -inst *WELLTAP* ; # In case any well taps has been placed prior, delete these
# Set well tap cell to be used
set_db add_well_taps_cell HS65_LH_FILLERNPWPFP4

# Create well taps
# Explanation : We need to add well taps, to bias the bulk of the transistors to the correct potential
#               According to the documentation, the maximum distance a cell can have to a well tap is 30um.
#               This means that if we space the well taps with 60um, all cells will be within the 30um range of a tap.
add_well_taps -cell_interval 60

suspend


