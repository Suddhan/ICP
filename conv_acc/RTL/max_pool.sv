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
logic [2:0] next_counter;
logic [2:0] flag;

assign next_counter = in_valid ? ((counter < 3'd4) ? counter + 1 : 1) : counter;

always_ff @(posedge clk) begin
    if(rst) begin
        counter <= 0;
    end else begin
        counter <= next_counter;
        pool_output <= max_value;
    end
end

always_comb begin: max_pool_logic
    if(in_valid) begin
        if(next_counter == 1) begin
            max_value = data;
            flag = 0;
        end else begin
            if(data > pool_output) begin
                max_value = data;
                flag = 1;
            end else begin
                max_value = pool_output;
                flag = 2;
            end
        end
    end
    else begin
        max_value = pool_output;
        flag = 3;
    end
end
assign out_valid = (next_counter == 3'd4 && in_valid) ? 1 : 0;
endmodule