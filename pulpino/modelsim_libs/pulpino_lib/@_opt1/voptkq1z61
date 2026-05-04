library verilog;
use verilog.vl_types.all;
entity riscv_fetch_fifo is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clear_i         : in     vl_logic;
        in_addr_i       : in     vl_logic_vector(31 downto 0);
        in_rdata_i      : in     vl_logic_vector(31 downto 0);
        in_valid_i      : in     vl_logic;
        in_ready_o      : out    vl_logic;
        in_replace2_i   : in     vl_logic;
        in_is_hwlp_i    : in     vl_logic;
        out_valid_o     : out    vl_logic;
        out_ready_i     : in     vl_logic;
        out_rdata_o     : out    vl_logic_vector(31 downto 0);
        out_addr_o      : out    vl_logic_vector(31 downto 0);
        unaligned_is_compressed_o: out    vl_logic;
        out_valid_stored_o: out    vl_logic;
        out_is_hwlp_o   : out    vl_logic
    );
end riscv_fetch_fifo;
