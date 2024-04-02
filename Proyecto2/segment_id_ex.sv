module segment_id_ex (
    input logic clk, rst,
	input logic [31:0] pc_id,
	input logic [18:0] extend_id, RD1S_id, RD2S_id, RD3S_id,
	input logic [15:0][15:0] RD1V_id, RD2V_id, RD3V_id,
	input logic [4:0] RS3_id,
	input logic [2:0] ALUOpS_id, ALUOpV_id,
	input logic Brinco_id, Equal_id, GEQ_id, LEQ_id, MemToReg_id, MemRead_id, MemWrite_id, ALUSrc_id, 
					  RegWriteS_id, RegWriteV_id, WriteDataSrc_id, AluData_id, EnableRead_id, EnableWrite_id, FlagRDSrc_id, operand_flag_id,

	output logic [31:0] pc_ex,
	output logic [18:0] extend_ex, RD1S_ex, RD2S_ex, RD3S_ex,
	output logic [15:0][15:0] RD1V_ex, RD2V_ex, RD3V_ex,
	output logic [4:0] RS3_ex,
	output logic [2:0] ALUOpS_ex, ALUOpV_ex,
	output logic Brinco_ex, Equal_ex, GEQ_ex, LEQ_ex, MemToReg_ex, MemRead_ex, MemWrite_ex, ALUSrc_ex, 
					RegWriteS_ex, RegWriteV_ex, WriteDataSrc_ex, AluData_ex, EnableRead_ex, EnableWrite_ex, FlagRDSrc_ex, operand_flag_ex
);

	always_ff @(negedge clk or posedge rst) begin
    if (rst) begin
        pc_ex <= 0;
        extend_ex <= 0;
        RD1S_ex <= 0;
        RD2S_ex <= 0;
        RD3S_ex <= 0;
        RD1V_ex <= 0;
        RD2V_ex <= 0;
        RD3V_ex <= 0;
        RS3_ex <= 0;
        ALUOpS_ex <= 0;
        ALUOpV_ex <= 0;
        Brinco_ex <= 0;
        Equal_ex <= 0;
        GEQ_ex <= 0;
        LEQ_ex <= 0;
        MemToReg_ex <= 0;
        MemRead_ex <= 0;
        MemWrite_ex <= 0;
        ALUSrc_ex <= 0;
        RegWriteS_ex <= 0;
        RegWriteV_ex <= 0;
        WriteDataSrc_ex <= 0;
        AluData_ex <= 0;
        EnableRead_ex <= 0;
        EnableWrite_ex <= 0;
        FlagRDSrc_ex <= 0;
        operand_flag_ex <= 0;
    end
    else begin
        pc_ex <= pc_id;
        extend_ex <= extend_id;
        RD1S_ex <= RD1S_id;
        RD2S_ex <= RD2S_id;
        RD3S_ex <= RD3S_id;
        RD1V_ex <= RD1V_id;
        RD2V_ex <= RD2V_id;
        RD3V_ex <= RD3V_id;
        RS3_ex <= RS3_id;
        ALUOpS_ex <= ALUOpS_id;
        ALUOpV_ex <= ALUOpV_id;
        Brinco_ex <= Brinco_id;
        Equal_ex <= Equal_id;
        GEQ_ex <= GEQ_id;
        LEQ_ex <= LEQ_id;
        MemToReg_ex <= MemToReg_id;
        MemRead_ex <= MemRead_id;
        MemWrite_ex <= MemWrite_id;
        ALUSrc_ex <= ALUSrc_id;
        RegWriteS_ex <= RegWriteS_id;
        RegWriteV_ex <= RegWriteV_id;
        WriteDataSrc_ex <= WriteDataSrc_id;
        AluData_ex <= AluData_id;
        EnableRead_ex <= EnableRead_id;
        EnableWrite_ex <= EnableWrite_id;
        FlagRDSrc_ex <= FlagRDSrc_id;
        operand_flag_ex <= operand_flag_id;
    end
end

endmodule