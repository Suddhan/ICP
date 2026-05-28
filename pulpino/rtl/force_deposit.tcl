
# set EN to zero on CGs on startup
 set all_insts [find instances -r /*RC_CGIC_INST*]
 foreach item $all_insts {
    # regexp to only keep instance name
        regsub { \([^)]+\)$} $item "" clean_path
        
     # deposit value, zero should be fine
        set target "${clean_path}/E"
        echo "Forcing: $target"
        force -deposit $target St0 0
    
 }


# set A, Q, CSN, CK, WEN, to zero on SRAMs on startup
 set all_sram [find instances -r /*_sram*]
 foreach item $all_sram {
    # regexp to only keep instance name
        regsub { \([^)]+\)$} $item "" clean_path
        
        set target "${clean_path}/A"
        echo "Forcing: $target"
        force -deposit $target St0 0

        set target "${clean_path}/Q"
        force -deposit $target St0 0
        echo "Forcing: $target"

        set target "${clean_path}/CSN"
        echo "Forcing: $target"
        force -deposit $target St0 0

        set target "${clean_path}/CK"
        echo "Forcing: $target"
        force -deposit $target St0 0

        set target "${clean_path}/WEN"
        echo "Forcing: $target"
        force -deposit $target St0 0
    
 }
