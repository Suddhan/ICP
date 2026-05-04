library verilog;
use verilog.vl_types.all;
entity RC_CG_MOD_334 is
    port(
        enable          : in     vl_logic;
        ck_in           : in     vl_logic;
        ck_out          : out    vl_logic;
        test            : in     vl_logic
    );
end RC_CG_MOD_334;
