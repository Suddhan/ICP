library verilog;
use verilog.vl_types.all;
entity uart_interrupt is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        IER             : in     vl_logic_vector(3 downto 0);
        LSR             : in     vl_logic_vector(4 downto 0);
        THI             : in     vl_logic;
        RDA             : in     vl_logic;
        CTI             : in     vl_logic;
        AFE             : in     vl_logic;
        MSR             : in     vl_logic_vector(3 downto 0);
        IIR             : out    vl_logic_vector(3 downto 0);
        INT             : out    vl_logic
    );
end uart_interrupt;
