library verilog;
use verilog.vl_types.all;
entity spi_slave_syncro_AXI_ADDR_WIDTH32 is
    port(
        sys_clk         : in     vl_logic;
        rstn            : in     vl_logic;
        cs              : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        address_valid   : in     vl_logic;
        rd_wr           : in     vl_logic;
        cs_sync         : out    vl_logic;
        address_sync    : out    vl_logic_vector(31 downto 0);
        address_valid_sync: out    vl_logic;
        rd_wr_sync      : out    vl_logic
    );
end spi_slave_syncro_AXI_ADDR_WIDTH32;
