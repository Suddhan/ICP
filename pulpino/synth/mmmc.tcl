#################################################################################
# MMMC Configuration for ETIN35 (Genus Synthesis)
#################################################################################

## 1. Define Library Sets (Timing)
# Ensure your search paths in the main script point to where these .lib files live
#
#
#


create_library_set -name wcl_slow -timing { 
  CORE65LPLVT_wc_1.00V_125C_10y.lib
  CLOCK65LPLVT_wc_1.00V_125C_10y.lib
  IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_wc_1.00V_1.65V_125C_10y.lib
  IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_wc_1.00V_125C_10y.lib
  SPHS100909_wc_1.10V_125C_10y.lib
  PRHS65_wc_1.00V_125C_10y.lib
}

create_library_set -name wcl_fast -timing { 
  CORE65LPLVT_bc_1.25V_m40C.lib 
  CLOCK65LPLVT_bc_1.25V_m40C.lib
  IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_bc_1.25V_1.95V_m40C.lib
  IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_bc_1.25V_m40C.lib
  SPHS100909_bc_1.30V_m40C.lib
  PRHS65_bc_1.25V_m40C.lib
}

create_library_set -name wcl_typical -timing { 
  CORE65LPLVT_nom_1.10V_25C.lib
  CLOCK65LPLVT_nom_1.10V_25C.lib
  IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_nom_1.10V_1.80V_25C.lib
  IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_nom_1.10V_25C.lib
  SPHS100909_nom_1.20V_25C.lib
  PRHS65_nom_1.10V_25C.lib
}

## 2. Operating Conditions
create_opcond -name op_cond_wcl_slow    -process 1 -voltage 1.0  -temperature 125
create_opcond -name op_cond_wcl_fast    -process 1 -voltage 1.25 -temperature -40
create_opcond -name op_cond_wcl_typical -process 1 -voltage 1.1  -temperature 25

## 3. Timing Conditions (Link Libs to OpConds)
create_timing_condition -name timing_cond_wcl_slow    -opcond op_cond_wcl_slow    -library_sets { wcl_slow }
create_timing_condition -name timing_cond_wcl_fast    -opcond op_cond_wcl_fast    -library_sets { wcl_fast }
create_timing_condition -name timing_cond_wcl_typical -opcond op_cond_wcl_typical -library_sets { wcl_typical }

## 4. RC Corners (Parasitics - Crucial for Backend/Innovus)
# Note: Paths are relative to where you RUN genus.
create_rc_corner -name rc_corner_typ -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCTYP.captable -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCTYP/qrcTechFile

create_rc_corner -name rc_corner_min -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMIN.captable -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMIN/qrcTechFile

create_rc_corner -name rc_corner_max -cap_table /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/CAP_TABLE/RCMAX.captable -qrc_tech /usr/local-eit/cad2/cmpstm/etin35/etin35/tech/pdk/QRC_TECHFILE/RCMAX/qrcTechFile

## 5. Delay Corners (Combines Timing + RC)
create_delay_corner -name delay_corner_wcl_slow \
    -early_timing_condition timing_cond_wcl_slow \
    -late_timing_condition  timing_cond_wcl_slow \
    -early_rc_corner rc_corner_min \
    -late_rc_corner  rc_corner_max

create_delay_corner -name delay_corner_wcl_fast \
    -early_timing_condition timing_cond_wcl_fast \
    -late_timing_condition  timing_cond_wcl_fast \
    -early_rc_corner rc_corner_min \
    -late_rc_corner  rc_corner_max

create_delay_corner -name delay_corner_wcl_typical \
    -early_timing_condition timing_cond_wcl_typical \
    -late_timing_condition  timing_cond_wcl_typical \
    -early_rc_corner rc_corner_typ \
    -late_rc_corner  rc_corner_typ

## 6. Constraint Modes (Link to your SDC files)
create_constraint_mode -name functional_wcl_slow    -sdc_files { /h/d9/g/su2577su-s/etin35_project/pulpino/synth/constraints/constraints_1.sdc }
create_constraint_mode -name functional_wcl_fast    -sdc_files { /h/d9/g/su2577su-s/etin35_project/pulpino/synth/constraints/constraints_1.sdc }
create_constraint_mode -name functional_wcl_typical -sdc_files { /h/d9/g/su2577su-s/etin35_project/pulpino/synth/constraints/constraints_1.sdc }

## 7. Analysis Views (Final mapping for the tool)
create_analysis_view -name view_wcl_slow    -constraint_mode functional_wcl_slow    -delay_corner delay_corner_wcl_slow
create_analysis_view -name view_wcl_fast    -constraint_mode functional_wcl_fast    -delay_corner delay_corner_wcl_fast
create_analysis_view -name view_wcl_typical -constraint_mode functional_wcl_typical -delay_corner delay_corner_wcl_typical

## 8. Set Active Views
# During synthesis, we prioritize Setup in the Slow corner and Hold in the Fast corner.
set_analysis_view -setup { view_wcl_slow } -hold { view_wcl_fast }
