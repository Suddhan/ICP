library verilog;
use verilog.vl_types.all;
entity ST_SPHS_2048x8m8_L_OPschlr is
    generic(
        Words           : integer := 2048;
        Bits            : integer := 8;
        Addr            : integer := 11;
        WordX           : vl_logic_vector(0 to 7) := (HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX);
        AddrX           : vl_logic_vector(0 to 10) := (HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX, HiX);
        X               : vl_logic := HiX
    );
    port(
        QINT            : out    vl_logic_vector;
        RYINT           : out    vl_logic;
        Q_gCK           : in     vl_logic_vector;
        Q_glitch        : in     vl_logic_vector;
        Q_data          : in     vl_logic_vector;
        RY_rfCK         : in     vl_logic;
        RY_rrCK         : in     vl_logic;
        RY_frCK         : in     vl_logic;
        ICRY            : in     vl_logic;
        delTBYPASS      : in     vl_logic_vector;
        TBYPASS_D_Q     : in     vl_logic_vector;
        TBYPASS_main    : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Words : constant is 1;
    attribute mti_svvh_generic_type of Bits : constant is 1;
    attribute mti_svvh_generic_type of Addr : constant is 1;
    attribute mti_svvh_generic_type of WordX : constant is 1;
    attribute mti_svvh_generic_type of AddrX : constant is 1;
    attribute mti_svvh_generic_type of X : constant is 1;
end ST_SPHS_2048x8m8_L_OPschlr;
