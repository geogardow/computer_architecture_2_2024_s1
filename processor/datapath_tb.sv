`timescale 1 ps / 1 ps
module datapath_tb();

logic clkFPGA, rst, finish;
logic [18:0] R28_stall_count, R29_aritmetric_count, R30_memory_count, R31_cicles_per_inst;

datapath dut(clkFPGA, rst, finish, R28_stall_count, R29_aritmetric_count, R30_memory_count, R31_cicles_per_inst);
	

	 always begin
		#1 clkFPGA = ~clkFPGA;
	 end
	 
	
initial begin
	// Inicialización de variables
	rst = 1'b0;
	finish = 1'b0;
	R28_stall_count = 1'b0;
	R29_aritmetric_count = 1'b0;
	R30_memory_count = 1'b0;
	R31_cicles_per_inst = 1'b0;
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