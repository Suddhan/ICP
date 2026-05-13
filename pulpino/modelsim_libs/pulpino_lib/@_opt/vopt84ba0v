library verilog;
use verilog.vl_types.all;
entity spi_master_clkgen is
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        en              : in     vl_logic;
        clk_div         : in     vl_logic_vector(7 downto 0);
        clk_div_valid   : in     vl_logic;
        spi_clk         : out    vl_logic;
        spi_fall        : out    vl_logic;
        spi_rise        : out    vl_logic
    );
end spi_master_clkgen;
