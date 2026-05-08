library verilog;
use verilog.vl_types.all;
entity axi_read_only_ctrl_AXI4_ADDRESS_WIDTH32_AXI4_RDATA_WIDTH32_AXI4_WDATA_WIDTH32_AXI4_ID_WIDTH4_AXI4_USER_WIDTH1_AXI_NUMBYTES4_MEM_ADDR_WIDTH15 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        ARID_i          : in     vl_logic_vector(3 downto 0);
        ARADDR_i        : in     vl_logic_vector(31 downto 0);
        ARLEN_i         : in     vl_logic_vector(7 downto 0);
        ARSIZE_i        : in     vl_logic_vector(2 downto 0);
        ARBURST_i       : in     vl_logic_vector(1 downto 0);
        ARLOCK_i        : in     vl_logic;
        ARCACHE_i       : in     vl_logic_vector(3 downto 0);
        ARPROT_i        : in     vl_logic_vector(2 downto 0);
        ARREGION_i      : in     vl_logic_vector(3 downto 0);
        ARUSER_i        : in     vl_logic_vector(0 downto 0);
        ARQOS_i         : in     vl_logic_vector(3 downto 0);
        ARVALID_i       : in     vl_logic;
        ARREADY_o       : out    vl_logic;
        RID_o           : out    vl_logic_vector(3 downto 0);
        RDATA_o         : out    vl_logic_vector(31 downto 0);
        RRESP_o         : out    vl_logic_vector(1 downto 0);
        RLAST_o         : out    vl_logic;
        RUSER_o         : out    vl_logic_vector(0 downto 0);
        RVALID_o        : out    vl_logic;
        RREADY_i        : in     vl_logic;
        MEM_CEN_o       : out    vl_logic;
        MEM_WEN_o       : out    vl_logic;
        MEM_A_o         : out    vl_logic_vector(14 downto 0);
        MEM_D_o         : out    vl_logic_vector(31 downto 0);
        MEM_BE_o        : out    vl_logic_vector(3 downto 0);
        MEM_Q_i         : in     vl_logic_vector(31 downto 0);
        grant_i         : in     vl_logic;
        valid_o         : out    vl_logic
    );
end axi_read_only_ctrl_AXI4_ADDRESS_WIDTH32_AXI4_RDATA_WIDTH32_AXI4_WDATA_WIDTH32_AXI4_ID_WIDTH4_AXI4_USER_WIDTH1_AXI_NUMBYTES4_MEM_ADDR_WIDTH15;
