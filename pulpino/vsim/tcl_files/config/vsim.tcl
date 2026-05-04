source /h/d5/c/ne3026sr-s/ICProject/pulpino/vsim/tcl_files/config/vsim_ips.tcl
set g_flags ""

foreach {var param} {
TB_TEST -GTEST    
USE_ZERO_RISCY -gUSE_ZERO_RISCY    
RISCY_RV32F -gRISCY_RV32F    
ZERO_RV32M -gZERO_RV32M    
ZERO_RV32E -gZERO_RV32E
} {
if {[info exists env($var)] && $env($var) != ""} {
append g_flags " $param=$env($var)"
}
}
# Building the command list-style to avoid quote nesting issues
set cmd "vsim -quiet $TB"
append cmd " -L pulpino_lib"
append cmd " $VSIM_IP_LIBS"
append cmd " +nowarnTRAN +nowarnTSCALE +nowarnTFMPC"
append cmd " +MEMLOAD=$MEMLOAD"
append cmd " -t 1ps"
append cmd " -voptargs=\"+acc -suppress 2103\""
append cmd " $g_flags"
append cmd " $VSIM_FLAGS"

puts "Executing Simulation Command..."
eval $cmd

proc run_and_exit {} {
run -all
quit -code [examine -radix decimal sim:/tb_ps/exit_status]
}

