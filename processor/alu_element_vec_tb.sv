`timescale 1ns/1ns // Set the simulation timescale

module alu_element_vec_tb;

  // Parameters
  parameter ELEMENT_SIZE = 16;
  
  // Inputs
  logic [ELEMENT_SIZE-1:0] elementA;
  logic [ELEMENT_SIZE-1:0] elementB;
  logic [2:0] sel;
  
  // Outputs
  logic [ELEMENT_SIZE-1:0] result;

  // Instantiate the VectorALU module
  alu_element_vec #(ELEMENT_SIZE) uut (
    .elementA(elementA),
    .elementB(elementB),
    .sel(sel),
    .result(result)
  );
  
// Stimulus generation
  initial begin
      result = 1'b0;
    // Test case 1: Addition
        elementA = 16'd8;
        elementB = 16'd5;
        sel = 3'b000;
        #10;
        assert(result == 16'd13) else $fatal("Test failed for addition");

        // Test case 2: Subtraction
        elementA = 16'd10;
        elementB = 16'd3;
        sel = 3'b001;
        #10;
        assert(result == 16'd7) else $fatal("Test failed for subtraction");

        // Test case 3: Multiplication
        elementA = 16'd5;
        elementB = 16'd6;
        sel = 3'b010;
        #10;
        assert(result == 16'd30) else $fatal("Test failed for multiplication");

        // Test case 4: Arithmetic right shift
        elementA = 16'd32;
        elementB = 16'd2;
        sel = 3'b011;
        #10;
        assert(result == 16'd8) else $fatal("Test failed for arithmetic right shift");

        // Test case 5: Logical right shift
        elementA = 16'd32;
        elementB = 16'd2;
        sel = 3'b100;
        #10;
        assert(result == 16'd8) else $fatal("Test failed for logical right shift");

        // Test case 6: Logical left shift
        elementA = 16'd4;
        elementB = 16'd2;
        sel = 3'b101;
        #10;
        assert(result == 16'd16) else $fatal("Test failed for logical left shift");

        // Test case 7: Bitwise AND
        elementA = 16'd15;
        elementB = 16'd10;
        sel = 3'b110;
        #10;
        assert(result == 16'd10) else $fatal("Test failed for bitwise AND");

  end
  


endmodule
