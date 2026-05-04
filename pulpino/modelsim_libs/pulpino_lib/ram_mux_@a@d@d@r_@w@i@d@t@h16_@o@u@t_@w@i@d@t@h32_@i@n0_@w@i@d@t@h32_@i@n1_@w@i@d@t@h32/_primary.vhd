library verilog;
use verilog.vl_types.all;
entity ram_mux_ADDR_WIDTH16_OUT_WIDTH32_IN0_WIDTH32_IN1_WIDTH32 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        port0_req_i     : in     vl_logic;
        port0_gnt_o     : out    vl_logic;
        port0_rvalid_o  : out    vl_logic;
        port0_addr_i    : in     vl_logic_vector(15 downto 0);
        port0_we_i      : in     vl_logic;
        port0_be_i      : in     vl_logic_vector(3 downto 0);
        port0_rdata_o   : out    vl_logic_vector(31 downto 0);
        port0_wdata_i   : in     vl_logic_vector(31 downto 0);
        port1_req_i     : in     vl_logic;
        port1_gnt_o     : out    vl_logic;
        port1_rvalid_o  : out    vl_logic;
        port1_addr_i    : in     vl_logic_vector(15 downto 0);
        port1_we_i      : in     vl_logic;
        port1_be_i      : in     vl_logic_vector(3 downto 0);
        port1_rdata_o   : out    vl_logic_vector(31 downto 0);
        port1_wdata_i   : in     vl_logic_vector(31 downto 0);
        ram_en_o        : out    vl_logic;
        ram_addr_o      : out    vl_logic_vector(15 downto 0);
        ram_we_o        : out    vl_logic;
        ram_be_o        : out    vl_logic_vector(3 downto 0);
        ram_rdata_i     : in     vl_logic_vector(31 downto 0);
        ram_wdata_o     : out    vl_logic_vector(31 downto 0)
    );
end ram_mux_ADDR_WIDTH16_OUT_WIDTH32_IN0_WIDTH32_IN1_WIDTH32;
