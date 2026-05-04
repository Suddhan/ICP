################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 04/24/2026 12:54:02
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_mmmc ../pnr/genus_output/pulpino_top.mmmc.tcl

read_physical -lef {/usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/technology.lef /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/viarule_generate.lef /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/LEF/sites.lef /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/CADENCE/LEF/CORE65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/CADENCE/LEF/CLOCK65LPLVT_soc.lef /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/CADENCE/LEF/PRHS65_soc.lef /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/CADENCE/LEF/SPHS100909_soc.lef}

read_netlist ../pnr/genus_output/pulpino_top.v

init_design
