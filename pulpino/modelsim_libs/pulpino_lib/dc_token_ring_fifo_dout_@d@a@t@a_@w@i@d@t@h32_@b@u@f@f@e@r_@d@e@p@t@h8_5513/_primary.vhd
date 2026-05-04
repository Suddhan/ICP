library verilog;
use verilog.vl_types.all;
entity dc_token_ring_fifo_dout_DATA_WIDTH32_BUFFER_DEPTH8_5513 is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        data_async      : in     vl_logic_vector(31 downto 0);
        write_token     : in     vl_logic_vector(7 downto 0);
        read_pointer    : out    vl_logic_vector(7 downto 0);
        data            : out    vl_logic_vector(31 downto 0);
        valid           : out    vl_logic;
        ready           : in     vl_logic
    );
end dc_token_ring_fifo_dout_DATA_WIDTH32_BUFFER_DEPTH8_5513;
