library verilog;
use verilog.vl_types.all;
entity spi_slave_cmd_parser is
    port(
        cmd             : in     vl_logic_vector(7 downto 0);
        get_addr        : out    vl_logic;
        get_mode        : out    vl_logic;
        get_data        : out    vl_logic;
        send_data       : out    vl_logic;
        enable_cont     : out    vl_logic;
        enable_regs     : out    vl_logic;
        wait_dummy      : out    vl_logic;
        error           : out    vl_logic;
        reg_sel         : out    vl_logic_vector(1 downto 0)
    );
end spi_slave_cmd_parser;
