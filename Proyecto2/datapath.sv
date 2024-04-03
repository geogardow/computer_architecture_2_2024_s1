module datapath (
                input clkFPGA, rst,
                output [18:0] R28_stall_count, R29_aritmetric_count, R30_memory_count, R31_cicles_per_inst);


    /////////////////////////////////////////////////////////////////

    // IF
  logic [31:0] pc_in_if, pc_out_if, pc_plus1_if, pc_plus_imm_extended_ex, instruction_if;

    // ID
	logic [31:0] pc_id;
	logic [27:0] instr_27_0_id;
  logic [18:0] extend_id, RD1S_id, RD2S_id, RD3S_id;
  logic [18:0] stall_count_id, aritmetric_count_id, memory_count_id, instruction_count_id;
  logic [15:0][15:0] RD1V_id, RD2V_id, RD3V_id;
	logic [4:0] instr_opcode_id, instr_21_17_id, instr_19_15_id, instr_20_16_id, instr_27_23_id, instr_22_18_id, instr_14_10_id, 
              instr_26_22_id, instr_24_20_id, instr_25_21_id, RS1_id, RS2_id, RS3_id;
	logic [2:0] ALUOpS_id, ALUOpV_id;
	logic [1:0] instr_type_id, InmSrc_id, RegDest_id, RegSrc1_id;
	logic Brinco_id, Equal_id, GEQ_id, LEQ_id, MemToReg_id, MemRead_id, MemWrite_id, ALUSrc_id, 
            RegWriteS_id, RegWriteV_id, WriteDataSrc_id, AluData_id, EnableRead_id, EnableWrite_id,
            FlagRDSrc_id, RegSrc2_id, operand_flag_id;

    // EX
  logic [31:0] pc_ex, pc_plus_imm_ex;
  logic [18:0] extend_ex, RD1S_ex, RD2S_ex, RD3S_ex, ALUOperand2S_ex, ALUOperand2V_ex, ALUResultS_ex;
  logic [15:0][15:0] RD1V_ex, RD2V_ex, RD3V_ex, ALUResultV_ex;
  logic [4:0] RS3_ex;
  logic [2:0] ALUOpS_ex, ALUOpV_ex;
  logic Brinco_ex, Equal_ex, GEQ_ex, LEQ_ex, MemToReg_ex, MemRead_ex, MemWrite_ex, ALUSrc_ex, 
              RegWriteS_ex, RegWriteV_ex, WriteDataSrc_ex, AluData_ex, EnableRead_ex, EnableWrite_ex,
              FlagRDSrc_ex, flagZ_ex, flagN_ex, PCSource_out_ex, operand_flag_ex;

    // MEM
  logic [255:0] alu_scalar_extend_mem, alu_data_result_mem;
  logic [18:0] ALUResultS_mem, RD3S_mem, address_alu_mem, address_mem;
  logic [15:0] memory_output_mem, vector_element_to_write_mem, WD_mem;
  logic [15:0][15:0] ALUResultV_mem, RD3V_mem, data_vec_mem;
  logic [4:0] RS3_mem, RS3_saved_mem;
  logic MemToReg_mem, MemRead_mem, MemWrite_mem,
        RegWriteS_mem, RegWriteV_mem, WriteDataSrc_mem, AluData_mem, EnableRead_mem,
        EnableWrite_mem, FlagRDSrc_mem;

  // WB
  logic [255:0] WD_wb;
  logic [18:0] WD_scalar_wb;
  logic [4:0] RD_result_wb;
  logic RegWriteS_wb, RegWriteV_wb;
	logic MemToReg_wb, FlagRDSrc_wb;
	logic [4:0] RD3_wb, RD3_saved_wb;
	logic [15:0][15:0] data_vec_wb, alu_data_result_wb;
			

    /////////////////////////////////////////////////////////////////

    // CLKS
	new_clk #(.frec(8)) frec_mem (clk_mem, clkFPGA);
	new_clk #(.frec(113)) frec_clk (clk, clkFPGA);

    // IF
	 extend_pc extend_pc_inst (
	 .pc_in(pc_plus_imm_ex),
	 .pc_out(pc_plus_imm_extended_ex)
	 );
	 
    mux_2to1 #(.N(32)) mux_inst (
    .A(pc_plus1_if),
    .B(pc_plus_imm_extended_ex),
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

	rom rom_inst(
    .address(pc_out_if[7:0]), 
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

    // ID

    control_unit control_unit_inst (
    .instruction_type(instr_type_id),
    .opcode(instr_opcode_id),
    .rst(rst),
    .Brinco(Brinco_id),
    .Equal(Equal_id),
    .GreaterEqual(GEQ_id),
    .LessEqual(LEQ_id),
    .MemToReg(MemToReg_id),
    .MemRead(MemRead_id),
    .MemWrite(MemWrite_id),
    .FlagRDSrc(FlagRDSrc_id),
    .AluData(AluData_id),
    .EnableRead(EnableRead_id),
    .EnableWrite(EnableWrite_id),
    .WriteDataSrc(WriteDataSrc_id),
    .operand_flag(operand_flag_id),
    .ALUOpS(ALUOpS_id),
    .ALUOpV(ALUOpV_id),
    .ALUSrc(ALUSrc_id),
    .RegWriteV(RegWriteV_id),
    .RegWriteS(RegWriteS_id),
    .ImmSrc(InmSrc_id),
    .RegSrc1(RegSrc1_id),
    .RegDest(RegDest_id),
    .RegSrc2(RegSrc2_id),
    .stall_count(stall_count_id),
    .aritmetric_count(aritmetric_count_id),
    .memory_count(memory_count_id),
    .instruction_count(instruction_count_id)
  );

  mux_4to1 #(.N(5)) mux_RS1_id (
    .A(instr_21_17_id),
    .B(instr_19_15_id),
    .C(instr_20_16_id),
    .D(instr_27_23_id),
    .sel(RegSrc1_id),
    .E(RS1_id)
  );

  mux_2to1 #(.N(5)) mux_RS2_id (
    .A(instr_22_18_id),
    .B(instr_14_10_id),
    .sel(RegSrc2_id),
    .C(RS2_id)
  );

  mux_4to1 #(.N(5)) mux_RS3_id (
    .A(instr_26_22_id),
    .B(instr_24_20_id),
    .C(instr_25_21_id),
    .D(5'b0),
    .sel(RegDest_id),
    .E(RS3_id)
  );

  extend extend_id_inst (
    .Instr(instr_27_0_id),
    .InmSrc(InmSrc_id),
    .ExtImm(extend_id)
  );

  scalar_rf #(.WIDTH(19)) scalar_rf_id (
    .RS1(RS1_id),
    .RS2(RS2_id),
    .RS3(RS3_id),
    .RD(RD_result_wb),
    .WD(WD_scalar_wb), 
    .stall_count(stall_count_id),
    .aritmetric_count(aritmetric_count_id),
    .memory_count(memory_count_id),
    .instruction_count(instruction_count_id),
    .WES(RegWriteS_wb),
    .clk(clk),
    .rst(rst),
    .RD1(RD1S_id),
    .RD2(RD2S_id),
    .RD3(RD3S_id),
    .R28_stall_count(R28_stall_count),
    .R29_aritmetric_count(R29_aritmetric_count),
    .R30_memory_count(R30_memory_count),
    .R31_cicles_per_inst(R31_cicles_per_inst)
  );

  vectorial_rf #(.WIDTH(16)) vectorial_rf_id (
    .RS1(RS1_id),
    .RS2(RS2_id),
    .RS3(RS3_id),
    .RD(RD_result_wb),
    .WD(WD_wb),
    .WEV(RegWriteV_wb),
    .clk(clk),
    .rst(rst),
    .RD1(RD1V_id),
    .RD2(RD2V_id),
    .RD3(RD3V_id)
  );

  // ID/EX Segmentation
