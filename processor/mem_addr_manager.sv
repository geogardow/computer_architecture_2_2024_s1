module mem_addr_manager(
							input logic clk, 
							input logic rst,
							input logic read_enable, 
							input logic write_enable, 
							input logic [18:0] input_address, 
							output logic [18:0] output_address);
	
	logic [18:0] temp_addr_vec;
	logic [18:0] temp_addr_sca;
	logic [4:0] count_read;
	logic [4:0] count_write;
	
	
	always_ff @(negedge clk or posedge rst) begin	

		if (rst) begin
			count_read <= 5'd0; // Initialize count on reset
			count_write <= 5'd0; // Initialize count on reset
			temp_addr_vec <= 19'h0000; // Reset to initial value
			temp_addr_sca <= 19'h0000; // Reset to initial value
		end 
		
		else if (write_enable) begin 
		
			if (count_write == 5'd16) begin	
				count_write <= 5'd0;
			end

			else if (count_write == 5'd0) begin 
				count_write <= count_write + 5'b1; // Decrease count
				temp_addr_vec <= input_address;
			end
			
			else begin
				count_write <= count_write + 5'b1; // Decrease count
				temp_addr_vec <= temp_addr_vec + 1'b1; // Increment address				
			end
			
		end

		else if (read_enable) begin 
		
			if (count_read == 5'd16) begin
				count_read <= 5'd0;
			end

			else if (count_read == 5'd0) begin
				count_read <= count_read + 5'b1; // Decrease count
				temp_addr_vec <= temp_addr_vec + 1'b1; // Increment address		
			end
			
			else begin
				count_read <= count_read + 5'b1; // Decrease count
				temp_addr_vec <= temp_addr_vec + 1'b1; // Increment address				
			end
			
		end
		
		else begin
			temp_addr_vec <= input_address;
		end
	
	end

	assign output_address = (read_enable || write_enable) ? temp_addr_vec : input_address;

endmodule