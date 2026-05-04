library verilog;
use verilog.vl_types.all;
entity HS65_LL_SDFPSQNTX35 is
    port(
        QN              : out    vl_logic;
        TQ              : out    vl_logic;
        D               : in     vl_logic;
        CP              : in     vl_logic;
        SN              : in     vl_logic;
        TI              : in     vl_logic;
        TE              : in     vl_logic
    );
end HS65_LL_SDFPSQNTX35;
