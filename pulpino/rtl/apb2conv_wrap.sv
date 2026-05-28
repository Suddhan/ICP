
/*module apb2conv_wrap
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)(
    input  logic                      CLK,
    input  logic                      RSTN,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,
    
    // Convolution Accelerator Interface
    output logic [31:0]                conv_input_o,
	output logic					   p_enable_wrap,
    input  logic [31:0]                conv_output_i
);

    logic [31:0] regs_w, regs_r;
	logic regs_en;

 assign regs_en = PENABLE;
    // register write logic
    always_comb
    begin
        regs_w = 0;
        if (PSEL && PENABLE && PWRITE)
        begin
            regs_w = PWDATA[31:0]; // Write the convolution output to the register
        end
    end
    always_comb
    begin
       regs_r = 0;

        if (PSEL && PENABLE && !PWRITE)
        begin
            regs_r = conv_output_i; // Read the convolution output to the register;
        end
    end
    always_ff @(posedge CLK, negedge RSTN)
    begin
        if(~RSTN)
        begin
            conv_input_o <= 0; // Clear the input data on reset
             PRDATA <= 0; // Clear the output data on reset
			p_enable_wrap <= 0;
        end
        else
        begin
			p_enable_wrap <= regs_en;
            if (PSEL && PENABLE && PWRITE)
            begin
                conv_input_o <= regs_w; // Send the input data to the convolution accelerator
            end else if(PSEL && PENABLE && !PWRITE) begin
                conv_input_o <= 0; // Clear the input data when reading
                PRDATA <= regs_r; // Output the convolution result

            end
        end
    end
    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

  conv_top conv_top_i (
    .clk             ( clk_i          ),
    .rst             ( ~rst_n         ),
	.p_enable		 ( p_enable_wrap  ),
    .apb_input       ( conv_output_i  ),
    .apb_output      ( conv_input_o   )
  );
endmodule*/

module apb2conv_wrap
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)(
    input  logic                      CLK,
    input  logic                      RSTN,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR
    


);

    logic [31:0] regs_w, regs_r;
	logic regs_en;
    logic					   p_enable_wrap;
    // Convolution Accelerator Interface
     logic [31:0]                conv_input_o;
     logic [31:0]                conv_output_i;
 assign regs_en = PENABLE;
    
    always_comb //write logic apb->acc
    begin
        regs_w = 0;
        if (PSEL && PENABLE && PWRITE)
        begin
            regs_w = PWDATA[31:0]; // Write the convolution output to the register
        end
    end


    always_comb  //read logic acc->apb
    begin
       regs_r = 0;

        if (PSEL && PENABLE && !PWRITE)
        begin
            regs_r = conv_output_i; // Read the convolution output to the register;
        end
    end


    always_ff @(posedge CLK, negedge RSTN)
    begin
        if(~RSTN)
        begin
            conv_input_o <= 0; // Clear the input data on reset
             PRDATA <= 0; // Clear the output data on reset
			p_enable_wrap <= 0;
        end
        else
        begin
			p_enable_wrap <= regs_en;
            if (PSEL && PENABLE && PWRITE)
            begin
                conv_input_o <= regs_w; // Send the input data to the convolution accelerator
            end else if(PSEL && PENABLE && !PWRITE) begin
                conv_input_o <= 0; // Clear the input data when reading
                PRDATA <= regs_r; // Output the convolution result

            end
        end
    end
    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;
conv_top conv_top_i (
    .clk             ( CLK          ),
    .rst             ( ~RSTN         ),
	  .p_enable		      (PENABLE),
    .apb_input       ( conv_input_o   ),
    .apb_output      ( conv_output_i  )
  );

endmodule
