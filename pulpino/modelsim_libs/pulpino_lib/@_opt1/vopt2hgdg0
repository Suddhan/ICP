library verilog;
use verilog.vl_types.all;
entity apb_fll_if is
    port(
        HCLK            : in     vl_logic;
        HRESETn         : in     vl_logic;
        PADDR           : in     vl_logic_vector(11 downto 0);
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PWRITE          : in     vl_logic;
        PSEL            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PRDATA          : out    vl_logic_vector(31 downto 0);
        PREADY          : out    vl_logic;
        PSLVERR         : out    vl_logic;
        fll1_req        : out    vl_logic;
        fll1_wrn        : out    vl_logic;
        fll1_add        : out    vl_logic_vector(1 downto 0);
        fll1_data       : out    vl_logic_vector(31 downto 0);
        fll1_ack        : in     vl_logic;
        fll1_r_data     : in     vl_logic_vector(31 downto 0);
        fll1_lock       : in     vl_logic;
        fll2_req        : out    vl_logic;
        fll2_wrn        : out    vl_logic;
        fll2_add        : out    vl_logic_vector(1 downto 0);
        fll2_data       : out    vl_logic_vector(31 downto 0);
        fll2_ack        : in     vl_logic;
        fll2_r_data     : in     vl_logic_vector(31 downto 0);
        fll2_lock       : in     vl_logic
    );
end apb_fll_if;
