library verilog;
use verilog.vl_types.all;
entity clk_rst_gen is
    port(
        clk_i           : in     vl_logic;
        rstn_i          : in     vl_logic;
        clk_sel_i       : in     vl_logic;
        clk_standalone_i: in     vl_logic;
        testmode_i      : in     vl_logic;
        scan_en_i       : in     vl_logic;
        scan_i          : in     vl_logic;
        scan_o          : out    vl_logic;
        fll_req_i       : in     vl_logic;
        fll_wrn_i       : in     vl_logic;
        fll_add_i       : in     vl_logic_vector(1 downto 0);
        fll_data_i      : in     vl_logic_vector(31 downto 0);
        fll_ack_o       : out    vl_logic;
        fll_r_data_o    : out    vl_logic_vector(31 downto 0);
        fll_lock_o      : out    vl_logic;
        clk_o           : out    vl_logic;
        rstn_o          : out    vl_logic
    );
end clk_rst_gen;
