library verilog;
use verilog.vl_types.all;
entity spi_slave_regs_REG_SIZE8 is
    port(
        sclk            : in     vl_logic;
        rstn            : in     vl_logic;
        wr_data         : in     vl_logic_vector(7 downto 0);
        wr_addr         : in     vl_logic_vector(1 downto 0);
        wr_data_valid   : in     vl_logic;
        rd_data         : out    vl_logic_vector(7 downto 0);
        rd_addr         : in     vl_logic_vector(1 downto 0);
        dummy_cycles    : out    vl_logic_vector(7 downto 0);
        en_qpi          : out    vl_logic;
        wrap_length     : out    vl_logic_vector(15 downto 0)
    );
end spi_slave_regs_REG_SIZE8;
