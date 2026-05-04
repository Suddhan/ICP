// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "config.sv"

module sp_ram_wrap
  #(
    parameter RAM_SIZE   = 32768,              // in bytes
    parameter ADDR_WIDTH = 15,			//$clog2(RAM_SIZE)
    parameter DATA_WIDTH = 32
  )(
    // Clock and Reset
    input  logic                    clk,
    input  logic                    rstn_i,
    input  logic                    en_i,
    input  logic [ADDR_WIDTH-1:0]   addr_i,
    input  logic [DATA_WIDTH-1:0]   wdata_i,
    output logic [DATA_WIDTH-1:0]   rdata_o,
    input  logic                    we_i,
    input  logic [DATA_WIDTH/8-1:0] be_i,
    input  logic                    bypass_en_i
  );

`ifdef PULP_FPGA_EMUL
  xilinx_mem_8192x32
  sp_ram_i
  (
    .clka   ( clk                    ),
    .rsta   ( 1'b0                   ), // reset is active high

    .ena    ( en_i                   ),
    .addra  ( addr_i[ADDR_WIDTH-1:2] ),
    .dina   ( wdata_i                ),
    .douta  ( rdata_o                ),
    .wea    ( be_i & {4{we_i}}       )
  );

  // TODO: we should kill synthesis when the ram size is larger than what we
  // have here

/*`elsif ASIC
   // RAM bypass logic
   logic [31:0] ram_out_int;
   // assign rdata_o = (bypass_en_i) ? wdata_i : ram_out_int;
   assign rdata_o = ram_out_int;

   sp_ram_bank
   #(
    .NUM_BANKS  ( RAM_SIZE/4096 ),
    .BANK_SIZE  ( 1024          )
   )
   sp_ram_bank_i
   (
    .clk_i   ( clk                     ),
    .rstn_i  ( rstn_i                  ),
    .en_i    ( en_i                    ),
    .addr_i  ( addr_i                  ),
    .wdata_i ( wdata_i                 ),
    .rdata_o ( ram_out_int             ),
    .we_i    ( (we_i & ~bypass_en_i)   ),
    .be_i    ( be_i                    )
   );

`else
  sp_ram
  #(
    .ADDR_WIDTH ( ADDR_WIDTH ),
    .DATA_WIDTH ( DATA_WIDTH ),
    .NUM_WORDS  ( RAM_SIZE   )
  )
  sp_ram_i
  (
    .clk     ( clk       ),

    .en_i    ( en_i      ),
    .addr_i  ( addr_i    ),
    .wdata_i ( wdata_i   ),
    .rdata_o ( rdata_o   ),
    .we_i    ( we_i      ),
    .be_i    ( be_i      )
  );
*/
`endif

//Internal Address and Selection
logic [10:0] sram_addr;
assign sram_addr = addr_i[12:2]; //11 bits for 2048 words
//assign sram_addr = (addr_i === 'x) ? 11'h0 : addr_i[12:2];

logic [1:0]  row_sel;
assign row_sel   = addr_i[14:13]; // 2 bits to select 1 of 4 rows


// We use a 2D array to match 4x4 physical matrix
logic [3:0][3:0] sram_csn; 

always_comb begin
    sram_csn = '1;
    
    // Condition: SoC must be enabled, out of reset, and address must match
    if (en_i && !(^addr_i === 1'bx)) begin  			// rstn_i && 
        case (row_sel)
            2'b00: sram_csn[0] = 4'b0000; 
            2'b01: sram_csn[1] = 4'b0000;
            2'b10: sram_csn[2] = 4'b0000;
            2'b11: sram_csn[3] = 4'b0000;
            default: sram_csn = '1;
        endcase
    end
end

logic [7:0] q_o [3:0][3:0];

//Instance Mapping (The 4x4 Matrix)
genvar i, j;
generate
    for (i=0; i<4; i=i+1) begin : rows
        for (j=0; j<4; j=j+1) begin : col
            ST_SPHS_2048x8m8_L i_sram (
            .Q        (q_o[i][j]),       // Data Out
    		.RY       (),                
    		.CK       (clk),             // Clock
    		.CSN      (sram_csn[i][j]),  // Chip Select (Active Low)
    		.TBYPASS  (1'b0),            
    		.WEN      (!(we_i && be_i[j])), // Write Enable (Active Low)	!(en_i && we_i && be_i[j])
    		.A        (sram_addr),       // Address
    		.D        (wdata_i[j*8 +: 8]) // Data In
            );
        end 
    end 
endgenerate

// 4. Output Multiplexer (The Read Path)

/*always_comb begin 
 if (en_i) begin
    case (row_sel)
        2'b00: rdata_o = {q_o[0][3], q_o[0][2], q_o[0][1], q_o[0][0]};
        2'b01: rdata_o = {q_o[1][3], q_o[1][2], q_o[1][1], q_o[1][0]};
        2'b10: rdata_o = {q_o[2][3], q_o[2][2], q_o[2][1], q_o[2][0]};
        2'b11: rdata_o = {q_o[3][3], q_o[3][2], q_o[3][1], q_o[3][0]};
        default: rdata_o = 32'h0;
    endcase 
 end else begin 
		rdata_o = 32'h0;
	end

end
always_comb begin
    if (!(^addr_i === 1'bx)) begin		//en_i && 
        case (addr_i[14:13])
            2'b00: rdata_o = {q_o[0][3], q_o[0][2], q_o[0][1], q_o[0][0]};
            2'b01: rdata_o = {q_o[1][3], q_o[1][2], q_o[1][1], q_o[1][0]};
            2'b10: rdata_o = {q_o[2][3], q_o[2][2], q_o[2][1], q_o[2][0]};
            2'b11: rdata_o = {q_o[3][3], q_o[3][2], q_o[3][1], q_o[3][0]};
            default: rdata_o = 32'h00000013; // Return a NOP (no-operation) instead of X
        endcase
    end else begin
        rdata_o = 32'h0;
    end
end*/

logic [1:0] addr_i_latched; 
always_ff @(posedge clk) begin
 addr_i_latched <= addr_i[14:13]; 
end 

always_comb begin 
// we cant check for x in hardware, so remove this if statement 
//if (!(^addr_i === 1'bx)) begin 
// case (addr_i[14:13]) 
 case (addr_i_latched) 
 2'b00: rdata_o = {q_o[0][3], q_o[0][2], q_o[0][1], q_o[0][0]}; 
 2'b01: rdata_o = {q_o[1][3], q_o[1][2], q_o[1][1], q_o[1][0]}; 
 2'b10: rdata_o = {q_o[2][3], q_o[2][2], q_o[2][1], q_o[2][0]}; 
 2'b11: rdata_o = {q_o[3][3], q_o[3][2], q_o[3][1], q_o[3][0]}; 
 // removed default case as you have already covered all possible cases 
 //default: rdata_o = 32'h00000013; // Return a NOP (no-operation) instead of X 
 endcase 
end


endmodule
