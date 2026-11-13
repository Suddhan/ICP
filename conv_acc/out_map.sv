module out_map(
    input logic [7:0] in_data,
    input logic valid,
    input logic clk,
    input logic rst,
	input logic apb_enable,
    output logic [7:0] out_data,
    output logic finish_input,
    output logic finish_output
);
logic [7:0] addr, next_addr;
logic write_enable, read_enable;

always_ff @(posedge clk) begin
    if(rst) begin
        addr <= 0;
        next_addr <= 0;
        write_enable <= 0;
        read_enable <= 0;
        finish_output <= 0;
        finish_input <= 0;
    end else begin
        if(finish_input) begin //read out logic
			read_enable <= 1;
			write_enable <= 0;
			if(apb_enable) begin
				if(addr > 143) begin
					finish_output <= 1;
					read_enable <= 0;

				end else begin
            		if(~finish_output) begin
						if(next_addr == 1) begin
							addr <= addr;
							next_addr <= 2;
						end else addr <= addr + 1;;
				end	else addr <= addr;
            	end
			end else addr <= addr;


        end else  begin //write in logic
            read_enable <= 0;
            if(addr > 8'd143 && ~finish_input) begin
                finish_input <= 1;
                write_enable <= 0;
                addr <= 0;
				next_addr <= 1;
            end else begin
            if(valid) begin
                write_enable <= 1;
                next_addr <= addr + 1;
        
            end else begin
                write_enable <= 0;
                addr <= next_addr;
            end
            end


        end
    end
end


ofm_sram ofm_ram (
    .data_in(in_data),
    .addr(addr),
    .we(write_enable),
    .re(read_enable),
    .clk(clk),
    .rst(rst),
    .data_out(out_data)
);

endmodule
