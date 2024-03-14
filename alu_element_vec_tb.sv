`timescale 1ns/1ns // Set the simulation timescale

module alu_element_vec_tb;

  // Parameters
  parameter ELEMENT_SIZE = 16;
  
  // Inputs
  logic [ELEMENT_SIZE-1:0] elementA;
  logic [ELEMENT_SIZE-1:0] elementB;
  logic [2:0] opcode;
  
  // Outputs
  logic [ELEMENT_SIZE-1:0] result;
  logic [ELEMENT_SIZE-1:0] expected_result;

  // Instantiate the VectorALU module
  alu_element_vec #(ELEMENT_SIZE) uut (
    .elementA(elementA),
    .elementB(elementB),
    .opcode(opcode),
    .result(result)
  );
  
// Stimulus generation
  initial begin
    // Test case 1: Addition
    elementA = 16'd8;
    elementB = 16'd5;
	expected_result = 16'd13;
    opcode = 3'b000;
	 #10;
	assert(result == expected_result) else $fatal("Test failed");

  end
  


endmodule
