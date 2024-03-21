module scalar_rf #(int WIDTH=16) (
	input [4:0] RS1, 
	input [4:0] RS2, 
	input [4:0] RS3,
	input [4:0] RD,
	input [WIDTH-1:0] WD,
	input WES,
	input clk,
	input rst,

	output [WIDTH-1:0] RD1,
	output [WIDTH-1:0] RD2,
	output [WIDTH-1:0] RD3);

	logic [WIDTH-1:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31;
	
	logic [WIDTH-1:0] RD1_temp, RD2_temp, RD3_temp;
	
	always @(*) begin
    case (RS1)
        5'd0: RD1_temp = R0;    // Register 0
        5'd1: RD1_temp = R1;    // Register 1
        5'd2: RD1_temp = R2;    // Register 2
        5'd3: RD1_temp = R3;    // Register 3
        5'd4: RD1_temp = R4;    // Register 4
        5'd5: RD1_temp = R5;    // Register 5
        5'd6: RD1_temp = R6;    // Register 6
        5'd7: RD1_temp = R7;    // Register 7
        5'd8: RD1_temp = R8;    // Register 8
        5'd9: RD1_temp = R9;    // Register 9
        5'd10: RD1_temp = R10;  // Register 10
        5'd11: RD1_temp = R11;  // Register 11
        5'd12: RD1_temp = R12;  // Register 12
        5'd13: RD1_temp = R13;  // Register 13
        5'd14: RD1_temp = R14;  // Register 14
        5'd15: RD1_temp = R15;  // Register 15
        5'd16: RD1_temp = R16;  // Register 16
        5'd17: RD1_temp = R17;  // Register 17
        5'd18: RD1_temp = R18;  // Register 18
        5'd19: RD1_temp = R19;  // Register 19
        5'd20: RD1_temp = R20;  // Register 20
        5'd21: RD1_temp = R21;  // Register 21
        5'd22: RD1_temp = R22;  // Register 22
        5'd23: RD1_temp = R23;  // Register 23
        5'd24: RD1_temp = R24;  // Register 24
        5'd25: RD1_temp = R25;  // Register 25
        5'd26: RD1_temp = R26;  // Register 26
        5'd27: RD1_temp = R27;  // Register 27
        5'd28: RD1_temp = R28;  // Register 28
        5'd29: RD1_temp = R29;  // Register 29
        5'd30: RD1_temp = R30;  // Register 30
        5'd31: RD1_temp = R31;  // Register 31
        default: RD1_temp = 0;
    endcase

    case (RS2)
        5'd0: RD2_temp = R0;    // Register 0
        5'd1: RD2_temp = R1;    // Register 1
        5'd2: RD2_temp = R2;    // Register 2
        5'd3: RD2_temp = R3;    // Register 3
        5'd4: RD2_temp = R4;    // Register 4
        5'd5: RD2_temp = R5;    // Register 5
        5'd6: RD2_temp = R6;    // Register 6
        5'd7: RD2_temp = R7;    // Register 7
        5'd8: RD2_temp = R8;    // Register 8
        5'd9: RD2_temp = R9;    // Register 9
        5'd10: RD2_temp = R10;  // Register 10
        5'd11: RD2_temp = R11;  // Register 11
        5'd12: RD2_temp = R12;  // Register 12
        5'd13: RD2_temp = R13;  // Register 13
        5'd14: RD2_temp = R14;  // Register 14
        5'd15: RD2_temp = R15;  // Register 15
        5'd16: RD2_temp = R16;  // Register 16
        5'd17: RD2_temp = R17;  // Register 17
        5'd18: RD2_temp = R18;  // Register 18
        5'd19: RD2_temp = R19;  // Register 19
        5'd20: RD2_temp = R20;  // Register 20
        5'd21: RD2_temp = R21;  // Register 21
        5'd22: RD2_temp = R22;  // Register 22
        5'd23: RD2_temp = R23;  // Register 23
        5'd24: RD2_temp = R24;  // Register 24
        5'd25: RD2_temp = R25;  // Register 25
        5'd26: RD2_temp = R26;  // Register 26
        5'd27: RD2_temp = R27;  // Register 27
        5'd28: RD2_temp = R28;  // Register 28
        5'd29: RD2_temp = R29;  // Register 29
        5'd30: RD2_temp = R30;  // Register 30
        5'd31: RD2_temp = R31;  // Register 31
        default: RD2_temp = 0;
    endcase

    case (RS3)
        5'd0: RD3_temp = R0;    // Register 0
        5'd1: RD3_temp = R1;    // Register 1
        5'd2: RD3_temp = R2;    // Register 2
        5'd3: RD3_temp = R3;    // Register 3
        5'd4: RD3_temp = R4;    // Register 4
        5'd5: RD3_temp = R5;    // Register 5
        5'd6: RD3_temp = R6;    // Register 6
        5'd7: RD3_temp = R7;    // Register 7
        5'd8: RD3_temp = R8;    // Register 8
        5'd9: RD3_temp = R9;    // Register 9
        5'd10: RD3_temp = R10;  // Register 10
        5'd11: RD3_temp = R11;  // Register 11
        5'd12: RD3_temp = R12;  // Register 12
        5'd13: RD3_temp = R13;  // Register 13
        5'd14: RD3_temp = R14;  // Register 14
        5'd15: RD3_temp = R15;  // Register 15
        5'd16: RD3_temp = R16;  // Register 16
        5'd17: RD3_temp = R17;  // Register 17
        5'd18: RD3_temp = R18;  // Register 18
        5'd19: RD3_temp = R19;  // Register 19
        5'd20: RD3_temp = R20;  // Register 20
        5'd21: RD3_temp = R21;  // Register 21
        5'd22: RD3_temp = R22;  // Register 22
        5'd23: RD3_temp = R23;  // Register 23
        5'd24: RD3_temp = R24;  // Register 24
        5'd25: RD3_temp = R25;  // Register 25
        5'd26: RD3_temp = R26;  // Register 26
        5'd27: RD3_temp = R27;  // Register 27
        5'd28: RD3_temp = R28;  // Register 28
        5'd29: RD3_temp = R29;  // Register 29
        5'd30: RD3_temp = R30;  // Register 30
        5'd31: RD3_temp = R31;  // Register 31
        default: RD3_temp = 0;
    endcase
	end
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst) begin
			R0  = {(WIDTH){1'b0}};
			R1  = {(WIDTH){1'b0}};
			R2  = {(WIDTH){1'b0}};
			R3  = {(WIDTH){1'b0}};
			R4  = {(WIDTH){1'b0}};
			R5  = {(WIDTH){1'b0}};
			R6  = {(WIDTH){1'b0}};
			R7  = {(WIDTH){1'b0}};
			R8  = {(WIDTH){1'b0}};
			R9  = {(WIDTH){1'b0}};
			R10 = {(WIDTH){1'b0}};
			R11 = {(WIDTH){1'b0}};
			R12 = {(WIDTH){1'b0}};
			R13 = {(WIDTH){1'b0}};
			R14 = {(WIDTH){1'b0}};
			R15 = {(WIDTH){1'b0}};
			R16 = {(WIDTH){1'b0}};
			R17 = {(WIDTH){1'b0}};
			R18 = {(WIDTH){1'b0}};
			R19 = {(WIDTH){1'b0}};
			R20 = {(WIDTH){1'b0}};
			R21 = {(WIDTH){1'b0}};
			R22 = {(WIDTH){1'b0}};
			R23 = {(WIDTH){1'b0}};
			R24 = {(WIDTH){1'b0}};
			R25 = {(WIDTH){1'b0}};
			R26 = {(WIDTH){1'b0}};
			R27 = {(WIDTH){1'b0}};
			R28 = {(WIDTH){1'b0}};
			R29 = {(WIDTH){1'b0}};
			R30 = {(WIDTH){1'b0}};
			R31 = {(WIDTH){1'b0}};
			end
		else if (WES) begin
			case (RD)
				5'd0: R0  = WD;
				5'd1: R1  = WD;
				5'd2: R2  = WD;
				5'd3: R3  = WD;
				5'd4: R4  = WD;
				5'd5: R5  = WD;
				5'd6: R6  = WD;
				5'd7: R7  = WD;
				5'd8: R8  = WD;
				5'd9: R9  = WD;
				5'd10: R10 = WD;
				5'd11: R11 = WD;
				5'd12: R12 = WD;
				5'd13: R13 = WD;
				5'd14: R14 = WD;
				5'd15: R15 = WD;
				5'd16: R16 = WD;
				5'd17: R17 = WD;
				5'd18: R18 = WD;
				5'd19: R19 = WD;
				5'd20: R20 = WD;
				5'd21: R21 = WD;
				5'd22: R22 = WD;
				5'd23: R23 = WD;
				5'd24: R24 = WD;
				5'd25: R25 = WD;
				5'd26: R26 = WD;
				5'd27: R27 = WD;
				5'd28: R28 = WD;
				5'd29: R29 = WD;
				5'd30: R30 = WD;
				5'd31: R31 = WD;
			endcase
		end
	end
	
	// assign outputs
	assign RD1 = RD1_temp;
	assign RD2 = RD2_temp;
	assign RD3 = RD3_temp;					

endmodule