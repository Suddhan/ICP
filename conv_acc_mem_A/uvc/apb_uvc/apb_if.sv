//------------------------------------------------------------------------------
// apb interface
//
// This APB interface is to be used for communication between DUT and TB top
// It includes the following signals:
// - clk: the clock signal for the interface (PCLK).
// - rst_n: the active-low reset signal for the interface (PRESETn).
// - psel: the peripheral select signal.
// - penable: the enable signal for the second (ACCESS) cycle of a transfer.
// - pwrite: 1 = write transfer, 0 = read transfer.
// - paddr: 12-bit byte address within the 4 kB APB slot.
// - pwdata: 32-bit write data.
// - prdata: 32-bit read data.
// - pready: 0 = wait-state inserted by the DUT.
// - pslverr: error response from the DUT.
//
//------------------------------------------------------------------------------
interface apb_if (input logic clk, input logic rst_n);
    // Peripheral select signal.
    logic psel;
    // Enable signal.
    logic penable;
    // Write signal.
    logic pwrite;
    // Address signal.
    logic [11:0] paddr;
    // Write data signal.
    logic [31:0] pwdata;
    // Read data signal.
    logic [31:0] prdata;
    // Ready signal.
    logic pready;
    // Slave error signal.
    logic pslverr;
endinterface : apb_if
