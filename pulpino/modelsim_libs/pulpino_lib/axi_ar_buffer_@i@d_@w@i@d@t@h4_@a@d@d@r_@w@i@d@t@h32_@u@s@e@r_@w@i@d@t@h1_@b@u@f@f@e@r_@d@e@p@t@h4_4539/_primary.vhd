library verilog;
use verilog.vl_types.all;
entity axi_ar_buffer_ID_WIDTH4_ADDR_WIDTH32_USER_WIDTH1_BUFFER_DEPTH4_4539 is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        test_en_i       : in     vl_logic;
        slave_valid_i   : in     vl_logic;
        slave_addr_i    : in     vl_logic_vector(31 downto 0);
        slave_prot_i    : in     vl_logic_vector(2 downto 0);
        slave_region_i  : in     vl_logic_vector(3 downto 0);
        slave_len_i     : in     vl_logic_vector(7 downto 0);
        slave_size_i    : in     vl_logic_vector(2 downto 0);
        slave_burst_i   : in     vl_logic_vector(1 downto 0);
        slave_lock_i    : in     vl_logic;
        slave_cache_i   : in     vl_logic_vector(3 downto 0);
        slave_qos_i     : in     vl_logic_vector(3 downto 0);
        slave_id_i      : in     vl_logic_vector(3 downto 0);
        slave_user_i    : in     vl_logic_vector(0 downto 0);
        slave_ready_o   : out    vl_logic;
        master_valid_o  : out    vl_logic;
        master_addr_o   : out    vl_logic_vector(31 downto 0);
        master_prot_o   : out    vl_logic_vector(2 downto 0);
        master_region_o : out    vl_logic_vector(3 downto 0);
        master_len_o    : out    vl_logic_vector(7 downto 0);
        master_size_o   : out    vl_logic_vector(2 downto 0);
        master_burst_o  : out    vl_logic_vector(1 downto 0);
        master_lock_o   : out    vl_logic;
        master_cache_o  : out    vl_logic_vector(3 downto 0);
        master_qos_o    : out    vl_logic_vector(3 downto 0);
        master_id_o     : out    vl_logic_vector(3 downto 0);
        master_user_o   : out    vl_logic_vector(0 downto 0);
        master_ready_i  : in     vl_logic
    );
end axi_ar_buffer_ID_WIDTH4_ADDR_WIDTH32_USER_WIDTH1_BUFFER_DEPTH4_4539;