segment_id_ex id_ex_inst (
    .clk(clk),
    .rst(rst),
    .pc_id(pc_id),
    .extend_id(extend_id),
    .RD1S_id(RD1S_id),
    .RD2S_id(RD2S_id),
    .RD3S_id(RD3S_id),
    .RD1V_id(RD1V_id),
    .RD2V_id(RD2V_id),
    .RD3V_id(RD3V_id),
    .RS3_id(RS3_id),
    .ALUOpS_id(ALUOpS_id),
    .ALUOpV_id(ALUOpV_id),
    .Brinco_id(Brinco_id),
    .Equal_id(Equal_id),
    .GEQ_id(GEQ_id),
    .LEQ_id(LEQ_id),
    .MemToReg_id(MemToReg_id),
    .MemRead_id(MemRead_id),
    .MemWrite_id(MemWrite_id),
    .ALUSrc_id(ALUSrc_id),
    .RegWriteS_id(RegWriteS_id),
    .RegWriteV_id(RegWriteV_id),
    .WriteDataSrc_id(WriteDataSrc_id),
    .AluData_id(AluData_id),
    .EnableRead_id(EnableRead_id),
    .EnableWrite_id(EnableWrite_id),
    .FlagRDSrc_id(FlagRDSrc_id),
    .operand_flag_id(operand_flag_id),

    .pc_ex(pc_ex),
    .extend_ex(extend_ex),
    .RD1S_ex(RD1S_ex),
    .RD2S_ex(RD2S_ex),
    .RD3S_ex(RD3S_ex),
    .RD1V_ex(RD1V_ex),
    .RD2V_ex(RD2V_ex),
    .RD3V_ex(RD3V_ex),
    .RS3_ex(RS3_ex),
    .ALUOpS_ex(ALUOpS_ex),
    .ALUOpV_ex(ALUOpV_ex),
    .Brinco_ex(Brinco_ex),
    .Equal_ex(Equal_ex),
    .GEQ_ex(GEQ_ex),
    .LEQ_ex(LEQ_ex),
    .MemToReg_ex(MemToReg_ex),
    .MemRead_ex(MemRead_ex),
    .MemWrite_ex(MemWrite_ex),
    .ALUSrc_ex(ALUSrc_ex),
    .RegWriteS_ex(RegWriteS_ex),
    .RegWriteV_ex(RegWriteV_ex),
    .WriteDataSrc_ex(WriteDataSrc_ex),
    .AluData_ex(AluData_ex),
    .EnableRead_ex(EnableRead_ex),
    .EnableWrite_ex(EnableWrite_ex),
    .FlagRDSrc_ex(FlagRDSrc_ex),
    .operand_flag_ex(operand_flag_ex)
);

