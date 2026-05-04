library verilog;
use verilog.vl_types.all;
entity riscv_mult_SHARED_DSP_MULT0 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        enable_i        : in     vl_logic;
        operator_i      : in     vl_logic_vector(2 downto 0);
        short_subword_i : in     vl_logic;
        short_signed_i  : in     vl_logic_vector(1 downto 0);
        op_a_i          : in     vl_logic_vector(31 downto 0);
        op_b_i          : in     vl_logic_vector(31 downto 0);
        op_c_i          : in     vl_logic_vector(31 downto 0);
        imm_i           : in     vl_logic_vector(4 downto 0);
        dot_signed_i    : in     vl_logic_vector(1 downto 0);
        dot_op_a_i      : in     vl_logic_vector(31 downto 0);
        dot_op_b_i      : in     vl_logic_vector(31 downto 0);
        dot_op_c_i      : in     vl_logic_vector(31 downto 0);
        result_o        : out    vl_logic_vector(31 downto 0);
        multicycle_o    : out    vl_logic;
        ready_o         : out    vl_logic;
        ex_ready_i      : in     vl_logic
    );
end riscv_mult_SHARED_DSP_MULT0;
