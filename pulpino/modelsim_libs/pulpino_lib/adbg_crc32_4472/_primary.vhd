library verilog;
use verilog.vl_types.all;
entity adbg_crc32_4472 is
    port(
        clk             : in     vl_logic;
        data            : in     vl_logic;
        enable          : in     vl_logic;
        shift           : in     vl_logic;
        clr             : in     vl_logic;
        rstn            : in     vl_logic;
        crc_out         : out    vl_logic_vector(31 downto 0);
        serial_out      : out    vl_logic
    );
end adbg_crc32_4472;
