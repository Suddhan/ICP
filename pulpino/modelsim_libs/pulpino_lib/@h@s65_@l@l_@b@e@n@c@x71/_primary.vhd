library verilog;
use verilog.vl_types.all;
entity HS65_LL_BENCX71 is
    port(
        DBL             : out    vl_logic;
        NZP             : out    vl_logic;
        NZN             : out    vl_logic;
        Y0              : in     vl_logic;
        Y1              : in     vl_logic;
        Y2              : in     vl_logic
    );
end HS65_LL_BENCX71;
