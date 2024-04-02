`timescale 1ns/1ns // Set the simulation timescale

module alu_scalar_tb;

    // Inputs
    logic [15:0] A;
    logic [15:0] B;
    logic [2:0] sel;

    // Outputs
    logic [15:0] C;
    logic flagZ;
    logic flagN;

    // Instantiate the ALU
    alu alu_inst(
        .A(A),
        .B(B),
        .sel(sel),
        .C(C),
        .flagZ(flagZ),
        .flagN(flagN)
    );

     // Test vectors
    initial begin
        // Test vector 1: Addition
        A = 8;
        B = 5;
        sel = 3'b000;
        #10;

        // Test vector 2: Subtraction
        A = 10;
        B = 3;
        sel = 3'b001;
        #10;

        // Test vector 3: Multiplication
        A = 5;
        B = 6;
        sel = 3'b010;
        #10;

        // Test vector 4: Division
        A = 20;
        B = 4;
        sel = 3'b011;
        #10;

        // Test vector 5: Arithmetic right shift
        A = 32;
        B = 2;
        sel = 3'b100;
        #10;

        // Test vector 6: Logical right shift
        A = 32;
        B = 2;
        sel = 3'b101;
        #10;

        // Test vector 7: Logical left shift
        A = 4;
        B = 2;
        sel = 3'b110;
        #10;

        // Test vector 8: Bitwise AND
        A = 15;
        B = 10;
        sel = 3'b111;
        #10;

    end

endmodule
