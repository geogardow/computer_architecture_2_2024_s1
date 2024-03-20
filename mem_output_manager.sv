module mem_output_manager(
								input logic clk,
								input logic rst,
								input logic enable_read,
								input logic [4:0] RD_in,
								input logic [15:0] input_data,
								output [4:0] RD_out,
								output logic [15:0][15:0] output_data);
								
								
	logic [3:0] count;
	logic [4:0] temp_RD_out;
	logic [15:0] temp_input_data;
	logic [15:0][15:0] temp_output_data;

	always_ff @(negedge clk or posedge rst) begin
		if (rst) begin
			count <= 4'd15; // Initialize count on reset
			temp_output_data <= '{16{16'h0000}}; // Reset output on reset
		end
		else if (enable_read) begin
			if (count == 4'd15) begin
				 temp_RD_out <= RD_in; // Store RD on first cycle
				 temp_input_data <= input_data; // Store input_data on first cycle
				 temp_output_data[count] <= input_data;
				 count <= count - 4'b1; // Decrease count
			end
			else begin
				 temp_output_data[count] <= input_data;
				 count <= count - 4'b1; // Decrease count
			end
		end
		else begin
				temp_output_data[4'd16] <= input_data;
		end
	end
	
	assign RD_out = temp_RD_out;
	assign output_data = temp_output_data;

endmodule