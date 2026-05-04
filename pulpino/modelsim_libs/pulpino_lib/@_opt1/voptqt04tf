library verilog;
use verilog.vl_types.all;
entity axi_BR_allocator_AXI_USER_W1_N_INIT_PORT3_N_TARG_PORT3_AXI_DATA_W32_AXI_ID_IN2_2 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        \rid_i[0]\      : in     vl_logic_vector(3 downto 0);
        \rid_i[1]\      : in     vl_logic_vector(3 downto 0);
        \rid_i[2]\      : in     vl_logic_vector(3 downto 0);
        \rdata_i[0]\    : in     vl_logic_vector(31 downto 0);
        \rdata_i[1]\    : in     vl_logic_vector(31 downto 0);
        \rdata_i[2]\    : in     vl_logic_vector(31 downto 0);
        \rresp_i[0]\    : in     vl_logic_vector(1 downto 0);
        \rresp_i[1]\    : in     vl_logic_vector(1 downto 0);
        \rresp_i[2]\    : in     vl_logic_vector(1 downto 0);
        rlast_i         : in     vl_logic_vector(2 downto 0);
        \ruser_i[0]\    : in     vl_logic_vector(0 downto 0);
        \ruser_i[1]\    : in     vl_logic_vector(0 downto 0);
        \ruser_i[2]\    : in     vl_logic_vector(0 downto 0);
        rvalid_i        : in     vl_logic_vector(2 downto 0);
        rready_o        : out    vl_logic_vector(2 downto 0);
        rid_o           : out    vl_logic_vector(1 downto 0);
        rdata_o         : out    vl_logic_vector(31 downto 0);
        rresp_o         : out    vl_logic_vector(1 downto 0);
        rlast_o         : out    vl_logic;
        ruser_o         : out    vl_logic_vector(0 downto 0);
        rvalid_o        : out    vl_logic;
        rready_i        : in     vl_logic;
        incr_req_i      : in     vl_logic;
        full_counter_o  : out    vl_logic;
        outstanding_trans_o: out    vl_logic;
        error_req_i     : in     vl_logic;
        error_gnt_o     : out    vl_logic;
        error_len_i     : in     vl_logic_vector(7 downto 0);
        error_user_i    : in     vl_logic_vector(0 downto 0);
        error_id_i      : in     vl_logic_vector(1 downto 0);
        sample_ardata_info_i: in     vl_logic
    );
end axi_BR_allocator_AXI_USER_W1_N_INIT_PORT3_N_TARG_PORT3_AXI_DATA_W32_AXI_ID_IN2_2;
