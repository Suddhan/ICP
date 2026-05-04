library verilog;
use verilog.vl_types.all;
entity generic_fifo_DATA_WIDTH5_DATA_DEPTH8_5728 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_i          : in     vl_logic_vector(4 downto 0);
        valid_i         : in     vl_logic;
        grant_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(4 downto 0);
        valid_o         : out    vl_logic;
        grant_i         : in     vl_logic;
        test_mode_i     : in     vl_logic
    );
end generic_fifo_DATA_WIDTH5_DATA_DEPTH8_5728;
