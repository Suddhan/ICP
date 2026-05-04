library verilog;
use verilog.vl_types.all;
entity uart_receiver is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        RXCLK           : in     vl_logic;
        RXCLEAR         : in     vl_logic;
        WLS             : in     vl_logic_vector(1 downto 0);
        STB             : in     vl_logic;
        PEN             : in     vl_logic;
        EPS             : in     vl_logic;
        SP              : in     vl_logic;
        SIN             : in     vl_logic;
        PE              : out    vl_logic;
        FE              : out    vl_logic;
        BI              : out    vl_logic;
        DOUT            : out    vl_logic_vector(7 downto 0);
        RXFINISHED      : out    vl_logic
    );
end uart_receiver;
