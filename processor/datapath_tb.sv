`timescale 1 ps / 1 ps
module datapath_tb();

logic clkFPGA, rst;

datapath dut(clkFPGA, rst);
	

	 always begin
		#1 clkFPGA = ~clkFPGA;
	 end
	 
	
initial begin
	// Inicialización de variables
	rst = 1'b0;
	clkFPGA = 1'b1;
	#1;
	rst = 1'b1;
	#1;
	rst = 1'b0;

	#200

	#200
	#1;
	rst = 1'b1;
	#1;
	rst = 1'b0;



end

endmodule 