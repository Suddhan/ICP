library verilog;
use verilog.vl_types.all;
entity jtag_dpi is
    generic(
        TCP_PORT        : integer := 4567;
        TIMEOUT_COUNT   : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0)
    );
    port(
        clk_i           : in     vl_logic;
        enable_i        : in     vl_logic;
        tms_o           : out    vl_logic;
        tck_o           : out    vl_logic;
        trst_o          : out    vl_logic;
        tdi_o           : out    vl_logic;
        tdo_i           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of TCP_PORT : constant is 1;
    attribute mti_svvh_generic_type of TIMEOUT_COUNT : constant is 1;
end jtag_dpi;
