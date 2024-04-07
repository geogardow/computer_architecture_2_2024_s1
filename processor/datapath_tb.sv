`timescale 1 ps / 1 ps
module datapath_tb();

logic clkFPGA, rst, finish, stepping_flag, next_instr;
logic [31:0] R28_stall_count, R29_aritmetric_count, R30_memory_count, cycles ,instr_count;

datapath dut(clkFPGA, rst, stepping_flag, next_instr, finish, R28_stall_count, R29_aritmetric_count, R30_memory_count, cycles, instr_count);
	

	 always begin
		#1 clkFPGA = ~clkFPGA;
	 end
	 
	
initial begin
	// Inicialización de variables
	rst = 1'b0;
	finish = 1'b0;
	stepping_flag = 1'b0;
	next_instr = 1'b0;
	R28_stall_count = 1'b0;
	R29_aritmetric_count = 1'b0;
	R30_memory_count = 1'b0;
	instr_count = 1'b0;
	cycles = 1'b0;
	clkFPGA = 1'b1;
	#1;
	rst = 1'b1;
	#1;
	rst = 1'b0;
	#200
	stepping_flag = 1'b1;
	#250
	next_instr = 1'b1;
	#250
	next_instr = 1'b0;
	#250
	next_instr = 1'b1;
	#250
	next_instr = 1'b0;
	#250
	stepping_flag = 1'b0;



end

endmodule 