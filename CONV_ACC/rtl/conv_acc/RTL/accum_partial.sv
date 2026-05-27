module accum_partial(
    input logic [15:0] mult1,
    input logic [15:0] mult2,
    input logic [15:0] mult3,
    input logic [15:0] mult4,
    input logic [15:0] mult5,
    output logic [18:0] accum_result
);
assign accum_result = mult1 + mult2 + mult3 + mult4 + mult5;


endmodule