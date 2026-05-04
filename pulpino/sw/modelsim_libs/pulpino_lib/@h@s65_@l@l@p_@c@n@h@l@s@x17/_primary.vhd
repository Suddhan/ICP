library verilog;
use verilog.vl_types.all;
entity HS65_LLP_CNHLSX17 is
    port(
        Q               : out    vl_logic;
        CP              : in     vl_logic;
        E               : in     vl_logic;
        TE              : in     vl_logic
    );
end HS65_LLP_CNHLSX17;
