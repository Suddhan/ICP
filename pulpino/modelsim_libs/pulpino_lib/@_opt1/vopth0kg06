library verilog;
use verilog.vl_types.all;
entity apb_spi_master_BUFFER_DEPTH8 is
    port(
        HCLK            : in     vl_logic;
        HRESETn         : in     vl_logic;
        PADDR           : in     vl_logic_vector(11 downto 0);
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PWRITE          : in     vl_logic;
        PSEL            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PRDATA          : out    vl_logic_vector(31 downto 0);
        PREADY          : out    vl_logic;
        PSLVERR         : out    vl_logic;
        events_o        : out    vl_logic_vector(1 downto 0);
        spi_clk         : out    vl_logic;
        spi_csn0        : out    vl_logic;
        spi_csn1        : out    vl_logic;
        spi_csn2        : out    vl_logic;
        spi_csn3        : out    vl_logic;
        spi_mode        : out    vl_logic_vector(1 downto 0);
        spi_sdo0        : out    vl_logic;
        spi_sdo1        : out    vl_logic;
        spi_sdo2        : out    vl_logic;
        spi_sdo3        : out    vl_logic;
        spi_sdi0        : in     vl_logic;
        spi_sdi1        : in     vl_logic;
        spi_sdi2        : in     vl_logic;
        spi_sdi3        : in     vl_logic
    );
end apb_spi_master_BUFFER_DEPTH8;
