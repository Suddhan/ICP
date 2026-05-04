library verilog;
use verilog.vl_types.all;
entity spi_master_tx is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        en              : in     vl_logic;
        tx_edge         : in     vl_logic;
        tx_done         : out    vl_logic;
        sdo0            : out    vl_logic;
        sdo1            : out    vl_logic;
        sdo2            : out    vl_logic;
        sdo3            : out    vl_logic;
        en_quad_in      : in     vl_logic;
        counter_in      : in     vl_logic_vector(15 downto 0);
        counter_in_upd  : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        data_valid      : in     vl_logic;
        data_ready      : out    vl_logic;
        clk_en_o        : out    vl_logic
    );
end spi_master_tx;
