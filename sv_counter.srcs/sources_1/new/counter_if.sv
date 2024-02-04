`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 09:05:36 AM
// Design Name: 
// Module Name: counter_if
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// `timescale 1ns / 1ps
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`ifndef COUNTER_INTERFACE__SV
`define COUNTER_INTERFACE__SV
interface counter_if;

  logic clk, reset;
  logic enable;
  logic direction;  //up and down

  logic [3:0] q ; //output 
 endinterface
 `endif
