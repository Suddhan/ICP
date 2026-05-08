library verilog;
use verilog.vl_types.all;
entity spi_slave_tx is
    port(
        test_mode       : in     vl_logic;
        sclk            : in     vl_logic;
        cs              : in     vl_logic;
        sdo0            : out    vl_logic;
        sdo1            : out    vl_logic;
        sdo2            : out    vl_logic;
        sdo3            : out    vl_logic;
        en_quad_in      : in     vl_logic;
        counter_in      : in     vl_logic_vector(7 downto 0);
        counter_in_upd  : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        data_valid      : in     vl_logic;
        done            : out    vl_logic
    );
end spi_slave_tx;
