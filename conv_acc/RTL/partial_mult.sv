module partial_mult(
input logic [7:0] data,
input logic [7:0] filter,
output logic [15:0] result
);


 always_comb begin: multiply
    result = 0;
    for (int i = 0; i < 8; i++) begin
        if (filter[i]) begin
            result += data << i; // Shift data left by i positions and add to result
        end
    end
   

    
end

endmodule