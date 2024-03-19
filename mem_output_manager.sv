module mem_output_manager(
								input logic clk,
								input logic rst,
								input logic enable_read,
								input logic [4:0] RD,
								input logic [15:0] input_logic,
								output logic [15:0][15:0]);
								
								
	logic [3:0] count;
	logic [15:0] temp_input_data;
	logic [15:0][15:0] temp_output_data;

	always_ff @(negedge clk or posedge rst) begin
		if (rst) begin
			count <= 4'd16; // Initialize count on reset
			temp_output_data <= '{16{16'h0000}}; // Reset output on reset
		end
		else if (enable_read) begin
			if (count == 4'd16) begin
				 temp_input_data <= input_data; // Store input_data on first cycle
				 temp_output_data <= temp_input_data[count];
				 count <= count - 4'b1; // Increment count
			end
		end
		else begin
				// pasar el dato en la primera posicion
		end
	end

endmodule