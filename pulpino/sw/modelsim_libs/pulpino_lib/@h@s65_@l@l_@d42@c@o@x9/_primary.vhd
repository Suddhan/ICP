library verilog;
use verilog.vl_types.all;
entity HS65_LL_D42COX9 is
    port(
        CO              : out    vl_logic;
        S               : out    vl_logic;
        C               : out    vl_logic;
        I4              : in     vl_logic;
        I3              : in     vl_logic;
        I2              : in     vl_logic;
        I1              : in     vl_logic;
        CI              : in     vl_logic
    );
end HS65_LL_D42COX9;
