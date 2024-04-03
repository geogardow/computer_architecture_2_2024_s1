module decode (input logic [255:0] A,
													input logic sel,
													output logic [18:0] C);

	always_comb
		case(sel)
		
			1'b0: C = A[255:237];
			
			1'b1: C = { {3{1'b0}}, A[255:240]};

		endcase
	
endmodule