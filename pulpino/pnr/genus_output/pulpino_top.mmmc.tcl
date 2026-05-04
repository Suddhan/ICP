#################################################################################
#
# Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Fri Apr 24 12:53:57 CEST 2026
#
#################################################################################

## library_sets
create_library_set -name wcl_slow \
    -timing { /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_wc_1.00V_125C_10y.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_wc_1.00V_125C_10y.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_wc_1.00V_1.65V_125C_10y.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_wc_1.00V_125C_10y.lib \
              /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_wc_1.10V_125C_10y.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_wc_1.00V_125C_10y.lib }
create_library_set -name wcl_fast \
    -timing { /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_bc_1.25V_m40C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_bc_1.25V_m40C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_bc_1.25V_1.95V_m40C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_bc_1.25V_m40C.lib \
              /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_bc_1.30V_m40C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_bc_1.25V_m40C.lib }
create_library_set -name wcl_typical \
    -timing { /usr/local-eit/cad2/cmpstm/s65v58/CORE65LPLVT/5.2/libs/CORE65LPLVT_nom_1.10V_25C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/CLOCK65LPLVT/3.2/libs/CLOCK65LPLVT_nom_1.10V_25C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z/7.3/libs/IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_nom_1.10V_1.80V_25C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z/7.4-00/libs/IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_nom_1.10V_25C.lib \
              /usr/local-eit/cad2/cmpstm/oldmems/mem2010/SPHS100909-40445@1.0/libs/SPHS100909_nom_1.20V_25C.lib \
              /usr/local-eit/cad2/cmpstm/s65v58/PRHS65/7.1/libs/PRHS65_nom_1.10V_25C.lib }

## opcond
create_opcond -name op_cond_wcl_slow \
    -process 1.0 \
    -voltage 1.0 \
    -temperature 125.0
create_opcond -name op_cond_wcl_fast \
    -process 1.0 \
    -voltage 1.25 \
    -temperature -40.0
create_opcond -name op_cond_wcl_typical \
    -process 1.0 \
    -voltage 1.1 \
    -temperature 25.0

## timing_condition
create_timing_condition -name timing_cond_wcl_slow \
    -opcond op_cond_wcl_slow \
    -library_sets { wcl_slow }
create_timing_condition -name timing_cond_wcl_fast \
    -opcond op_cond_wcl_fast \
    -library_sets { wcl_fast }
create_timing_condition -name timing_cond_wcl_typical \
    -opcond op_cond_wcl_typical \
    -library_sets { wcl_typical }

## rc_corner
create_rc_corner -name rc_corner_typ \
    -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCTYP/qrcTechFile \
    -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCTYP.captable \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}
create_rc_corner -name rc_corner_min \
    -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMIN/qrcTechFile \
    -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMIN.captable \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}
create_rc_corner -name rc_corner_max \
    -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMAX/qrcTechFile \
    -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMAX.captable \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name delay_corner_wcl_slow \
    -early_timing_condition { timing_cond_wcl_slow } \
    -late_timing_condition { timing_cond_wcl_slow } \
    -early_rc_corner rc_corner_min \
    -late_rc_corner rc_corner_max
create_delay_corner -name delay_corner_wcl_fast \
    -early_timing_condition { timing_cond_wcl_fast } \
    -late_timing_condition { timing_cond_wcl_fast } \
    -early_rc_corner rc_corner_min \
    -late_rc_corner rc_corner_max
create_delay_corner -name delay_corner_wcl_typical \
    -early_timing_condition { timing_cond_wcl_typical } \
    -late_timing_condition { timing_cond_wcl_typical } \
    -early_rc_corner rc_corner_typ \
    -late_rc_corner rc_corner_typ

## constraint_mode
create_constraint_mode -name functional_wcl_slow \
    -sdc_files { ../pnr/genus_output/pulpino_top.functional_wcl_slow.sdc }
create_constraint_mode -name functional_wcl_fast \
    -sdc_files { ../pnr/genus_output/pulpino_top.functional_wcl_fast.sdc }
create_constraint_mode -name functional_wcl_typical \
    -sdc_files { ../pnr/genus_output/pulpino_top.functional_wcl_typical.sdc }

## analysis_view
create_analysis_view -name view_wcl_slow \
    -constraint_mode functional_wcl_slow \
    -delay_corner delay_corner_wcl_slow
create_analysis_view -name view_wcl_fast \
    -constraint_mode functional_wcl_fast \
    -delay_corner delay_corner_wcl_fast
create_analysis_view -name view_wcl_typical \
    -constraint_mode functional_wcl_typical \
    -delay_corner delay_corner_wcl_typical

## set_analysis_view
set_analysis_view -setup { view_wcl_slow } \
                  -hold { view_wcl_fast }
