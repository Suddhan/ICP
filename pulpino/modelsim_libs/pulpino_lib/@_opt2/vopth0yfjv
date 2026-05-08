library verilog;
use verilog.vl_types.all;
entity axi_address_decoder_DW_N_INIT_PORT3_FIFO_DEPTH8_2 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        test_en_i       : in     vl_logic;
        wvalid_i        : in     vl_logic;
        wlast_i         : in     vl_logic;
        wready_o        : out    vl_logic;
        wvalid_o        : out    vl_logic_vector(2 downto 0);
        wready_i        : in     vl_logic_vector(2 downto 0);
        grant_FIFO_DEST_o: out    vl_logic;
        DEST_i          : in     vl_logic_vector(2 downto 0);
        push_DEST_i     : in     vl_logic;
        handle_error_i  : in     vl_logic;
        wdata_error_completed_o: out    vl_logic
    );
end axi_address_decoder_DW_N_INIT_PORT3_FIFO_DEPTH8_2;
