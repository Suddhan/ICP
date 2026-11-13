module ofm_sram(
    //144 for output feature map(0 : 10001111, 0x90)
    //25 for filter weights(0x96: 0xAF)
    //parameter DATA_WIDTH = 8,
    //parameter ADDR_WIDTH = 8, 
    input logic [7:0] data_in,
    input logic [7:0] addr,
    input logic we, // write enable
    input logic re, // read enable
    input logic clk,
    input logic rst,
    output logic [7:0] data_out
);

logic [7:0] mem [0:255];

 // Write port
    always_ff @(posedge clk) begin : write_logic
        if (rst) mem <= '{default:8'h00};
        else begin
            if (we) begin
            mem[addr] <= data_in;
        end else begin
            mem[addr] <= mem[addr];
        end
    end
    end

    // Read port — SEPARATE always block (critical for SRAM inference)
    always_ff @(posedge clk) begin : read_logic
        if (re) begin
            data_out <= mem[addr];
        end else begin
            data_out <= data_out;
        end
    end

endmodule