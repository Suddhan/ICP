library verilog;
use verilog.vl_types.all;
entity spi_slave_controller_DUMMY_CYCLES32 is
    port(
        sclk            : in     vl_logic;
        sys_rstn        : in     vl_logic;
        cs              : in     vl_logic;
        en_quad         : out    vl_logic;
        pad_mode        : out    vl_logic_vector(1 downto 0);
        rx_counter      : out    vl_logic_vector(7 downto 0);
        rx_counter_upd  : out    vl_logic;
        rx_data         : in     vl_logic_vector(31 downto 0);
        rx_data_valid   : in     vl_logic;
        tx_counter      : out    vl_logic_vector(7 downto 0);
        tx_counter_upd  : out    vl_logic;
        tx_data         : out    vl_logic_vector(31 downto 0);
        tx_data_valid   : out    vl_logic;
        tx_done         : in     vl_logic;
        ctrl_rd_wr      : out    vl_logic;
        ctrl_addr       : out    vl_logic_vector(31 downto 0);
        ctrl_addr_valid : out    vl_logic;
        ctrl_data_rx    : out    vl_logic_vector(31 downto 0);
        ctrl_data_rx_valid: out    vl_logic;
        ctrl_data_rx_ready: in     vl_logic;
        ctrl_data_tx    : in     vl_logic_vector(31 downto 0);
        ctrl_data_tx_valid: in     vl_logic;
        ctrl_data_tx_ready: out    vl_logic;
        wrap_length     : out    vl_logic_vector(15 downto 0)
    );
end spi_slave_controller_DUMMY_CYCLES32;
