module special_register_manager(
							input logic clk, 
							input logic rst,
							input logic [1:0] instruction_type, 
							input logic [4:0] opcode,
							input logic finish,
							output logic [18:0] stall_count, aritmetric_count, memory_count, instruction_count);

	
	logic [18:0] stall_count_temp, aritmetric_count_temp, memory_count_temp, instruction_count_temp;
	logic [1:0] instruction_type_temp;
	logic [4:0] opcode_temp;
	
	always_ff @(negedge clk or posedge rst) begin	
		 if (rst) begin
            stall_count_temp <= 0;
            aritmetric_count_temp <=  0; 
            memory_count_temp <= 0; 
            instruction_count_temp <= 0;
            instruction_type_temp <= 0;
            opcode_temp <= 0;
		 end else if (!finish) begin
            instruction_type_temp <= instruction_type;
            opcode_temp <= opcode;
		
		
		// Instrucciones de Datos sin inmediato:
		if (instruction_type_temp == 2'b01 && opcode_temp[4] == 1'b0)
			begin
				instruction_count_temp <=instruction_count_temp + 1;
				
				// suma
				if (opcode_temp[4:0] == 5'b00000)
					begin
						aritmetric_count_temp <= aritmetric_count_temp + 1;
					end
				// resta
				else if (opcode_temp[4:0] == 5'b00001)
					begin
						aritmetric_count_temp <= aritmetric_count_temp + 1;
					end
				// mult
				else if (opcode_temp[4:0] == 5'b00010)
					begin
						aritmetric_count_temp <= aritmetric_count_temp + 1;
					end
				// div
				else if (opcode_temp[4:0] == 5'b00011)
					begin
						aritmetric_count_temp <= aritmetric_count_temp + 1;
					end
				// union
				else if (opcode_temp[4:0] == 5'b00100)
					begin
						aritmetric_count_temp <= aritmetric_count_temp + 1;
					end
				// Stall estandar
				else if (opcode_temp[4:0] == 5'b00101)
					begin
						stall_count_temp <= stall_count_temp + 1;
					end
				// Stall read
				else if (opcode_temp[4:0] == 5'b00110)
					begin
						stall_count_temp <= stall_count_temp + 1;
					end
				// Stall write
				else if (opcode_temp[4:0] == 5'b00111)
					begin
						stall_count_temp <= stall_count_temp + 1;
					end
			end
			// Instrucciones de Datos con inmediato:
		if (instruction_type_temp == 2'b01 && opcode_temp[4] == 1'b1) begin
				instruction_count_temp <= instruction_count_temp + 1;
				aritmetric_count_temp <= aritmetric_count_temp + 1;
		end
			
			// Instrucciones de Memoria:
		if (instruction_type_temp == 2'b00)
			begin
				instruction_count_temp <= instruction_count_temp + 1;
				memory_count_temp <= memory_count_temp + 1;
			end

		// Instrucciones de Vectores:
		if (instruction_type_temp == 2'b11 && opcode_temp[4] == 1'b0 && opcode_temp[3] == 1'b0)
			begin
				instruction_count_temp <= instruction_count_temp + 1;
				aritmetric_count_temp <= aritmetric_count_temp + 1;
			end
		// Instrucciones de Vectores con registros escalares:
		if (instruction_type_temp == 2'b11 && opcode_temp[4] == 1'b0 && opcode_temp[3] == 1'b1)
			begin
				instruction_count_temp <= instruction_count_temp + 1;
				aritmetric_count_temp <= aritmetric_count_temp + 1;
			end
			
		// Instrucciones de Vectores con inmediato:
		if (instruction_type_temp == 2'b11 && opcode_temp[4] == 1'b1)
			begin
				instruction_count_temp <= instruction_count_temp + 1;
				aritmetric_count_temp <= aritmetric_count_temp + 1;
			end
		end
	end
			
		

	assign instruction_count = instruction_count_temp;
	assign stall_count = stall_count_temp;
	assign aritmetric_count = aritmetric_count_temp;
	assign memory_count = memory_count_temp;

endmodule