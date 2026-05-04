library verilog;
use verilog.vl_types.all;
entity spi_master_fifo_DATA_WIDTH32_BUFFER_DEPTH8 is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        clr_i           : in     vl_logic;
        elements_o      : out    vl_logic_vector(4 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        valid_o         : out    vl_logic;
        ready_i         : in     vl_logic;
        valid_i         : in     vl_logic;
        data_i          : in     vl_logic_vector(31 downto 0);
        ready_o         : out    vl_logic
    );
end spi_master_fifo_DATA_WIDTH32_BUFFER_DEPTH8;
