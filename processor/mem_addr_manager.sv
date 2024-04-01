module mem_addr_manager(
							input logic clk, 
							input logic rst,
							input logic read_enable, 
							input logic write_enable, 
							input logic [18:0] input_address, 
							output logic [18:0] output_address);
	
	logic [18:0] temp_addr;
	logic [4:0] count;
	
	
	always_ff @(posedge clk or posedge rst) begin	

		if (rst) begin
			count <= 5'd0; // Initialize count on reset
			temp_addr <= 19'h0000; // Reset to initial value
		end 
		
		else if (write_enable) begin 
		
			if (count == 5'd17) begin
				count <= 5'd0;
			end

			else if (count == 5'd0) begin
				count <= count + 5'b1; // Decrease count
				temp_addr <= input_address -1 ;
			end
			
			else begin
				count <= count + 5'b1; // Decrease count
				temp_addr <= temp_addr + 1'b1; // Increment address				
			end
			
		end

		else if (read_enable) begin 
		
			if (count == 5'd17) begin
				count <= 5'd0;
			end

			else if (count == 5'd0) begin
				count <= count + 5'b1; // Decrease count
				temp_addr <= input_address;
			end
			
			else begin
				count <= count + 5'b1; // Decrease count
				temp_addr <= temp_addr + 1'b1; // Increment address				
			end
			
		end
		
		else begin

			temp_addr <= input_address;

		end
		
	end
	
	assign output_address = temp_addr;

endmodule