library verilog;
use verilog.vl_types.all;
entity riscv_alu_div is
    port(
        Clk_CI          : in     vl_logic;
        Rst_RBI         : in     vl_logic;
        OpA_DI          : in     vl_logic_vector(31 downto 0);
        OpB_DI          : in     vl_logic_vector(31 downto 0);
        OpBShift_DI     : in     vl_logic_vector(5 downto 0);
        OpBIsZero_SI    : in     vl_logic;
        OpBSign_SI      : in     vl_logic;
        OpCode_SI       : in     vl_logic_vector(1 downto 0);
        InVld_SI        : in     vl_logic;
        OutRdy_SI       : in     vl_logic;
        OutVld_SO       : out    vl_logic;
        Res_DO          : out    vl_logic_vector(31 downto 0)
    );
end riscv_alu_div;
