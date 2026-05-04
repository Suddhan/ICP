library verilog;
use verilog.vl_types.all;
entity riscv_load_store_unit is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_req_o      : out    vl_logic;
        data_gnt_i      : in     vl_logic;
        data_rvalid_i   : in     vl_logic;
        data_err_i      : in     vl_logic;
        data_addr_o     : out    vl_logic_vector(31 downto 0);
        data_we_o       : out    vl_logic;
        data_be_o       : out    vl_logic_vector(3 downto 0);
        data_wdata_o    : out    vl_logic_vector(31 downto 0);
        data_rdata_i    : in     vl_logic_vector(31 downto 0);
        data_we_ex_i    : in     vl_logic;
        data_type_ex_i  : in     vl_logic_vector(1 downto 0);
        data_wdata_ex_i : in     vl_logic_vector(31 downto 0);
        data_reg_offset_ex_i: in     vl_logic_vector(1 downto 0);
        data_sign_ext_ex_i: in     vl_logic;
        data_rdata_ex_o : out    vl_logic_vector(31 downto 0);
        data_req_ex_i   : in     vl_logic;
        operand_a_ex_i  : in     vl_logic_vector(31 downto 0);
        operand_b_ex_i  : in     vl_logic_vector(31 downto 0);
        addr_useincr_ex_i: in     vl_logic;
        data_misaligned_ex_i: in     vl_logic;
        data_misaligned_o: out    vl_logic;
        load_err_o      : out    vl_logic;
        store_err_o     : out    vl_logic;
        lsu_ready_ex_o  : out    vl_logic;
        lsu_ready_wb_o  : out    vl_logic;
        ex_valid_i      : in     vl_logic;
        busy_o          : out    vl_logic
    );
end riscv_load_store_unit;
