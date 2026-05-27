
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
                PRDATA <= conv_output_i; // Output the convolution result

            end
        end
    end
    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;


endmodule
