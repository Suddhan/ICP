library verilog;
use verilog.vl_types.all;
entity adbg_or1k_module_NB_CORES1 is
    port(
        tck_i           : in     vl_logic;
        module_tdo_o    : out    vl_logic;
        tdi_i           : in     vl_logic;
        capture_dr_i    : in     vl_logic;
        shift_dr_i      : in     vl_logic;
        update_dr_i     : in     vl_logic;
        data_register_i : in     vl_logic_vector(56 downto 0);
        module_select_i : in     vl_logic;
        top_inhibit_o   : out    vl_logic;
        trstn_i         : in     vl_logic;
        cpu_clk_i       : in     vl_logic;
        cpu_rstn_i      : in     vl_logic;
        \cpu_addr_o[0]\ : out    vl_logic_vector(15 downto 0);
        \cpu_data_i[0]\ : in     vl_logic_vector(31 downto 0);
        \cpu_data_o[0]\ : out    vl_logic_vector(31 downto 0);
        cpu_bp_i        : in     vl_logic_vector(0 downto 0);
        cpu_stall_o     : out    vl_logic_vector(0 downto 0);
        cpu_stb_o       : out    vl_logic_vector(0 downto 0);
        cpu_we_o        : out    vl_logic_vector(0 downto 0);
        cpu_ack_i       : in     vl_logic_vector(0 downto 0)
    );
end adbg_or1k_module_NB_CORES1;
