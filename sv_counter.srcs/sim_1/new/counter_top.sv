`timescale 1ns / 1ns
//include "counter_if.sv";
import uvm_pkg::*;
`include "uvm_macros.svh"
//`include "uvm_utils.svh"

module top();

counter_if counter_iif();
counter counter1 (.cif(counter_iif));


initial begin
 counter_iif.clk = 0;
 forever #5 counter_iif.clk = ~counter_iif.clk ;
end

initial begin
 forever  begin @(posedge counter_iif.clk);
  counter_iif.reset <= 1;
  counter_iif.enable <= 1;
  counter_iif.direction <= $urandom;
  #10  
  counter_iif.enable <= 0;
  #15  
  counter_iif.reset <= 0;
  counter_iif.enable <= 1;
  #105  
  counter_iif.enable <= 0;
  #15  
  counter_iif.reset <= 1;
 end
end

initial begin

 //uvm_config_db #(virtual counter_if)::set(null, "*", "counter_if", counter_iif);
 //uvm_top.finish_on_completion = 1;
//uvm_info("", $sformatf("counter under test received: enable=%b, direction=%b", cif.enable, cif.direction), UVM_MEDIUM);

//uvm_info("", $sformatf("counter under test received: enable=%b, direction=%b", 1, 1), UVM_MEDIUM);
 run_test("counter_test");
 end
endmodule