library verilog;
use verilog.vl_types.all;
entity axi_ArbitrationTree_AUX_WIDTH36_ID_WIDTH2_N_MASTER3_4477 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_req_i      : in     vl_logic_vector(2 downto 0);
        \data_AUX_i[0]\ : in     vl_logic_vector(35 downto 0);
        \data_AUX_i[1]\ : in     vl_logic_vector(35 downto 0);
        \data_AUX_i[2]\ : in     vl_logic_vector(35 downto 0);
        \data_ID_i[0]\  : in     vl_logic_vector(1 downto 0);
        \data_ID_i[1]\  : in     vl_logic_vector(1 downto 0);
        \data_ID_i[2]\  : in     vl_logic_vector(1 downto 0);
        data_gnt_o      : out    vl_logic_vector(2 downto 0);
        data_req_o      : out    vl_logic;
        data_AUX_o      : out    vl_logic_vector(35 downto 0);
        data_ID_o       : out    vl_logic_vector(1 downto 0);
        data_gnt_i      : in     vl_logic;
        lock            : in     vl_logic;
        SEL_EXCLUSIVE   : in     vl_logic_vector(1 downto 0)
    );
end axi_ArbitrationTree_AUX_WIDTH36_ID_WIDTH2_N_MASTER3_4477;
