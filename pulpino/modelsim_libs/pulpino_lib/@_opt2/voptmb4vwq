library verilog;
use verilog.vl_types.all;
entity spi_slave_rx is
    port(
        sclk            : in     vl_logic;
        cs              : in     vl_logic;
        sdi0            : in     vl_logic;
        sdi1            : in     vl_logic;
        sdi2            : in     vl_logic;
        sdi3            : in     vl_logic;
        en_quad_in      : in     vl_logic;
        counter_in      : in     vl_logic_vector(7 downto 0);
        counter_in_upd  : in     vl_logic;
        data            : out    vl_logic_vector(31 downto 0);
        data_ready      : out    vl_logic
    );
end spi_slave_rx;
