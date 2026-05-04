library verilog;
use verilog.vl_types.all;
entity HS65_LL_FA1X27 is
    port(
        S0              : out    vl_logic;
        CO              : out    vl_logic;
        A0              : in     vl_logic;
        B0              : in     vl_logic;
        CI              : in     vl_logic
    );
end HS65_LL_FA1X27;
