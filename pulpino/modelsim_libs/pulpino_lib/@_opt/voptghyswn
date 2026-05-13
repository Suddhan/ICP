library verilog;
use verilog.vl_types.all;
entity riscv_int_controller_PULP_SECURE0 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        irq_req_ctrl_o  : out    vl_logic;
        irq_sec_ctrl_o  : out    vl_logic;
        irq_id_ctrl_o   : out    vl_logic_vector(4 downto 0);
        ctrl_ack_i      : in     vl_logic;
        ctrl_kill_i     : in     vl_logic;
        irq_i           : in     vl_logic;
        irq_sec_i       : in     vl_logic;
        irq_id_i        : in     vl_logic_vector(4 downto 0);
        m_IE_i          : in     vl_logic;
        u_IE_i          : in     vl_logic;
        current_priv_lvl_i: in     vl_logic_vector(1 downto 0)
    );
end riscv_int_controller_PULP_SECURE0;
