library verilog;
use verilog.vl_types.all;
entity riscv_hwloop_regs_N_REGS2 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        hwlp_start_data_i: in     vl_logic_vector(31 downto 0);
        hwlp_end_data_i : in     vl_logic_vector(31 downto 0);
        hwlp_cnt_data_i : in     vl_logic_vector(31 downto 0);
        hwlp_we_i       : in     vl_logic_vector(2 downto 0);
        hwlp_regid_i    : in     vl_logic_vector(0 downto 0);
        valid_i         : in     vl_logic;
        hwlp_dec_cnt_i  : in     vl_logic_vector(1 downto 0);
        \hwlp_start_addr_o[0]\: out    vl_logic_vector(31 downto 0);
        \hwlp_start_addr_o[1]\: out    vl_logic_vector(31 downto 0);
        \hwlp_end_addr_o[0]\: out    vl_logic_vector(31 downto 0);
        \hwlp_end_addr_o[1]\: out    vl_logic_vector(31 downto 0);
        \hwlp_counter_o[0]\: out    vl_logic_vector(31 downto 0);
        \hwlp_counter_o[1]\: out    vl_logic_vector(31 downto 0)
    );
end riscv_hwloop_regs_N_REGS2;
