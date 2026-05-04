library verilog;
use verilog.vl_types.all;
entity HS65_LL_MUXI21X50 is
    port(
        Z               : out    vl_logic;
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        S0              : in     vl_logic
    );
end HS65_LL_MUXI21X50;
