`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 09:05:36 AM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

include "counter_if.sv";
 
module counter (counter_if cif);

always_ff @(posedge cif.clk)
if (cif.reset)
 cif.q <= 0;
else if (cif.enable)
 if (cif.direction)
  cif.q <= cif.q - 1;
 else
  cif.q <= cif.q + 1;
endmodule