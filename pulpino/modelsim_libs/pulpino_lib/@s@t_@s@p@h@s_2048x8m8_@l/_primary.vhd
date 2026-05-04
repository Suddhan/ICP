library verilog;
use verilog.vl_types.all;
entity ST_SPHS_2048x8m8_L is
    generic(
        Corruption_Read_Violation: integer := 1;
        Fault_file_name : string  := "ST_SPHS_2048x8m8_L_faults.txt";
        ConfigFault     : integer := 0;
        max_faults      : integer := 20;
        MEM_INITIALIZE  : vl_logic := Hi0;
        BinaryInit      : vl_logic := Hi0;
        InitFileName    : string  := "ST_SPHS_2048x8m8_L.cde";
        InstancePath    : string  := "ST_SPHS_2048x8m8_L";
        Debug_mode      : string  := "all_warning_mode";
        Words           : integer := 2048;
        Bits            : integer := 8;
        Addr            : integer := 11;
        mux             : integer := 8;
        Rows            : vl_notype;
        WordX           : vl_logic_vector(0 to 7) := (HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX);
        AddrX           : vl_logic_vector(0 to 10) := (HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX);
        Word0           : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        X               : vl_logic := HiX
    );
    port(
        Q               : out    vl_logic_vector;
        RY              : out    vl_logic;
        CK              : in     vl_logic;
        CSN             : in     vl_logic;
        TBYPASS         : in     vl_logic;
        WEN             : in     vl_logic;
        A               : in     vl_logic_vector;
        D               : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Corruption_Read_Violation : constant is 1;
    attribute mti_svvh_generic_type of Fault_file_name : constant is 1;
    attribute mti_svvh_generic_type of ConfigFault : constant is 1;
    attribute mti_svvh_generic_type of max_faults : constant is 1;
    attribute mti_svvh_generic_type of MEM_INITIALIZE : constant is 1;
    attribute mti_svvh_generic_type of BinaryInit : constant is 1;
    attribute mti_svvh_generic_type of InitFileName : constant is 1;
    attribute mti_svvh_generic_type of InstancePath : constant is 1;
    attribute mti_svvh_generic_type of Debug_mode : constant is 1;
    attribute mti_svvh_generic_type of Words : constant is 1;
    attribute mti_svvh_generic_type of Bits : constant is 1;
    attribute mti_svvh_generic_type of Addr : constant is 1;
    attribute mti_svvh_generic_type of mux : constant is 1;
    attribute mti_svvh_generic_type of Rows : constant is 3;
    attribute mti_svvh_generic_type of WordX : constant is 1;
    attribute mti_svvh_generic_type of AddrX : constant is 1;
    attribute mti_svvh_generic_type of Word0 : constant is 1;
    attribute mti_svvh_generic_type of X : constant is 1;
end ST_SPHS_2048x8m8_L;
