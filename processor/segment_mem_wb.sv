module segment_mem_wb (input logic clk, rst,
								input logic MemToReg_mem, RegWriteS_mem, RegWriteV_mem, FlagRDSrc_mem,
								input logic [4:0] RD3_mem, RD3_saved_mem,
								input logic [15:0][15:0] data_vec_mem, alu_data_result_mem,
								output logic MemToReg_wb, RegWriteS_wb, RegWriteV_wb, FlagRDSrc_wb,
								output logic [4:0] RD3_wb, RD3_saved_wb,
								output logic [15:0][15:0] data_vec_wb, alu_data_result_wb);
			
	always_ff @(negedge clk or posedge rst) begin
        if (rst) begin
            MemToReg_wb <= 0;
            RegWriteS_wb <= 0;
            RegWriteV_wb <= 0;
            FlagRDSrc_wb <= 0;
            RD3_wb <= 0;
            RD3_saved_wb <= 0;
            data_vec_wb <= {(16){16'd0}};
            alu_data_result_wb  <= {(16){16'd0}};
        end else begin
            MemToReg_wb <= MemToReg_mem;
            RegWriteS_wb <= RegWriteS_mem;
            RegWriteV_wb <= RegWriteV_mem;
            FlagRDSrc_wb <= FlagRDSrc_mem;
            RD3_wb <= RD3_mem;
            RD3_saved_wb <= RD3_saved_mem;
            data_vec_wb <= data_vec_mem;
            alu_data_result_wb <= alu_data_result_mem;
        end
    end
		
endmodule
