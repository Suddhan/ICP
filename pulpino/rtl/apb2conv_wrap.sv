
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
    input  logic [31:0]                conv_output_i
);

    logic [31:0] regs_c, regs_n;

    assign register_adr = PADDR[2:0];

    // register write logic
    always_comb
    begin
        regs_n = regs_c;

        if (PSEL && PENABLE && PWRITE)
        begin
            regs_n = PWDATA[31:0]; // Write the convolution output to the register
        end
    end
    always_comb
    begin
        PRDATA = 'b0;

        if (PSEL && PENABLE && !PWRITE)
        begin
            regs_n = conv_output_i; // Read the convolution output to theregister;
        end
    end
    always_ff @(posedge CLK, negedge RSTN)
    begin
        if(~RSTN)
        begin
            regs_c <= 0;
        end
        else
        begin
            regs_c <= regs_n;
            if (PSEL && PENABLE && PWRITE)
            begin
                conv_input_o <= regs_c; // Send the input data to the convolution accelerator
            end else if(PSEL && PENABLE && !PWRITE) begin
                conv_input_o <= 0; // Clear the input data when reading
                PRDATA <= regs_c; // Output the convolution result

            end
            else regsc <= reg_n;
        end
    end
    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;


endmodule