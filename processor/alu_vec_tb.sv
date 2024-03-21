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

        // resta
        //vectorA = 'h123456789abcdef0123456789abcdef123456789abcdef0123456789abcdef;
        //vectorB = 'h1000100010001000100010001000100010001000100010001000100010001000;
        //scalar = 16'd100;
        //sel = 3'b001;
        //operand_flag = 1'b1; // scalar
        //#10;
        //assert(result == 'h123456789abcdef0123456789abcdef123456789abcdef01234567899acdf11579) else $fatal("Test failed for subtraction");

        // multiplicacion
        //vectorA = 'h123456789abcdef0123456789abcdef123456789abcdef0123456789abcdef;
        //vectorB = 'h1000100010001000100010001000100010001000100010001000100010001000;
        //scalar = 16'd100;
        //sel = 3'b010;
        //operand_flag = 1'b0; // vector B
        //#10;
        //assert(result == 'h123456789abcdef0123456789abcdef123456789abcdef0123456789acdf13579) else $fatal("Test failed for multiplication");

        // corrimiento a logico a la izquierda
        //vectorA = 'h8000000000000000000000000000000000000000000000000000000000000000;
        //vectorB = 'h1111111111111111111111111111111111111111111111111111111111111111;
        //scalar = 16'd3; 
        //sel = 3'b101; // Logical left shift
        //operand_flag = 1'b1; // scalar
        //#10;
        //assert(result == 'h0000000000000000000000000000000000000000000000000000000000008000) else $fatal("Test failed for scalar logical left shift");

        // union
        //vectorA = 'h1000000000000000000000000000000000000000000000000000000000000001;
        //vectorB = 'h0000000000000000000000000000000000000000000000000000000000000001;
        //scalar = 16'd1; 
        //sel = 3'b110; 
        //operand_flag = 1'b1; // scalar
        //#10;
        //assert(result == 'h1000000000000000000000000000000000000000000000000000000000000001) else $fatal("Test failed for union operation with scalar");   

        // corrimiento a aritmetico a la derecha
        //vectorA = 'h123456789abcdef0123456789abcdef123456789abcdef0123456789abcdef;
        //vectorB = 'h0000000000000000000000000000000000000000000000000000000000000001;
        //scalar = 16'd3;
        //sel = 3'b011; 
        //operand_flag = 1'b1; // scalar
        //#10;
        //assert(result == 'h091a2b3c4d5e6f7f123456789abcdef123456789abcdef0123456789abcde00) else $fatal("Test failed for arithmetic right shift operation with scalar");

        // corrimiento a logico a la derecha
        //vectorA = 'h123456789abcdef0123456789abcdef123456789abcdef0123456789abcdef;
        //vectorB = 'h0000000000000000000000000000000000000000000000000000000000000001;
        //scalar = 16'd3; 
        //sel = 3'b100; 
        //operand_flag = 1'b1; 
        //#10;
        //assert(result == 'h02468acf13579bde02468acf13579bde02468acf13579bde02468acf13579000) else $fatal("Test failed for logical right shift operation with scalar");
    end

endmodule
