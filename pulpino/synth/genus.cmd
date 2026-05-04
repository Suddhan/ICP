# Cadence Genus(TM) Synthesis Solution, Version 21.14-s082_1, built Jun 23 2022 14:32:08

# Date: Thu Apr 09 12:08:40 2026
# Host: fransg-7 (x86_64 w/Linux 3.10.0-1160.119.1.el7.x86_64) (6cores*6cpus*1physical cpu*Intel(R) Core(TM) i5-8500 CPU @ 3.00GHz 9216KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

source run_synth.tcl
# entering suspend mode
report_timing -lint
set_db / .multiple_driver_operation average
set_db / .multiple_driver_column_averaging true
set_attribute multiple_driver_operation average /
set_db [current_design] .multiple_driver_operation average
source run_synth.tcl
exit
