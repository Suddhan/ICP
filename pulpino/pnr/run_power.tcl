# 1. Initialize the power analysis engine
set_power_analysis_mode -reset
set active_view [get_db analysis_views -limit 1]
set_power_analysis_mode -analysis_view $active_view \
                        -write_static_currents true \
                        -create_binary_db true

# 2. Read your simulation activity file 
read_activity_file -format saif \
                   -scope tb_pl/top_i \
                   -input ../vsim/core_power.saif

# 3. Report power strictly for the core logic blocks (excluding I/O pads)
report_power -instances {core_region_i peripherals_i clk_rst_gen_i axi_interconnect_i} \
             -output_dir ../pnr/power_report_core_only
