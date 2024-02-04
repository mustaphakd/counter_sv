//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 09:35:58 AM
// Design Name: 
// Module Name: counter_dv
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

import uvm_pkg::*;
`include <uvm_macros.svh>
//include "counter_if.sv";

class counter_dv extends uvm_driver;
 `uvm_component_utils(counter_dv)

 virtual counter_if counter_vi; // registration for factory automation

 function new (string name, uvm_component parent);
  super.new(name, parent);
 endfunction


 function void build_phase(uvm_phase phase);
          super.build_phase(phase);
  if(! uvm_config_db #(virtual counter_if)::get(this, "", "counter_if", counter_vi))
    `uvm_error("", "evm_config_db::get failed")

 endfunction

task run_phase(uvm_phase phase);
 forever  begin @(posedge counter_vi.clk);
  counter_vi.reset <= 1;
  counter_vi.enable <= 1;
  counter_vi.direction <= $urandom;
  #10  
  counter_vi.enable <= 0;
  #15  
  counter_vi.reset <= 0;
  counter_vi.enable <= 1;
  #105  
  counter_vi.enable <= 0;
  #15  
  counter_vi.reset <= 1;
 end
endtask

endclass