library verilog;
use verilog.vl_types.all;
entity axi_BW_allocator_AXI_USER_W1_N_INIT_PORT3_N_TARG_PORT3_AXI_DATA_W32_AXI_ID_IN2_4672 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        \bid_i[0]\      : in     vl_logic_vector(3 downto 0);
        \bid_i[1]\      : in     vl_logic_vector(3 downto 0);
        \bid_i[2]\      : in     vl_logic_vector(3 downto 0);
        \bresp_i[0]\    : in     vl_logic_vector(1 downto 0);
        \bresp_i[1]\    : in     vl_logic_vector(1 downto 0);
        \bresp_i[2]\    : in     vl_logic_vector(1 downto 0);
        \buser_i[0]\    : in     vl_logic_vector(0 downto 0);
        \buser_i[1]\    : in     vl_logic_vector(0 downto 0);
        \buser_i[2]\    : in     vl_logic_vector(0 downto 0);
        bvalid_i        : in     vl_logic_vector(2 downto 0);
        bready_o        : out    vl_logic_vector(2 downto 0);
        bid_o           : out    vl_logic_vector(1 downto 0);
        bresp_o         : out    vl_logic_vector(1 downto 0);
        buser_o         : out    vl_logic_vector(0 downto 0);
        bvalid_o        : out    vl_logic;
        bready_i        : in     vl_logic;
        incr_req_i      : in     vl_logic;
        full_counter_o  : out    vl_logic;
        outstanding_trans_o: out    vl_logic;
        sample_awdata_info_i: in     vl_logic;
        error_req_i     : in     vl_logic;
        error_gnt_o     : out    vl_logic;
        error_user_i    : in     vl_logic_vector(0 downto 0);
        error_id_i      : in     vl_logic_vector(1 downto 0)
    );
end axi_BW_allocator_AXI_USER_W1_N_INIT_PORT3_N_TARG_PORT3_AXI_DATA_W32_AXI_ID_IN2_4672;
