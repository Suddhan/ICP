library verilog;
use verilog.vl_types.all;
entity apb2per_PER_ADDR_WIDTH15_APB_ADDR_WIDTH32 is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        PADDR           : in     vl_logic_vector(31 downto 0);
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PWRITE          : in     vl_logic;
        PSEL            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PRDATA          : out    vl_logic_vector(31 downto 0);
        PREADY          : out    vl_logic;
        PSLVERR         : out    vl_logic;
        per_master_req_o: out    vl_logic;
        per_master_add_o: out    vl_logic_vector(14 downto 0);
        per_master_we_o : out    vl_logic;
        per_master_wdata_o: out    vl_logic_vector(31 downto 0);
        per_master_be_o : out    vl_logic_vector(3 downto 0);
        per_master_gnt_i: in     vl_logic;
        per_master_r_valid_i: in     vl_logic;
        per_master_r_opc_i: in     vl_logic;
        per_master_r_rdata_i: in     vl_logic_vector(31 downto 0)
    );
end apb2per_PER_ADDR_WIDTH15_APB_ADDR_WIDTH32;
