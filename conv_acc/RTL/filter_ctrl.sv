
module filter_ctrl(
input logic [18:0] psum,
input logic valid_in,

input logic clk,
input logic rst,

output logic valid_out,
output logic [20:0] filter_result
);
logic [18:0] data1,data2,data3,data4,data5;
//logic [20:0] sum1,sum2;
logic [2:0] counter;
//logic [20:0] next_filter_result;

always_ff @( posedge clk ) begin : update_registers
    if(rst)begin
        data1 <= 0;
        data2 <= 0;
        data3 <= 0;
        data4 <= 0;
        data5 <= 0;
        counter <= 0;
    end else begin
        if (valid_in) begin
            counter <= (counter < 5) ? counter + 1 : 3'b001;
            data1 <= data2;
            data2 <= data3;
            data3 <= data4;
            data4 <= data5;
            data5 <= psum;
            //filter_result <= next_filter_result;
        end else begin
            counter <= counter;
            data1 <= data1;
            data2 <= data2;
            data3 <= data3;
            data4 <= data4;
            data5 <= data5;
            //filter_result <= filter_result;
        end
        
    end
    
end


   // sum1 = data1 + data2;
    //sum2 = data3 + data4;
    //filter_result = sum1 + sum2 + i_data1;
always_comb begin
    filter_result = data2 + data5 + data3 + data4 + psum;
  
  
end
assign valid_out = (counter == 4 && valid_in);

endmodule