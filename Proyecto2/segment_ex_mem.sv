module segment_ex_mem (input logic clk, rst,
						input logic MemToReg_ex, MemRead_ex, MemWrite_ex,
						RegWriteS_ex, RegWriteV_ex, WriteDataSrc_ex, AluData_ex, EnableRead_ex,
						EnableWrite_ex, FlagRDSrc_ex,
						input logic [18:0] ALUResultS_ex, RD3S_ex,
						input logic [15:0][15:0] ALUResultV_ex, RD3V_ex,
						input logic [4:0] RS3_ex,

						output logic MemToReg_mem, MemRead_mem, MemWrite_mem,
						RegWriteS_mem, RegWriteV_mem, WriteDataSrc_mem, AluData_mem, EnableRead_mem,
						EnableWrite_mem, FlagRDSrc_mem,
						output logic [18:0] ALUResultS_mem, RD3S_mem,
						output logic [15:0][15:0] ALUResultV_mem, RD3V_mem,
						output logic [4:0] RS3_mem);
			
	always_ff @(negedge clk or posedge rst) begin
		if (rst) begin
			MemToReg_mem <= 0;
			MemRead_mem <= 0;
			MemWrite_mem <= 0;
			RegWriteS_mem <= 0;
			RegWriteV_mem <= 0;
			WriteDataSrc_mem <= 0;
			AluData_mem <= 0;
			EnableRead_mem <= 0;
			EnableWrite_mem <= 0;
			FlagRDSrc_mem <= 0;
			ALUResultS_mem <= 0;
			RD3S_mem <= 0;
			ALUResultV_mem <= {(16){16'd0}};
			RD3V_mem <= {(16){16'd0}};
			RS3_mem <= 0;
		end else begin
			MemToReg_mem <= MemToReg_ex;
			MemRead_mem <= MemRead_ex;
			MemWrite_mem <= MemWrite_ex;
			RegWriteS_mem <= RegWriteS_ex;
			RegWriteV_mem <= RegWriteV_ex;
			WriteDataSrc_mem <= WriteDataSrc_ex;
			AluData_mem <= AluData_ex;
			EnableRead_mem <= EnableRead_ex;
			EnableWrite_mem <= EnableWrite_ex;
			FlagRDSrc_mem <= FlagRDSrc_ex;
			ALUResultS_mem <= ALUResultS_ex;
			RD3S_mem <= RD3S_ex;
			ALUResultV_mem <= ALUResultV_ex;
			RD3V_mem <= RD3V_ex;
			RS3_mem <= RS3_ex;
		end
	end
		
endmodule