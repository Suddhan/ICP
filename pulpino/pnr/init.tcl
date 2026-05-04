
# --- 1. Load Design & Tech Files ---
set_db init_verilog [../synth/outputs/pulpino_top_netlist.v]
set_db init_top_cell pulpino_top

# LEF files define the physical size and pins of the gates
# You need both the Tech LEF (layers/wires) and Cell LEF (gates)
set_db init_lef_file {
    /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/CADENCE/LEF/CORE65LPLVT_soc.lef
    /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/CADENCE/LEF/.lef
}

# --- 2. Timing Setup (MMMC) ---
# This file defines your constraints (SDC) and operating conditions
set_db init_mmmc_file {../synth/mmmc.tcl}

# --- 3. Initialize Design ---
init_design

# --- 4. Floorplanning ---
# Define the chip size. '0.7' is a good starting density for PULPino.
# -site: usually 'core' for ST65
floorPlan -site core -r 1.0 0.7 20 20 20 20

# --- 5. Global Net Connections ---
# In GLS/PnR, we must explicitly connect the Power and Ground nets
connect_global_net VDD -type pg_pin -pin VDD -inst *
connect_global_net VSS -type pg_pin -pin VSS -inst *
add_ring -nets {VDD VSS} -type core_ring -width 5 -spacing 2 -layer {top M6 bottom M6 left M5 right M5}
add_stripe -nets {VSS VDD} -layer M6 -width 3 -spacing 2 -set_to_set_distance 40
sroute -nets {VDD VSS}

#Placing SRAM
set_db [get_db insts *SRAM_inst_name*] .status fixed
set_db [get_db insts *SRAM_inst_name*] .location {x y}

# --- 6. Save the state ---
save_design saved/init.enc
