library verilog;
use verilog.vl_types.all;
entity sleep_unit_APB_ADDR_WIDTH12 is
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
        irq_i           : in     vl_logic;
        event_i         : in     vl_logic;
        core_busy_i     : in     vl_logic;
        fetch_en_o      : out    vl_logic;
        clk_gate_core_o : out    vl_logic
    );
end sleep_unit_APB_ADDR_WIDTH12;
