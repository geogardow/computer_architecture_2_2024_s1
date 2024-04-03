module extend_pc(input logic [18:0] pc_in, output logic [31:0] pc_out);

	assign pc_out = { {13{1'b0}}, pc_in};

endmodule