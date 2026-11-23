//------------------------------------------------------------------------------
// conv_coverage class
//------------------------------------------------------------------------------
`ifndef CONV_COVERAGE_SVH
`define CONV_COVERAGE_SVH

class conv_coverage extends uvm_subscriber #(apb_seq_item);
  `uvm_component_utils(conv_coverage)

  apb_seq_item cov_item;

  covergroup cg_apb;
    option.per_instance = 1;

    cp_addr: coverpoint cov_item.addr {
      bins ctrl_status = {12'h000, 12'h004};
      bins weight_regs = {[12'h008:12'h010]};
      bins ofm_sram    = {[12'h200:12'hE3C]};
      bins ifm_buffers = {[12'h300:12'h60C]};
      bins unmapped    = default;
    }

    cp_write: coverpoint cov_item.write {
      bins read  = {1'b0};
      bins write = {1'b1};
    }

    cp_wait_states: coverpoint cov_item.wait_states {
      bins zero          = {0};
      bins one_wait      = {1};
      bins back_pressure = {[2:50]};
    }

    cp_resp: coverpoint cov_item.resp {
      bins ok  = {1'b0};
      bins err = {1'b1};
    }

    cross cp_addr, cp_write, cp_resp;
  endgroup

  function new(string name = "conv_coverage", uvm_component parent = null);
    super.new(name, parent);
    cg_apb = new();
  endfunction

  virtual function void write(apb_seq_item t);
    cov_item = t;
    cg_apb.sample();
  endfunction

endclass : conv_coverage

`endif