// EX
  mux_2to1 #(.N(19)) mux_2to1_ex (RD2S_ex, extend_ex, ALUSrc_ex, ALUOperand2S_ex);
  mux_2to1 #(.N(19)) mux_2to1_ex_vec (RD2S_ex, extend_ex, ALUSrc_ex, ALUOperand2V_ex);

	adder #(.element(19)) adder_ex (pc_ex, extend_ex, pc_plus_imm_ex);

	alu_scalar #(.WIDTH(19)) alu_ex (RD1S_ex, ALUOperand2S_ex, ALUOpS_ex, ALUResultS_ex, flagZ_ex, flagN_ex);
  
  alu_vec #(.element(16)) alu_instance (
	.vectorA(RD1V_ex),
	.vectorB(RD2V_ex),
	.scalar(ALUOperand2V_ex[15:0]),
	.sel(ALUOpV_ex),
	.operand_flag(operand_flag_ex),
	.result(ALUResultV_ex)
    );

	jump_unit jump_unit_ex (flagZ_ex, flagN_ex, Brinco_ex, Equal_ex, GEQ_ex, LEQ_ex, PCSource_out_ex);

    // EX/MEM Segmentation
  segment_ex_mem ex_mem_inst (
      .clk(clk),
      .rst(rst),
      .MemToReg_ex(MemToReg_ex),
      .MemRead_ex(MemRead_ex),
      .MemWrite_ex(MemWrite_ex),
      .RegWriteS_ex(RegWriteS_ex),
      .RegWriteV_ex(RegWriteV_ex),
      .WriteDataSrc_ex(WriteDataSrc_ex),
      .AluData_ex(AluData_ex),
      .EnableRead_ex(EnableRead_ex),
      .EnableWrite_ex(EnableWrite_ex),
      .FlagRDSrc_ex(FlagRDSrc_ex),
      .ALUResultS_ex(ALUResultS_ex),
      .RD3S_ex(RD3S_ex),
      .ALUResultV_ex(ALUResultV_ex),
      .RD3V_ex(RD3V_ex),
      .RS3_ex(RS3_ex),
      .MemToReg_mem(MemToReg_mem),
      .MemRead_mem(MemRead_mem),
      .MemWrite_mem(MemWrite_mem),
      .RegWriteS_mem(RegWriteS_mem),
      .RegWriteV_mem(RegWriteV_mem),
      .WriteDataSrc_mem(WriteDataSrc_mem),
      .AluData_mem(AluData_mem),
      .EnableRead_mem(EnableRead_mem),
      .EnableWrite_mem(EnableWrite_mem),
      .FlagRDSrc_mem(FlagRDSrc_mem),
      .ALUResultS_mem(ALUResultS_mem),
      .RD3S_mem(RD3S_mem),
      .ALUResultV_mem(ALUResultV_mem),
      .RD3V_mem(RD3V_mem),
      .RS3_mem(RS3_mem)
    );

    // MEM
    mem_addr_manager mem_addr_manager_inst (
      .clk(clk),
      .rst(rst),
      .read_enable(EnableRead_mem),
      .write_enable(EnableWrite_mem),
      .input_address(ALUResultS_mem),
      .output_address(address_alu_mem)
    );

    compare #(.WIDTH(19)) compare_wb_inst (
      .a(address_alu_mem),
      .b(address_mem)
    );

    mem_input_manager mem_input_manager_inst (
        .clk(clk),
        .rst(rst),
        .enable_write(EnableWrite_mem),
        .input_data(RD3V_mem),
        .output_data(vector_element_to_write_mem)
    );

    mux_2to1 #(.N(16)) mux_WD_mem (
        .A(RD3S_mem[16:0]),
        .B(vector_element_to_write_mem),
        .sel(WriteDataSrc_mem),
        .C(WD_mem)
    );

    ram mem(.address(address_mem), 
    .clock(clk_mem), 
    .data(WD_mem), 
    .wren(MemWrite_mem), 
    .q(memory_output_mem));

    extend_vector_size extend_vector_size_inst (
    .input_data(address_alu_mem),
    .output_data(alu_scalar_extend_mem)
    );

    mux_2to1 #(.N(256)) mux_data_mem (
    .A(alu_scalar_extend_mem),
    .B(ALUResultV_mem),
    .sel(AluData_mem),
    .C(alu_data_result_mem)
    );
    
    mem_output_manager instance_name (
    .clk(clk),
    .rst(rst),
    .enable_read(EnableRead_mem),
    .RD_in(RS3_mem),
    .input_data(memory_output_mem),
    .RD_out(RS3_saved_mem),
    .output_data(data_vec_mem)
  );

  // mem/wb Segmentation
  segment_mem_wb segment_mem_wb_inst (
    .clk(clk),
    .rst(rst),
    .MemToReg_mem(MemToReg_mem),
    .RegWriteS_mem(RegWriteS_mem),
    .RegWriteV_mem(RegWriteV_mem),
    .FlagRDSrc_mem(FlagRDSrc_mem),
    .RD3_mem(RS3_mem),
    .RD3_saved_mem(RS3_saved_mem),
    .data_vec_mem(data_vec_mem),
    .alu_data_result_mem(alu_data_result_mem),
    .MemToReg_wb(MemToReg_wb),
    .RegWriteS_wb(RegWriteS_wb),
    .RegWriteV_wb(RegWriteV_wb),
    .FlagRDSrc_wb(FlagRDSrc_wb),
    .RD3_wb(RD3_wb),
    .RD3_saved_wb(RD3_saved_wb),
    .data_vec_wb(data_vec_wb),
    .alu_data_result_wb(alu_data_result_wb)
  );

  // wb

  mux_2to1 #(.N(256)) mux_WD_wb (
    .A(alu_data_result_wb),
    .B(data_vec_wb),
    .sel(MemToReg_wb),
    .C(WD_wb)
    );


  decode  decode_scalar_WD_wb (
    .A(WD_wb),
    .sel(MemToReg_wb),
    .C(WD_scalar_wb)
    );


  mux_2to1 #(.N(5)) mux_RD_wb (
  .A(RD3_wb),
  .B(RD3_saved_wb),
  .sel(FlagRDSrc_wb),
  .C(RD_result_wb)
  );


endmodule