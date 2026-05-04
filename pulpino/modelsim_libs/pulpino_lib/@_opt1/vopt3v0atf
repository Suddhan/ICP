library verilog;
use verilog.vl_types.all;
entity uart_bus is
    generic(
        BAUD_RATE       : integer := 115200;
        PARITY_EN       : integer := 0
    );
    port(
        rx              : in     vl_logic;
        tx              : out    vl_logic;
        rx_en           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BAUD_RATE : constant is 1;
    attribute mti_svvh_generic_type of PARITY_EN : constant is 1;
end uart_bus;
