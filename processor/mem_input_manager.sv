module mem_input_manager(
    input logic clk,
    input logic rst,
    input logic enable_write,
    input logic [15:0][15:0] input_data,
    output logic [15:0] output_data
);
    
    logic [4:0] count;
    logic [15:0][15:0] temp_input_data; // 2D array to store input data
    logic [15:0] temp_output_data;
    
    always_ff @(negedge clk or posedge rst) begin
        if (rst) begin
            count <= 5'd17; // Initialize count on reset
            temp_output_data <= 16'h0000; // Reset output on reset
        end
        else if (enable_write) begin
            if (count == 5'd17) begin
                temp_input_data <= input_data; // Store input_data on first cycle
                count <= count - 5'b1; // Increment count
            end
            else if (count == 5'd0) begin
                temp_output_data <= temp_input_data[count-1];
                count <= 5'd17; // Initialize count on reset
            end
            else begin
                temp_output_data <= temp_input_data[count-1]; // Output next data on subsequent cycles
                count <= count - 5'b1; // Increment count
            end
        end
    end
    
    assign output_data = temp_output_data;
endmodule