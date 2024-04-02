module adder #(parameter element = 16) (input [element -1 :0] A,
					input [element -1 :0] B,
					output [element-1:0] C
	);
	
	
	assign C = A + B;
	
endmodule