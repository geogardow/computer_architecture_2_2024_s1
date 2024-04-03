module top (input clkFPGA, rst, output logic finish);

logic [18:0] R28_stall_count, R29_aritmetric_count, R30_memory_count, R31_cicles_per_inst;

datapath cpu(clkFPGA, rst, finish, R28_stall_count, R29_aritmetric_count, R30_memory_count, R31_cicles_per_inst);


flags flagsStalls (
		R28_stall_count,  //  probes.probe
		R28_stall_count_probes  // sources.source
	);
	
flags flagsAritmetric (
		R29_aritmetric_count,  //  probes.probe
		R29_aritmetric_count_probes  // sources.source
	);
flags flagsMemory (
		R30_memory_count,  //  probes.probe
		R30_memory_count_probes  // sources.source
	);
flags flagsCycle (
		R31_cicles_per_inst,  //  probes.probe
		R31_cicles_per_inst_probes  // sources.source
	);
	
endmodule