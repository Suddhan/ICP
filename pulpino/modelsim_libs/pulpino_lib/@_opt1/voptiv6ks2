library verilog;
use verilog.vl_types.all;
entity dc_token_ring_fifo_din_DATA_WIDTH32_BUFFER_DEPTH8 is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        valid           : in     vl_logic;
        ready           : out    vl_logic;
        write_token     : out    vl_logic_vector(7 downto 0);
        read_pointer    : in     vl_logic_vector(7 downto 0);
        data_async      : out    vl_logic_vector(31 downto 0)
    );
end dc_token_ring_fifo_din_DATA_WIDTH32_BUFFER_DEPTH8;
