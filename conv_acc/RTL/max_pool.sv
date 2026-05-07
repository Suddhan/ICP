module max_pool(
    input logic [7:0] data,
    input logic in_valid,
    input logic clk,
    input logic rst,

    output logic [7:0] pool_output,
    output logic out_valid
);
logic [2:0] counter;
logic [7:0] max_value;
always_ff @(posedge clk) begin
    if(rst) begin
        counter <= 0;
    
    end else begin
        if(in_valid) begin
            counter <= (counter < 3'd4) ? counter + 1 : 1;
        end else begin
            counter <= counter;
        end
    end
end

always_comb begin: max_pool_logic
    if(counter == 0) begin
        max_value = data;
    end else begin
        if(data > max_value) begin
            max_value = data;
        end else begin
            max_value = max_value;
        end

    end
end
assign pool_output = max_value;
assign out_valid = (counter == 3'd4) ? 1 : 0;
endmodule