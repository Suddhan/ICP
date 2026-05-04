library verilog;
use verilog.vl_types.all;
entity cluster_clock_mux2 is
    port(
        clk0_i          : in     vl_logic;
        clk1_i          : in     vl_logic;
        clk_sel_i       : in     vl_logic;
        clk_o           : out    vl_logic
    );
end cluster_clock_mux2;
