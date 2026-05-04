library verilog;
use verilog.vl_types.all;
entity HS65_LL_NAND2AX29 is
    port(
        Z               : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end HS65_LL_NAND2AX29;
