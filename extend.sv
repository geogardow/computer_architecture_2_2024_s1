module extend(
				input logic [27:0] Instr,
				input logic [1:0] ImmSrc,
				output logic [18:0] ExtImm);

	always_comb
		case(ImmSrc)
		
			// 28-bit unsigned immediate
			2'b00: ExtImm = Instr[18:0];
			
			// 18-bit unsigned immediate
			2'b01: ExtImm = Instr[18:0];
			
			// 17-bit unsigned immediate
			2'b10: ExtImm = { {1{0}}, Instr[16:0]};
			
			// 16-bit unsigned immediate
			2'b11: ExtImm = { {2{0}}, Instr[15:0]};
			
			
			default: ExtImm = 19'b0;
		endcase
	
endmodule