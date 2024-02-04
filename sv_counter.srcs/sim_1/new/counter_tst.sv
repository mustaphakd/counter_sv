`timescale 1ns/1ns
`include <uvm_macros.svh>
import uvm_pkg::*;

class counter_env extends uvm_env;
`uvm_component_utils(counter_env)

function new (
    string name = "counter_env", 
    uvm_component parent = null);
    super.new(name, parent);
endfunction
endclass

class counter_test extends uvm_test;
 `uvm_component_utils(counter_test)

 //counter_env m_env;

 function new ( string name, uvm_component parent);
    super.new(name, parent);
 endfunction



  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
  endfunction : start_of_simulation_phase
  
   task pre_main_phase(uvm_phase phase);
      phase.raise_objection(this);
      #100;
      phase.drop_objection(this);
   endtask : pre_main_phase

  task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      phase.drop_objection(this);
   endtask : main_phase
   
   task shutdown_phase(uvm_phase phase);
      phase.raise_objection(this);
      #100;
      phase.drop_objection(this);
   endtask : shutdown_phase


//function void build_phase(uvm_phase phase);
// m_env = counter_env::type_id::create("m_env", this);
//endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  #360;
  phase.drop_objection(this);
  $stop();
endtask
endclass