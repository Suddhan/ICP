library verilog;
use verilog.vl_types.all;
entity riscv_alu_SHARED_INT_DIV0_FPU0 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        enable_i        : in     vl_logic;
        operator_i      : in     vl_logic_vector(6 downto 0);
        operand_a_i     : in     vl_logic_vector(31 downto 0);
        operand_b_i     : in     vl_logic_vector(31 downto 0);
        operand_c_i     : in     vl_logic_vector(31 downto 0);
        vector_mode_i   : in     vl_logic_vector(1 downto 0);
        bmask_a_i       : in     vl_logic_vector(4 downto 0);
        bmask_b_i       : in     vl_logic_vector(4 downto 0);
        imm_vec_ext_i   : in     vl_logic_vector(1 downto 0);
        result_o        : out    vl_logic_vector(31 downto 0);
        comparison_result_o: out    vl_logic;
        ready_o         : out    vl_logic;
        ex_ready_i      : in     vl_logic
    );
end riscv_alu_SHARED_INT_DIV0_FPU0;
