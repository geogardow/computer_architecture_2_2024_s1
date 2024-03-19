module mem_input_manager_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds

    // Signals
    logic clk;
	 logic rst;
    logic enable_write;
    logic [15:0][15:0] input_data;
	 logic [15:0] output_data;

    // Instantiate the module under test
    mem_input_manager dut (
        .clk(clk),
        .rst(rst),
        .enable_write(enable_write),
        .input_data(input_data),
        .output_data(output_data)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
		  rst = 0;
        #20;
        rst = 1;
		  #20
		  rst = 0;
    end

    // Stimulus
    initial begin
        enable_write = 1;
        // Provide input data
        input_data = '{16'h1111, 16'h2222, 16'h3333, 16'h4444, 16'h5555, 16'h6666, 16'h7777, 16'h8888, 16'h9999, 16'hAAAA, 16'hBBBB, 16'hCCCC, 16'hDDDD, 16'hEEEE, 16'hFFFF, 16'h0000};
        #500; // Wait for some cycles
        enable_write = 0;
        // End simulation
        $finish;
    end

endmodule