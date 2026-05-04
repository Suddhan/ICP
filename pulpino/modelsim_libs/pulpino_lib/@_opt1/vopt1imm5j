library verilog;
use verilog.vl_types.all;
entity riscv_prefetch_buffer is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        req_i           : in     vl_logic;
        branch_i        : in     vl_logic;
        addr_i          : in     vl_logic_vector(31 downto 0);
        hwloop_i        : in     vl_logic;
        hwloop_target_i : in     vl_logic_vector(31 downto 0);
        hwlp_branch_o   : out    vl_logic;
        ready_i         : in     vl_logic;
        valid_o         : out    vl_logic;
        rdata_o         : out    vl_logic_vector(31 downto 0);
        addr_o          : out    vl_logic_vector(31 downto 0);
        is_hwlp_o       : out    vl_logic;
        instr_req_o     : out    vl_logic;
        instr_gnt_i     : in     vl_logic;
        instr_addr_o    : out    vl_logic_vector(31 downto 0);
        instr_rdata_i   : in     vl_logic_vector(31 downto 0);
        instr_rvalid_i  : in     vl_logic;
        busy_o          : out    vl_logic
    );
end riscv_prefetch_buffer;
