library verilog;
use verilog.vl_types.all;
entity uart_transmitter is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        TXCLK           : in     vl_logic;
        TXSTART         : in     vl_logic;
        CLEAR           : in     vl_logic;
        WLS             : in     vl_logic_vector(1 downto 0);
        STB             : in     vl_logic;
        PEN             : in     vl_logic;
        EPS             : in     vl_logic;
        SP              : in     vl_logic;
        BC              : in     vl_logic;
        DIN             : in     vl_logic_vector(7 downto 0);
        TXFINISHED      : out    vl_logic;
        SOUT            : out    vl_logic
    );
end uart_transmitter;
