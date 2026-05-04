library verilog;
use verilog.vl_types.all;
entity riscv_hwloop_controller_N_REGS2 is
    port(
        current_pc_i    : in     vl_logic_vector(31 downto 0);
        \hwlp_start_addr_i[0]\: in     vl_logic_vector(31 downto 0);
        \hwlp_start_addr_i[1]\: in     vl_logic_vector(31 downto 0);
        \hwlp_end_addr_i[0]\: in     vl_logic_vector(31 downto 0);
        \hwlp_end_addr_i[1]\: in     vl_logic_vector(31 downto 0);
        \hwlp_counter_i[0]\: in     vl_logic_vector(31 downto 0);
        \hwlp_counter_i[1]\: in     vl_logic_vector(31 downto 0);
        hwlp_dec_cnt_o  : out    vl_logic_vector(1 downto 0);
        hwlp_dec_cnt_id_i: in     vl_logic_vector(1 downto 0);
        hwlp_jump_o     : out    vl_logic;
        hwlp_targ_addr_o: out    vl_logic_vector(31 downto 0)
    );
end riscv_hwloop_controller_N_REGS2;
