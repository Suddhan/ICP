module conv_top(
input logic clk,
input logic rst,

input logic [31:0] apb_input,
output logic [31:0] apb_output

);
logic data_valid, pool_valid, filter_valid;


logic [7:0] i_data1, i_data2, i_data3, i_data4, i_data5;
logic [7:0] filter_weight;
logic filter_enable;
logic [20:0] filter_result;

logic [7:0] quantized_data;

logic [7:0] pool_output;

logic output_finish, input_finish;

logic [7:0] ofm_data;


always_ff @(posedge clk) begin
    if(rst) begin
        apb_output <= 0;
    end else begin
        if(input_finish) begin
            if(output_finish) apb_output <= 32'hFFFFFFFF; // Indicate end of output
            else apb_output <= {24'h00, ofm_data};
        end else begin
            apb_output <= 0;
        end
    end
end


input_handler ih(
    .clk(clk),
    .rst(rst),
    .input_data(apb_input),
    .data_out1(i_data1),
    .data_out2(i_data2),
    .data_out3(i_data3),
    .data_out4(i_data4),
    .data_out5(i_data5),
    .filter_data(filter_weight),
    .filter_enable(filter_enable),
    .valid(data_valid)

);

filter_top filter(
    .clk(clk),
    .rst(rst),
    .data_valid(data_valid),
    .filter_valid(filter_valid),
    .filter_load(filter_enable),
    .filter_weight(filter_weight),
    .i_data1(i_data1),
    .i_data2(i_data2),
    .i_data3(i_data3),
    .i_data4(i_data4),
    .i_data5(i_data5),
    .filter_result(filter_result)
);

quantizer quant(
    .filter_data(filter_result),
    .quantized_data(quantized_data)
);

max_pool pool(
    .data(quantized_data),
    .clk(clk),
    .in_valid(filter_valid),
    .rst(rst),
    .pool_output(pool_output),
    .out_valid(pool_valid)
);

out_map out(
    .in_data(pool_output),
    .valid(pool_valid),
    .clk(clk),
    .rst(rst),
    .out_data(ofm_data),
    .finish_input(input_finish),
    .finish_output(output_finish)
);



endmodule