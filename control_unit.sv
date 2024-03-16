 module control_unit (input logic [1:0] instruction_type, 
								input logic [4:0] func,
								input logic rst,
								output logic Brinco, Equal, GreaterEqual, LessEqual, MemToReg, MemRead, MemWrite, 
								output logic [2:0] ALUOpS,
								output logic ALUSrc, RegWrite,
								output logic [1:0] ImmSrc, 
								output logic RegSrc2,RegSrc1);
			
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
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteV = 0;
				RegWriteS = 0; 
				MemToReg = 0;

				ALUSrc = 0;
				ALUOpS = 0;
				ALUOpV = 0;

				ImmSrc = 0;
				RegSrc2 = 0;
				RegSrc1 = 0;
			end
		
		// Instrucciones de Datos sin inmediato:
		if (instruction_type == 2'b01 && func[4] == 1'b0)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteS = 1; 
				RegWriteV = 0;
				MemToReg = 0;

				ALUSrc = 0;
				ALUOpV = 1'bx;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 0;
				RegSrc2 = 0;
				
				// suma
				if (func[4:0] == 5'b00000)
					begin
						ALUOpS = 3'b000;
					end
				// resta
				else if (func[4:0] == 5'b00001)
					begin
						ALUOpS = 3'b001;
					end
				// mult
				else if (func[4:0] == 5'b00010)
					begin
						ALUOpS = 3'b010;
					end
				// div
				else if (func[4:0] == 5'b00011)
					begin
						ALUOpS = 3'b011;
					end
				// union
				else if (func[4:0] == 5'b01011)
					begin
						ALUOpS = 3'b111;
					end
			end
		
		// Instrucciones de Datos con inmediato:
		if (instruction_type == 2'b01 && func[4] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 0;
				MemRead = 0;
				MemWrite = 0;
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteS = 1; 
				RegWriteV = 0;
				MemToReg = 0;

				ALUSrc = 1;
				ALUOpV = 1'bx;
                
				ImmSrc = 2'b10;
				RegSrc1 = 0;
				RegSrc2 = 1'bx;
				
				// sumita
				if (func[4:1] == 4'b1000)
					begin
						ALUOpS = 3'b000;
					end
				// restita
				if (func[4:1] == 4'b1001)
					begin
						ALUOpS = 3'b001;
					end
				// multi
				if (func[4:1] == 4'b1010)
					begin
						ALUOpS = 3'b010;
					end
				// divi
				if (func[4:1] == 4'b1011)
					begin
						ALUOpS = 3'b011;
					end
				// cad
				if (func[4:1] == 4'b1100)
					begin
						ALUOpS = 3'b100;
					end
				// cld
				if (func[4:1] == 4'b1101)
					begin
						ALUOpS = 3'b101;
					end
				// cli
				if (func[4:1] == 4'b1110)
					begin
						ALUOpS = 3'b110;
					end
				// unioncita
				if (func[4:1] == 4'b1111)
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
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteV = 0;
				RegWriteS = 0; 
				MemToReg = 0;

				ALUSrc = 0;
				ALUOpS = 3'b001;
				ALUOpV = 3'bxxx;

				ImmSrc = 2'b00;
				RegSrc2 = 1;
				RegSrc1 = 1;
				
				// brinco instruction
				if (func[4:3] == 2'b00)
					begin
						Brinco = 1;
						Equal = 0;
						LessEqual = 0;
						GreaterEqual = 0;
					end
				// leq instruction
				if (func[4:3] == 2'b01)
					begin
						Brinco = 0;
						Equal = 0;
						LessEqual = 1;
						GreaterEqual = 0;
					end
				// igual instruction	
				if (func[4:3] == 2'b10)
					begin
						Brinco = 0;
						Equal = 1;
						LessEqual = 0;
						GreaterEqual = 0;
					end
				// geq instruction
				if (func[4:3] == 2'b11)
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
                
				ImmSrc = 2'b10;
				RegSrc1 = 0;
				RegSrc2 = 1'bx;
				
				// cargar instruction	
				if (func[4:3] == 2'b00)
					begin
						MemRead = 1;
						MemWrite = 0;
                        WriteVec = 0;
                        WriteDataSrc = 0;

						RegWriteS = 1;
						RegWriteV = 0;
						MemToReg = 1'b1;

                        ALUOpS = 3'b000;
                        ALUOpV = 3'bxxx;
					end
				
				// guardar instruction
				if (func[4:3] == 2'b01)
					begin
						MemRead = 0;
						MemWrite = 1;
                        WriteVec = 0;
                        WriteDataSrc = 0;

						RegWriteS = 0;
						RegWriteV = 0;
						MemToReg = 1'bx;

                        ALUOpS = 3'b000;
                        ALUOpV = 3'bxxx;
					end
				// cargar vector instruction	
				if (func[4:3] == 2'b10)
					begin
						MemRead = 1;
						MemWrite = 0;
                        WriteVec = 0;
                        WriteDataSrc = 0;

						RegWriteS = 0;
						RegWriteV = 1;
						MemToReg = 1'b1;

                        ALUOpS = 3'bxxx;
                        ALUOpV = 3'b000;
					end
                // guardar vector instruction
				if (func[4:3] == 2'b11)
					begin
						MemRead = 0;
						MemWrite = 1;
                        WriteVec = 1;
                        WriteDataSrc = 1;

						RegWriteS = 0;
						RegWriteV = 0;
						MemToReg = 1'bx;

                        ALUOpS = 3'bxxx;
                        ALUOpV = 3'b000;
					end
					
			end
	    // Instrucciones de Vectores:
		if (instruction_type == 2'b11 && func[4] == 1'b0 && func[3] == 1'b0)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;

				ALUSrc = 1'bx;
				ALUOpS = 3'bxxx;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 0;
				RegSrc2 = 0;
				
				// sumita
				if (func[2:0] == 3'b000)
					begin
						ALUOpV = 3'b000;
					end
				// multi
				if (func[2:0] == 3'b001)
					begin
						ALUOpV = 3'b010;
					end      
			end

        // Instrucciones de Vectores con registros escalares:
		if (instruction_type == 2'b11 && func[4] == 1'b0 && func[3] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;

				ALUSrc = 1'b0;
				ALUOpS = 3'bxxx;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 0;
				RegSrc2 = 0;
				
				// sumita
				if (func[2:0] == 3'b010)
					begin
						ALUOpV = 3'b000;
					end
				// multi
				if (func[2:0] == 3'b011)
					begin
						ALUOpV = 3'b010;
					end      
			end

        // Instrucciones de Vectores con inmediato:
		if (instruction_type == 2'b11 && func[4] == 1'b1)
			begin
				Brinco = 0;
				Equal = 0;
				GreaterEqual = 0;
				LessEqual = 0;

				AluData = 1;
				MemRead = 0;
				MemWrite = 0;
                WriteVec = 0;
				WriteDataSrc = 0;

				RegWriteS = 0; 
				RegWriteV = 1;
				MemToReg = 0;

				ALUSrc = 1'b1;
				ALUOpS = 3'bxxx;
                
				ImmSrc = 2'bxx;
				RegSrc1 = 0;
				RegSrc2 = 1'bx;
				
				// cad
				if (func[4:1] == 4'b1000)
					begin
						ALUOpS = 3'b011;
					end
				// cld
				if (func[4:1] == 4'b1001)
					begin
						ALUOpS = 3'b100;
					end
				// cli
				if (func[4:1] == 4'b1010)
					begin
						ALUOpS = 3'b101;
					end
				// union
				if (func[4:1] == 4'b1100)
					begin
						ALUOpS = 3'b110;
					end    
			end
	end
endmodule