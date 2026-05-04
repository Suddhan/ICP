#!/bin/csh
# Generated Setup Script for ETIN35 (C-Shell)
# Usage: source setup_env.csh

# --- Safety Check: Ensure we are in tcsh, otherwise throw error and exit ---
true; test "$?tcsh" = 1 || echo -e "Error: You are (probably) using bash. Switch to TCSH by writing tcsh in the terminal.\nNote for future project owners:\n\tI did this as some of the files for the design kit to work with Calibre used csh instead of bash. My recommendation: Just use tcsh, or you'll have to rewrite old files."
true; test "$?tcsh" = 1 || return 1

# --- Safety Checks ---
if ( "$cwd" == "$home" ) then
    echo "----------------------------------------------------------------"
    echo " [ERROR] Initialization will not be performed in the login directory!"
    echo " Please cd to the project directory, before sourcing again."
    echo "----------------------------------------------------------------"
    goto end_of_script
endif

set DIR_NAME = `basename "$cwd"`
if ( "$DIR_NAME" == "soc" ) then
    echo " [WARN] It is not recommended to run setup inside a 'soc' directory."
    echo " Please go up one level."
endif

echo "Setting up ETIN35 Pulpino Environment (TCsh/Csh)..."
echo "--- Environment Variables ---"

# --- Common Variables ---
setenv CDS_AUTO_64BIT ALL
setenv STM065_DIR "/usr/local-eit/cad2/cmpstm/stm065v536"

echo "  CDS_AUTO_64BIT = $CDS_AUTO_64BIT"
echo "  STM065_DIR     = $STM065_DIR"

# Setup for genus
setenv genus_HOME "/usr/local-eit/cad2/cadence/gen2114"
set path = ( ${genus_HOME}/tools/bin $path )
echo "  genus_HOME = $genus_HOME"

# Setup for innovus
setenv innovus_HOME "/usr/local-eit/cad2/cadence/inn2114"
set path = ( ${innovus_HOME}/tools/bin $path )
echo "  innovus_HOME = $innovus_HOME"

# Setup for xcelium
setenv xcelium_HOME "/usr/local-eit/cad2/cadence/xcel24"
set path = ( ${xcelium_HOME}/tools/bin $path )
echo "  xcelium_HOME = $xcelium_HOME"

# Setup for peg
#setenv peg_HOME "/usr/local-eit/cad2/cadence/peg23"
setenv peg_HOME "/usr/local-eit/cad2/cadence/pvs21"
set path = ( ${peg_HOME}/tools.lnx86/bin $path )
echo "  peg_HOME = $peg_HOME"


# TEST
setenv MGC_HOME /usr/local-eit/cad2/mentor/cal2019/aoi_cal_2019.1_37.21
set path=($path $MGC_HOME/bin )
setenv MGLS_LICENSE_FILE `/bin/cat /usr/local-eit/cad2/mentor/current_license`
setenv USE_CALIBRE_VCO aoi
echo "  MGC_HOME = $MGC_HOME \t(Calibre)"

setenv PRODUCT_ROOT /usr/local-eit/cad2/cmpstm/s65v58/DK_cmos065lpgp_RF_7m4x0y2z_2V51V8/5.8-04/DATA/VERIFICATION_FINISHING/MODULES/MENTOR
source $PRODUCT_ROOT/DKcmos065_7m4x0y2z_calibre.csh
echo "  PRODUCT_ROOT = $PRODUCT_ROOT \t(DK + Calibre)"

# Setup for quantus
setenv quantus_HOME "/usr/local-eit/cad2/cadence/qua2311"
set path = ( ${quantus_HOME}/tools/bin $path )
echo "  quantus_HOME = $quantus_HOME"

# Setup for conf
setenv conf_HOME "/usr/local-eit/cad2/cadence/conf21"
set path = ( ${conf_HOME}/bin $path )
echo "  conf_HOME = $conf_HOME"

# --- License Setup ---
setenv CDS_LIC_FILE "/usr/local-eit/cad2/cadence/current_license"

if ( ! -f "$CDS_LIC_FILE" ) then
    echo " [WARNING] License file not found at $CDS_LIC_FILE"
else
    # Read content into variable using backticks
    setenv CDS_LIC_FILE `cat "$CDS_LIC_FILE"`
endif

########### TEST RISCV
#Initializing RISCV-Pulpino Variables
setenv CC "riscv32-unknown-elf-gcc"
#setenv PATH "/usr/local-eit/cad2/riscv/ri5cy_gnu_toolchain/install/bin:$PATH"
set path = ( /usr/local-eit/cad2/riscv/ri5cy_gnu_toolchain/install/bin $path )

# Initializing QuestaSim
setenv MODEL_SIM "/usr/local-eit/cad2/mentor/qsim10/questasim"
setenv MODELSIM "`pwd`/modelsim_st65.ini"
echo "  MODEL_SIM = $MODEL_SIM"
if ( ! -f medfilt.cmd ) then
    cp $MODEL_SIM/../medfilt.cmd.st65 ./medfilt.cmd
endif

set modelsimpath = "$MODEL_SIM/linux_x86_64"

if ( "`echo $PATH | grep $modelsimpath`" == "" ) then
    #setenv PATH "${modelsimpath}:$PATH"
    set path = ( ${modelsimpath} $path )
endif


echo "  CDS_LIC_FILE   = $CDS_LIC_FILE"
echo "-----------------------------"

printf "Checking tool environments...\n\n"

# Check Commands 
# create environment:cmd which are later split up in the loop
foreach pair ( "genus_HOME:genus" "innovus_HOME:innovus" "xcelium_HOME:xrun" "peg_HOME:pvs" "MGC_HOME:calibre" "quantus_HOME:quantus" "conf_HOME:lec" "MODEL_SIM:vsim" )
    
    # extrawct name and cmd
    set env_name = `echo $pair | cut -d':' -f1`
    set cmd_name = `echo $pair | cut -d':' -f2`
    
    # 'which' checks cmd. use '>& /dev/null'  to hide output 
    which $cmd_name >& /dev/null
    
    # $status holds the exit code in tcsh (0 means success)
    if ( $status == 0 ) then
        printf "%-15s : \033[1;32m[WORKING]\033[0m (Found command '%s')\n" "$env_name" "$cmd_name"
    else
        printf "%-15s : \033[1;31m[NOT WORKING]\033[0m (Missing command '%s')\n" "$env_name" "$cmd_name"
    endif
end

# var check (if you read this, read it with the classic `fit check` attitude)
foreach var_name ( "STM065_DIR" "PRODUCT_ROOT" "CDS_LIC_FILE" )
    
    # hide output, status will be non-zero if fail
    printenv $var_name >& /dev/null
    
    if ( $status == 0 ) then
        printf "%-15s : \033[1;32m[WORKING]\033[0m (Variable is set)\n" "$var_name"
    else
        printf "%-15s : \033[1;31m[NOT WORKING]\033[0m (Variable is empty or missing)\n" "$var_name"
    endif
end

printf "\n"
echo "-----------------------------"
echo "Credits:\n\tKrippe & \033[1;32mGreen Doors'\033[0m club"
echo "-----------------------------"
echo " [OK] Environment Ready."

# Label for safety check goto
end_of_script:
