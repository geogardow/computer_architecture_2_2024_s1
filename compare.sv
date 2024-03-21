module compare #(int WIDTH=16)(
   input logic signed [WIDTH-1 : 0] a,
	output logic signed [WIDTH-1 : 0] b
);

	assign b = (a > 0) & (a < 257605) ? a : 0;

endmodule
