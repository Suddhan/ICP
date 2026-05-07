module input_handler(
    input logic [31:0] input_data,
    input logic clk,
    input logic rst,

    output logic [7:0] data_out1,data_out2,data_out3,data_out4, data_out5,
    output logic [7:0] filter_data,
    output logic filter_enable,
    output logic valid
);
 typedef enum  {filter_load, ifm_active, off} state_type;
    state_type current_state, next_state;

//logic enable,next_enable;
logic [7:0] data1, data2, data3, data6;
logic counter; // send data every 2 cycles.
always_ff @( posedge clk ) begin
    if(rst)begin
        data_out1 <= 0;
        data_out2 <= 0;
        data_out3 <= 0;
        data_out4 <= 0;
        data_out5 <= 0;
        filter_data <= 0; 
        counter <= 0;
        filter_enable <= 0;
        current_state <= off;
        //enable <= 0;
        current_state <= off;
    end
    else begin
        case(current_state) //moving of data based on state
            filter_load : begin
                filter_data <= data1;
                filter_enable <= 1;
            end
            ifm_active : begin
                data_out1 <= data_out4;
                data_out2 <= data_out5;
                data_out3 <= data6;
                data_out4 <= data1;
                data_out5 <= data2;
                data6 <= data3;
                filter_enable <= 0;
                //logic for valid output
                valid <= (counter == 1) ? 1 : 0; // valid every 2 cycles
                counter <= (counter == 1) ? 0: 1;

            end
            default: begin
                valid = 0;
                data_out1 <= 0;
                data_out2 <= 0;
                data_out3 <= 0;
                data_out4 <= 0;
                data_out5 <= 0;
                counter <= 0;

            end 
        endcase
        current_state <= next_state;
    end
       
        //enable <= 0;
end

//shouldnt need enable with state based approach.

/*always_ff @(posedge clk ) begin : enable_toggle // special codes to control the accelerator
if(enable && input_data[31:24] != 8'h00 && current_state == ifm_active) begin
    enable = 1;
end else if (input_data[31:24] == 8'hFF && current_state == ) begin
    enable = 1;
end else enable = 0;

end*/

//might be redundant
always_comb begin: data_extraction //can only pull 3 pieces of data at one time due to special codes
    data1 = input_data[23:16];
    data2 = input_data[15:8];
    data3 = input_data[7:0];
end

always_comb begin: state_machine_updates
    case(current_state)
        off : begin
            if(input_data[31:24] == 8'hAF) begin
                next_state = filter_load;
            end else begin 
                next_state = off;
            end
        end
        filter_load : begin
            if(input_data[31:24] == 8'hFF) begin
                next_state = ifm_active;
            end else begin  
                next_state = filter_load; 
            end
        end
        ifm_active : begin
            if(input_data[31:24] == 8'hFF) begin
                next_state = ifm_active;
            end else begin  
                next_state = off; 
            end
        end
        default : next_state = off;

    endcase
        
    end
endmodule