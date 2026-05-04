library verilog;
use verilog.vl_types.all;
entity axi_address_decoder_BW_N_TARG_PORT3_AXI_ID_IN2_4537 is
    port(
        bid_i           : in     vl_logic_vector(3 downto 0);
        bvalid_i        : in     vl_logic;
        bready_o        : out    vl_logic;
        bvalid_o        : out    vl_logic_vector(2 downto 0);
        bready_i        : in     vl_logic_vector(2 downto 0)
    );
end axi_address_decoder_BW_N_TARG_PORT3_AXI_ID_IN2_4537;
