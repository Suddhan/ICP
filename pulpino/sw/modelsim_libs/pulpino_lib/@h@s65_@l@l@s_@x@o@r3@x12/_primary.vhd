library verilog;
use verilog.vl_types.all;
entity HS65_LLS_XOR3X12 is
    port(
        Z               : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic
    );
end HS65_LLS_XOR3X12;
