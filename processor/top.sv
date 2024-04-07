module top (input clkFPGA, rst, stepping_flag, next_instr, output logic finish);

logic [31:0] R28_stall_count, R29_aritmetric_count, R30_memory_count, cycles,instr_count;

datapath cpu(clkFPGA, rst, stepping_flag, next_instr, finish, R28_stall_count, R29_aritmetric_count, R30_memory_count, cycles, instr_count);


counters flagsStalls (
		R28_stall_count,  //  probes.probe
		R28_stall_count_probes  // sources.source
	);
	
counters flagsAritmetric (
		R29_aritmetric_count,  //  probes.probe
		R29_aritmetric_count_probes  // sources.source
	);
counters flagsMemory (
		R30_memory_count,  //  probes.probe
		R30_memory_count_probes  // sources.source
	);
counters flagsCycle (
		cycles,  //  probes.probe
		R31_cicles_per_inst_probes  // sources.source
	);
counters flagsInstr (
		instr_count,  //  probes.probe
		R31_cicles_per_inst_probes  // sources.source
	);
	
endmodule