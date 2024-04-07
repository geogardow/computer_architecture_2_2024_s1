`timescale 1ns/1ns // Set the simulation timescale

module alu_vec_tb;

    // Parameter
    localparam element = 16;

    // Inputs
    logic [element-1:0][element-1:0] vectorA;
    logic [element-1:0][element-1:0] vectorB;
    logic [15:0] scalar;
    logic [2:0] sel;
    logic operand_flag;

    // Outputs
    logic [element-1:0][element-1:0] result;

    // Instantiate the ALU vector module
    alu_vec #(.element(element)) alu_inst(
        .vectorA(vectorA),
        .vectorB(vectorB),
        .scalar(scalar),
        .sel(sel),
        .operand_flag(operand_flag),
        .result(result)
    );


    initial begin
        // suma
        vectorA = 'hABCD_BA98_7654_3210_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        vectorB = 'h1122_3344_5566_7788_9900_AABB_CCDD_EEFF_0000_0000_0000_0000_0000_0000_0000_0000;
        scalar = 16'd100;
        sel = 3'b000; 
        operand_flag = 1'b0; // vector B
        #10;
        assert(result == 'hBCEF_EDDC_CBBA_A998_9900_AABB_CCDD_EEFF_0000_0000_0000_0000_0000_0000_0000_0000) else $fatal("Test failed for addition");

    end

endmodule
