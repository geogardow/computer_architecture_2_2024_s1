module mem_addr_mananger(
							input logic clk, 
							input logic rst,
							input logic read_enable, 
							input logic write_enable, 
							input logic [15:0] input_address, 
							output logic [15:0] output_address);
	
	logic [15:0] temp_addr;						
	
	
	always_ff @(negedge clk or posedge rst) begin
        if (rst) begin
            temp_addr <= 16'h0000; // Reset to initial value
        end 
		  else if (read_enable || write_enable) begin
            temp_addr <= temp_addr + 1'b1; // Increment address
        end
		  else begin
		  
			temp_addr <= input_address;
		  
		  end
    end
	
	assign output_address = temp_addr;

endmodule