
module filter_top(
input logic clk,
input logic rst,
input logic data_valid,

input logic filter_load,
input logic [7:0] filter_weight,

input logic [7:0] i_data1, i_data2, i_data3, i_data4, i_data5,

output logic filter_valid,
output logic [20:0] filter_result
);
logic [7:0] filter1 [0:4];
logic [7:0] filter2 [0:4];
logic [7:0] filter3 [0:4];
logic [7:0] filter4 [0:4];
logic [7:0] filter5 [0:4];

logic [15:0] mult1_result, mult2_result, mult3_result, mult4_result, mult5_result;

logic [18:0] accum_result;

logic [4:0] loading_index, next_loading_index;
logic [2:0] filter_index, next_filter_index;


always_ff @(posedge clk ) begin : filter_loading
    if(rst) begin
        filter1 <= '{default:8'h00};
        filter2 <= '{default:8'h00};
        filter3 <= '{default:8'h00};
        filter4 <= '{default:8'h00};
        filter5 <= '{default:8'h00};
        loading_index <= 0;
        next_loading_index <= 0;
        filter_index <= 0;
        next_filter_index <= 0;
    end else begin if(filter_load) begin
        case(loading_index) inside

        [0:4] : begin 
            filter1[loading_index] <= filter_weight;
            loading_index <= loading_index + 1;
        end

        [5:9] : begin
            filter2[loading_index - 5] <= filter_weight;
            loading_index <= loading_index + 1;
        end

        [10:14] : begin
            filter3[loading_index - 10] <= filter_weight;
            loading_index <= loading_index + 1;
        end

        [15:19] : begin
            filter4[loading_index -15] <= filter_weight;
            loading_index <= loading_index + 1;
        end

        [20:24] : begin
            filter5[loading_index - 20] <= filter_weight;
            loading_index <= loading_index + 1;
        end

        default: loading_index <= loading_index;
        endcase
    end else begin
        if(data_valid) begin 
            filter_index <= next_filter_index;
            next_filter_index <= (next_filter_index == 4) ? 0 : next_filter_index + 1;
        end
        else  filter_index <= filter_index;

    end
        
    end

end


partial_mult mult1(
    .data(i_data1), 
    .filter(filter1[filter_index]), 
    .result(mult1_result)
    );

partial_mult mult2(
    .data(i_data2), 
    .filter(filter2[filter_index]), 
    .result(mult2_result)
);
partial_mult mult3(
    .data(i_data3), 
    .filter(filter3[filter_index]), 
    .result(mult3_result)
);
partial_mult mult4(
    .data(i_data4), 
    .filter(filter4[filter_index]), 
    .result(mult4_result)
);
partial_mult mult5(
    .data(i_data5), 
    .filter(filter5[filter_index]), 
    .result(mult5_result)
);
accum_partial accum(
    .mult1(mult1_result),
    .mult2(mult2_result),
    .mult3(mult3_result),
    .mult4(mult4_result),
    .mult5(mult5_result),
    .accum_result(accum_result)
);

filter_ctrl ctrl(
    .psum(accum_result),
    .valid_in(data_valid),
    .clk(clk),
    .rst(rst),
    .valid_out(filter_valid),
    .filter_result(filter_result)
);



endmodule