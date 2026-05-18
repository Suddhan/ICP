if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name wcl_fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/CORE65LPLVT_bc_1.25V_m40C.lib\
    ${::IMEX::libVar}/mmmc/CLOCK65LPLVT_bc_1.25V_m40C.lib\
    ${::IMEX::libVar}/mmmc/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_bc_1.25V_1.95V_m40C.lib\
    ${::IMEX::libVar}/mmmc/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_bc_1.25V_m40C.lib\
    ${::IMEX::libVar}/mmmc/SPHS100909_bc_1.30V_m40C.lib\
    ${::IMEX::libVar}/mmmc/PRHS65_bc_1.25V_m40C.lib]
create_library_set -name wcl_slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/CORE65LPLVT_wc_1.00V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/CLOCK65LPLVT_wc_1.00V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_wc_1.00V_1.65V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_wc_1.00V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/SPHS100909_wc_1.10V_125C_10y.lib\
    ${::IMEX::libVar}/mmmc/PRHS65_wc_1.00V_125C_10y.lib]
create_library_set -name wcl_typical\
   -timing\
    [list ${::IMEX::libVar}/mmmc/CORE65LPLVT_nom_1.10V_25C.lib\
    ${::IMEX::libVar}/mmmc/CLOCK65LPLVT_nom_1.10V_25C.lib\
    ${::IMEX::libVar}/mmmc/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_nom_1.10V_1.80V_25C.lib\
    ${::IMEX::libVar}/mmmc/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_nom_1.10V_25C.lib\
    ${::IMEX::libVar}/mmmc/SPHS100909_nom_1.20V_25C.lib\
    ${::IMEX::libVar}/mmmc/PRHS65_nom_1.10V_25C.lib]
create_opcond -name op_cond_wcl_fast -process 1 -voltage 1.25 -temperature -40
create_opcond -name op_cond_wcl_typical -process 1 -voltage 1.1 -temperature 25
create_opcond -name op_cond_wcl_slow -process 1 -voltage 1 -temperature 125
create_timing_condition -name timing_cond_wcl_typical\
   -library_sets [list wcl_typical]\
   -opcond op_cond_wcl_typical
create_timing_condition -name timing_cond_wcl_slow\
   -library_sets [list wcl_slow]\
   -opcond op_cond_wcl_slow
create_timing_condition -name timing_cond_wcl_fast\
   -library_sets [list wcl_fast]\
   -opcond op_cond_wcl_fast
create_rc_corner -name rc_corner_typ\
   -cap_table ${::IMEX::libVar}/mmmc/RCTYP.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech ${::IMEX::libVar}/mmmc/rc_corner_typ/qrcTechFile
create_rc_corner -name rc_corner_min\
   -cap_table ${::IMEX::libVar}/mmmc/RCMIN.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech ${::IMEX::libVar}/mmmc/rc_corner_min/qrcTechFile
create_rc_corner -name rc_corner_max\
   -cap_table ${::IMEX::libVar}/mmmc/RCMAX.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech ${::IMEX::libVar}/mmmc/rc_corner_max/qrcTechFile
create_delay_corner -name delay_corner_wcl_slow\
   -early_timing_condition {timing_cond_wcl_slow}\
   -late_timing_condition {timing_cond_wcl_slow}\
   -late_rc_corner rc_corner_max\
   -early_rc_corner rc_corner_min
create_delay_corner -name delay_corner_wcl_typical\
   -early_timing_condition {timing_cond_wcl_typical}\
   -late_timing_condition {timing_cond_wcl_typical}\
   -rc_corner rc_corner_typ
create_delay_corner -name delay_corner_wcl_fast\
   -early_timing_condition {timing_cond_wcl_fast}\
   -late_timing_condition {timing_cond_wcl_fast}\
   -late_rc_corner rc_corner_max\
   -early_rc_corner rc_corner_min
create_constraint_mode -name functional_wcl_typical\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/pulpino_chip.functional_wcl_typical.sdc]
create_constraint_mode -name functional_wcl_fast\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/functional_wcl_fast/functional_wcl_fast.sdc]
create_constraint_mode -name functional_wcl_slow\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/functional_wcl_slow/functional_wcl_slow.sdc]
create_analysis_view -name view_wcl_slow -constraint_mode functional_wcl_slow -delay_corner delay_corner_wcl_slow -latency_file ${::IMEX::dataVar}/mmmc/views/view_wcl_slow/latency.sdc
create_analysis_view -name view_wcl_typical -constraint_mode functional_wcl_typical -delay_corner delay_corner_wcl_typical
create_analysis_view -name view_wcl_fast -constraint_mode functional_wcl_fast -delay_corner delay_corner_wcl_fast -latency_file ${::IMEX::dataVar}/mmmc/views/view_wcl_fast/latency.sdc
set_analysis_view -setup [list view_wcl_slow] -hold [list view_wcl_fast]
