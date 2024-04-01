 module control_unit (input logic [1:0] instruction_type, 
								input logic [4:0] opcode,
								input logic rst,
								output logic Brinco, Equal, GreaterEqual, LessEqual, MemToReg, MemRead, MemWrite, 
								output logic FlagRDSrc, AluData, EnableRead, EnableWrite, WriteDataSrc, operand_flag, 
								output logic [2:0] ALUOpS,ALUOpV,
								output logic ALUSrc, RegWriteV, RegWriteS,
								output logic [1:0] ImmSrc, RegSrc1, RegDest,
								output logic RegSrc2);
			
	always_latch
	begin
		if(rst)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
				EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteV = 0;
				RegWriteS = 0; 
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 0;
				ALUOpS = 0;
				ALUOpV = 0;
				operand_flag = 0;

				ImmSrc = 0;
				RegSrc2 = 0;
				RegSrc1 = 0;
				RegDest = 0;
			end
		
		// Instrucciones de Datos sin inmediato:
		if (instruction_type == 2'b01 && opcode[4] == 1'b0)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
                EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteS = 1; 
				RegWriteV = 0;
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 0;
				ALUOpV = 1'bx;
				operand_flag = 0;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 2'b01;
				RegSrc2 = 1;
				RegDest = 2'b01;
				
				// suma
				if (opcode[4:0] == 5'b00000)
					begin
						ALUOpS = 3'b000;
					end
				// resta
				else if (opcode[4:0] == 5'b00001)
					begin
						ALUOpS = 3'b001;
					end
				// mult
				else if (opcode[4:0] == 5'b00010)
					begin
						ALUOpS = 3'b010;
					end
				// div
				else if (opcode[4:0] == 5'b00011)
					begin
						ALUOpS = 3'b011;
					end
				// union
				else if (opcode[4:0] == 5'b00100)
					begin
						ALUOpS = 3'b111;
					end
				// Stall estandar
				else if (opcode[4:0] == 5'b00101)
					begin
						Brinco = 0;
						Equal = 0;
						GreaterEqual = 0;
						LessEqual = 0;

						AluData = 0;
						MemRead = 0;
						MemWrite = 0;
						EnableRead = 0;
						EnableWrite = 0;
						WriteDataSrc = 0;

						RegWriteV = 0;
						RegWriteS = 0; 
						MemToReg = 0;
						FlagRDSrc = 0;

						ALUSrc = 0;
						ALUOpS = 0;
						ALUOpV = 0;
						operand_flag = 0;

					end
				// Stall read
				else if (opcode[4:0] == 5'b00110)
					begin
						Brinco = 0;
						Equal = 0;
						GreaterEqual = 0;
						LessEqual = 0;

						AluData = 0;
						MemRead = 1;
						MemWrite = 0;
						EnableRead = 1;
						EnableWrite = 0;
						WriteDataSrc = 0;

						RegWriteV = 1;
						RegWriteS = 0; 
						MemToReg = 1;
						FlagRDSrc = 1;

						ALUSrc = 0;
						ALUOpS = 0;
						ALUOpV = 0;
						operand_flag = 0;

					end
				// Stall write
				else if (opcode[4:0] == 5'b00111)
					begin
						Brinco = 0;
						Equal = 0;
						GreaterEqual = 0;
						LessEqual = 0;

						AluData = 0;
						MemRead = 0;
						MemWrite = 1;
						EnableRead = 0;
						EnableWrite = 1;
						WriteDataSrc = 1;

						RegWriteV = 0;
						RegWriteS = 0; 
						MemToReg = 0;
						FlagRDSrc = 0;

						ALUSrc = 0;
						ALUOpS = 0;
						ALUOpV = 0;
						operand_flag = 0;

					end
			end
		
		// Instrucciones de Datos con inmediato:
		if (instruction_type == 2'b01 && opcode[4] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
                EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteS = 1; 
				RegWriteV = 0;
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 1;
				ALUOpV = 1'bx;
				operand_flag = 0;
                
				ImmSrc = 2'b11;
				RegSrc1 = 2'b10;
				RegDest = 2'b10;
				RegSrc2 = 1'bx;
				
				// sumita
				if (opcode[4:1] == 4'b1000)
					begin
						ALUOpS = 3'b000;
					end
				// restita
				if (opcode[4:1] == 4'b1001)
					begin
						ALUOpS = 3'b001;
					end
				// multi
				if (opcode[4:1] == 4'b1010)
					begin
						ALUOpS = 3'b010;
					end
				// divi
				if (opcode[4:1] == 4'b1011)
					begin
						ALUOpS = 3'b011;
					end
				// cad
				if (opcode[4:1] == 4'b1100)
					begin
						ALUOpS = 3'b100;
					end
				// cld
				if (opcode[4:1] == 4'b1101)
					begin
						ALUOpS = 3'b101;
					end
				// cli
				if (opcode[4:1] == 4'b1110)
					begin
						ALUOpS = 3'b110;
					end
				// unioncita
				if (opcode[4:1] == 4'b1111)
					begin
						ALUOpS = 3'b111;
					end        
			end
			
		// Instrucciones de Control:
		if (instruction_type == 2'b10)
			begin
				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
                EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteV = 0;
				RegWriteS = 0; 
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 0;
				ALUOpS = 3'b001;
				ALUOpV = 3'bxxx;
				operand_flag = 0;

				ImmSrc = 2'b10;
				RegSrc2 = 0;
				RegSrc1 = 2'b11;
				RegDest = 2'bxx;

				
				// brinco instruction
				if (opcode[4:3] == 2'b00)
					begin
						Brinco = 1;
						Equal = 0;
						LessEqual = 0;
						GreaterEqual = 0;
					end
				// leq instruction
				if (opcode[4:3] == 2'b01)
					begin
						Brinco = 0;
						Equal = 0;
						LessEqual = 1;
						GreaterEqual = 0;
					end
				// igual instruction	
				if (opcode[4:3] == 2'b10)
					begin
						Brinco = 0;
						Equal = 1;
						LessEqual = 0;
						GreaterEqual = 0;
					end
				// geq instruction
				if (opcode[4:3] == 2'b11)
					begin
						Brinco = 0;
						Equal = 0;
						LessEqual = 0;
						GreaterEqual = 1;
					end
					
			end
			
		// Instrucciones de Memoria:
		if (instruction_type == 2'b00)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1'bx;

				ALUSrc = 1;
				operand_flag = 0;
                
				ImmSrc = 2'b11;
				RegSrc1 = 2'b00;
				RegDest = 2'b00;
				RegSrc2 = 1'bx;
				
				// cargar instruction	
				if (opcode[4:3] == 2'b00)
					begin
						MemRead = 1;
						MemWrite = 0;
                        EnableWrite = 0;
                		EnableRead = 0;

                        WriteDataSrc = 0;

						RegWriteS = 1;
						RegWriteV = 0;
						MemToReg = 1'b1;
						FlagRDSrc = 0;


                        ALUOpS = 3'b000;
                        ALUOpV = 3'bxxx;
					end
				
				// guardar instruction
				if (opcode[4:3] == 2'b01)
					begin
						MemRead = 0;
						MemWrite = 1;
                		EnableRead = 0;
                        EnableWrite = 0;
                        WriteDataSrc = 0;

						RegWriteS = 0;
						RegWriteV = 0;
						MemToReg = 1'bx;
						FlagRDSrc = 0;


                        ALUOpS = 3'b000;
                        ALUOpV = 3'bxxx;
					end
				// cargar vector instruction	
				if (opcode[4:3] == 2'b10)
					begin
						MemRead = 1;
						MemWrite = 0;
                        EnableWrite = 0;
                		EnableRead = 1;

                        WriteDataSrc = 0;

						RegWriteS = 0;
						RegWriteV = 1;
						MemToReg = 1'b1;
						FlagRDSrc = 1;

                        ALUOpS = 3'b000;
                        ALUOpV = 3'b000;
					end
                // guardar vector instruction
				if (opcode[4:3] == 2'b11)
					begin
						MemRead = 0;
						MemWrite = 0;
                		EnableRead = 0;
                        EnableWrite = 1;
                        WriteDataSrc = 1;

						RegWriteS = 0;
						RegWriteV = 0;
						MemToReg = 1'bx;
						FlagRDSrc = 0;

                        ALUOpS = 3'b000;
                        ALUOpV = 3'b000;
					end
					
			end
	    // Instrucciones de Vectores:
		if (instruction_type == 2'b11 && opcode[4] == 1'b0 && opcode[3] == 1'b0)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
                EnableWrite = 0;
				EnableRead = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 1'bx;
				ALUOpS = 3'bxxx;
				operand_flag = 0;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 2'b01;
				RegSrc2 = 1;
				RegDest = 2'b01;

				// sumita
				if (opcode[2:0] == 3'b000)
					begin
						ALUOpV = 3'b000;
					end
				// multi
				if (opcode[2:0] == 3'b001)
					begin
						ALUOpV = 3'b010;
					end      
			end

        // Instrucciones de Vectores con registros escalares:
		if (instruction_type == 2'b11 && opcode[4] == 1'b0 && opcode[3] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
				EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 1'b0;
				ALUOpS = 3'bxxx;
				operand_flag = 1;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 2'b01;
				RegSrc2 = 1;
				RegDest = 2'b01;
				
				// sumita
				if (opcode[2:0] == 3'b010)
					begin
						ALUOpV = 3'b000;
					end
				// multi
				if (opcode[2:0] == 3'b011)
					begin
						ALUOpV = 3'b010;
					end      
			end

        // Instrucciones de Vectores con inmediato:
		if (instruction_type == 2'b11 && opcode[4] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
				EnableRead = 0;
                EnableWrite = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;
				FlagRDSrc = 0;

				ALUSrc = 1'b1;
				ALUOpS = 3'bxxx;
				operand_flag = 1;
                
				ImmSrc = 2'b11;
				RegSrc1 = 2'b10;
				RegSrc2 = 1'bx;
				RegDest = 2'b10;
				
				// cad
				if (opcode[4:1] == 4'b1000)
					begin
						ALUOpV = 3'b011;
					end
				// cld
				if (opcode[4:1] == 4'b1001)
					begin
						ALUOpV = 3'b100;
					end
				// cli
				if (opcode[4:1] == 4'b1010)
					begin
						ALUOpV = 3'b101;
					end
				// union
				if (opcode[4:1] == 4'b1100)
					begin
						ALUOpV = 3'b110;
					end    
			end
	end
endmodule