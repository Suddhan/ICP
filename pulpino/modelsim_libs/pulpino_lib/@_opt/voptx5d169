library verilog;
use verilog.vl_types.all;
entity adbg_or1k_biu_NB_CORES1 is
    port(
        tck_i           : in     vl_logic;
        trstn_i         : in     vl_logic;
        cpu_select_i    : in     vl_logic_vector(3 downto 0);
        data_i          : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        addr_i          : in     vl_logic_vector(31 downto 0);
        strobe_i        : in     vl_logic;
        rd_wrn_i        : in     vl_logic;
        rdy_o           : out    vl_logic;
        cpu_clk_i       : in     vl_logic;
        cpu_rstn_i      : in     vl_logic;
        \cpu_addr_o[0]\ : out    vl_logic_vector(15 downto 0);
        \cpu_data_i[0]\ : in     vl_logic_vector(31 downto 0);
        \cpu_data_o[0]\ : out    vl_logic_vector(31 downto 0);
        cpu_stb_o       : out    vl_logic_vector(0 downto 0);
        cpu_we_o        : out    vl_logic_vector(0 downto 0);
        cpu_ack_i       : in     vl_logic_vector(0 downto 0)
    );
end adbg_or1k_biu_NB_CORES1;
