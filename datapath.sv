module datapath (
                input clkFPGA, rst, stepping_flag);


    /////////////////////////////////////////////////////////////////

    // IF
    logic [31:0] pc_in_if, pc_out_if, pc_plus1_if, instruction_if;

    // ID
	logic [31:0] pc_id;
	logic [27:0] instr_inm_id;
    logic [18:0] extend_out_id, RD1_id, RD2_id, RD3_id;
	logic [4:0] instr_opcode_id, instr_21_17_id, instr_19_15_id, instr_20_16_id, instr_27_23_id, instr_22_18_id, instr_14_10_id, 
                instr_26_22_id, instr_24_20_id, instr_25_21_id, RS1_id, RS2_id, RS3_id;
	logic [2:0] ALUOpS_id, ALUOpV_id;
	logic [1:0] instr_type_id, ImmSrc_id, RegDest_id, RegSrc1_id;
	logic   WriteVec_id, Brinco_id, Equal_id, GEQ_id, LEQ_id, MemToReg_id, MemRead_id, MemWrite_id, ALUSrc_id, 
            RegWriteS_id, RegWriteV_id, WriteDataSrc_id, AluData_id, EnableRead_id, EnableWrite_id,
            FlagRDSrc_id, RegSrc2_id;

    // EX

    // MEM

    // WB

    /////////////////////////////////////////////////////////////////

    // CLKS
	new_clk #(.frec(200)) frec_mem (clk_mem, clkFPGA);
	new_clk #(.frec(2825)) frec_clk (clk, clkFPGA);

    // IF
    mux_2to1 #(.N(32)) mux_inst (
    .A(pc_plus1_if),
    .B(pc_plus_imm_ex),
    .sel(PCSource_out_ex),
    .C(pc_in_if));

    pc pc_if (
    .clk(clk),
    .rst(~rst), 
    .load(1'b1),
    .pc_in(pc_in_if),
    .pc_out(pc_out_if));

    adder #(.element(32)) adder_if (
    .A(pc_out_if),
    .B(32'd1),
    .C(pc_plus1_if));

	rom2 rom_inst(
    .address(pc_out_if[9:0]), 
    .clock(clk), 
    .q(instruction_if));

	// IF/ID Segmentation
    segment_if_id if_id_inst (
    .clk(clk),
    .rst(rst),
    .pc_out(pc_out_if),
    .instruction(instruction_if),
    .pc(pc_id),
    .instr_type(instr_type_id),
    .instr_opcode(instr_opcode_id),
    .instr_21_17(instr_21_17_id),
    .instr_19_15(instr_19_15_id),
    .instr_20_16(instr_20_16_id),
    .instr_27_23(instr_27_23_id),
    .instr_22_18(instr_22_18_id),
    .instr_14_10(instr_14_10_id),
    .instr_26_22(instr_26_22_id),
    .instr_24_20(instr_24_20_id),
    .instr_25_21(instr_25_21_id),
    .instr_27_0(instr_27_0_id)
  );


endmodule