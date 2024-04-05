module mem_output_manager(
								input logic clk,
								input logic rst,
								input logic enable_read,
								input logic [4:0] RD_in,
								input logic [15:0] input_data,
								output [4:0] RD_out,
								output logic [15:0][15:0] output_data);
								
								
	logic [4:0] count;
	logic [4:0] temp_RD_out;
	logic [15:0] temp_input_data;
	logic [15:0][15:0] temp_output_data;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			count <= 5'd16; // Initialize count on reset
			temp_output_data <= '{16{16'h0000}}; // Reset output on reset
		end
		else if (enable_read) begin
			if (count == 5'd16) begin
				temp_output_data[count-1] <= input_data;
				count <= count - 5'b1; // Decrease count
			end
			else if (count == 5'd0) begin
				count <= 5'd16;
			end
			else begin
				 temp_output_data[count-1] <= input_data;
				 count <= count - 5'b1; // Decrease count
			end
		end
		else if (count == 5'd16) begin 
			temp_RD_out <= RD_in;
			temp_output_data[5'd15] <= input_data;
		end
	end
	
	assign RD_out = temp_RD_out;
	assign output_data = temp_output_data;

endmodule