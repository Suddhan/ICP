library verilog;
use verilog.vl_types.all;
entity spi_master_rx is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        en              : in     vl_logic;
        rx_edge         : in     vl_logic;
        rx_done         : out    vl_logic;
        sdi0            : in     vl_logic;
        sdi1            : in     vl_logic;
        sdi2            : in     vl_logic;
        sdi3            : in     vl_logic;
        en_quad_in      : in     vl_logic;
        counter_in      : in     vl_logic_vector(15 downto 0);
        counter_in_upd  : in     vl_logic;
        data            : out    vl_logic_vector(31 downto 0);
        data_ready      : in     vl_logic;
        data_valid      : out    vl_logic;
        clk_en_o        : out    vl_logic
    );
end spi_master_rx;
