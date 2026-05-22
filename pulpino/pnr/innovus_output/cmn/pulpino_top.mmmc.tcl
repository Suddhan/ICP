create_library_set -name wcl_fast\
   -timing\
    [list /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_bc_1.25V_m40C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_bc_1.25V_m40C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_bc_1.25V_1.95V_m40C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_bc_1.25V_m40C.lib\
    /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_bc_1.30V_m40C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_bc_1.25V_m40C.lib]
create_library_set -name wcl_slow\
   -timing\
    [list /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_wc_1.00V_125C_10y.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_wc_1.00V_125C_10y.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_wc_1.00V_1.65V_125C_10y.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_wc_1.00V_125C_10y.lib\
    /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_wc_1.10V_125C_10y.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_wc_1.00V_125C_10y.lib]
create_library_set -name wcl_typical\
   -timing\
    [list /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_nom_1.10V_25C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_nom_1.10V_25C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_nom_1.10V_1.80V_25C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_nom_1.10V_25C.lib\
    /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_nom_1.20V_25C.lib\
    /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_nom_1.10V_25C.lib]
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
   -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCTYP.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCTYP/qrcTechFile
create_rc_corner -name rc_corner_min\
   -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMIN.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMIN/qrcTechFile
create_rc_corner -name rc_corner_max\
   -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMAX.captable\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMAX/qrcTechFile
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
    [list /h/d9/g/su2577su-s/etin35_project/pulpino/pnr/innovus_output/cmn/pulpino_top.mmmc/modes/functional_wcl_typical/pulpino_top.functional_wcl_typical.sdc]
create_constraint_mode -name functional_wcl_fast\
   -sdc_files\
    [list /h/d9/g/su2577su-s/etin35_project/pulpino/pnr/innovus_output/cmn/pulpino_top.mmmc/modes/functional_wcl_fast/functional_wcl_fast.sdc]
create_constraint_mode -name functional_wcl_slow\
   -sdc_files\
    [list /h/d9/g/su2577su-s/etin35_project/pulpino/pnr/innovus_output/cmn/pulpino_top.mmmc/modes/functional_wcl_slow/functional_wcl_slow.sdc]
create_analysis_view -name view_wcl_slow -constraint_mode functional_wcl_slow -delay_corner delay_corner_wcl_slow -latency_file /h/d9/g/su2577su-s/etin35_project/pulpino/pnr/innovus_output/cmn/pulpino_top.mmmc/views/view_wcl_slow/latency.sdc
create_analysis_view -name view_wcl_typical -constraint_mode functional_wcl_typical -delay_corner delay_corner_wcl_typical
create_analysis_view -name view_wcl_fast -constraint_mode functional_wcl_fast -delay_corner delay_corner_wcl_fast -latency_file /h/d9/g/su2577su-s/etin35_project/pulpino/pnr/innovus_output/cmn/pulpino_top.mmmc/views/view_wcl_fast/latency.sdc
set_analysis_view -setup [list view_wcl_slow] -hold [list view_wcl_fast]
