vlog -sv -timescale 1ns/1ns +acc=pr \
        +incdir+uvc/clock_uvc+uvc/reset_uvc+uvc/apb_uvc+conv_acc/tb \
        uvc/clock_uvc/clock_if.sv uvc/reset_uvc/reset_if.sv uvc/apb_uvc/apb_if.sv \
        conv_acc/dut/wt_rf.sv conv_acc/dut/ifm_stream_buf.sv conv_acc/dut/line_buffer.sv conv_acc/dut/window_regs.sv \
        conv_acc/dut/mac_array.sv conv_acc/dut/ofm_sram_wrap.sv conv_acc/dut/ctrl_fsm.sv conv_acc/dut/apb_wrapper.sv \
        conv_acc/dut/apb_ctrl.sv conv_acc/dut/conv_top.sv conv_acc/tb/tb_pkg.sv conv_acc/tb/tb_top.sv
vsim  -i work.tb_top -coverage +UVM_NO_RELNOTES +UVM_VERBOSITY=UVM_HIGH +UVM_TESTNAME=base_test
