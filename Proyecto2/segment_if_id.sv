module segment_if_id (
					input logic clk, rst,
					input logic [31:0] pc_out, instruction,
					output logic [31:0] pc,
					output logic [1:0] instr_type,
					output logic [4:0] 	instr_opcode, instr_21_17, instr_19_15, instr_20_16,
										instr_27_23, instr_22_18, instr_14_10, instr_26_22,
										instr_24_20, instr_25_21,
					output logic [27:0] instr_27_0);
			
	always_ff @(negedge clk, posedge rst) begin
    if (rst) begin
        pc <= 32'h0;
        instr_type <= 2'b00;
        instr_opcode <= 5'b00000;
        instr_27_0 <= 28'h00000000;
        instr_21_17 <= 5'b00000;
        instr_19_15 <= 5'b00000;
        instr_20_16 <= 5'b00000;
        instr_27_23 <= 5'b00000;
        instr_22_18 <= 5'b00000;
        instr_14_10 <= 5'b00000;
        instr_26_22 <= 5'b00000;
        instr_24_20 <= 5'b00000;
        instr_25_21 <= 5'b00000;
    end else begin
        pc <= pc_out;
        instr_type <= instruction[31:30];
        instr_opcode <= instruction[29:25];
        instr_27_0 <= instruction[27:0];
        instr_21_17 <= instruction[21:17];
        instr_19_15 <= instruction[19:15];
        instr_20_16 <= instruction[20:16];
        instr_27_23 <= instruction[27:23];
        instr_22_18 <= instruction[22:18];
        instr_14_10 <= instruction[14:10];
        instr_26_22 <= instruction[26:22];
        instr_24_20 <= instruction[24:20];
        instr_25_21 <= instruction[25:21];
    end
end
		
endmodule