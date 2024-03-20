module mem_output_manager_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds

    // Signals
    logic clk;
	 logic rst;
    logic enable_read;
	 logic [4:0] RD_in;
    logic [15:0] input_data;
	 logic [4:0] RD_out;
	 logic [15:0][15:0] output_data;

    // Instantiate the module under test
    mem_output_manager dut (
        .clk(clk),
        .rst(rst),
        .enable_read(enable_read),
		  .RD_in(RD_in),
        .input_data(input_data),
		  .RD_out(RD_out),
        .output_data(output_data)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
		  rst = 0;
		  input_data = 16'h0000;
        #5;
        rst = 1;
		  #5
		  rst = 0;
    end

    // Stimulus
	initial begin
		#20
		RD_in = 5'b00010;
		enable_read = 1;
		// Provide input data
		input_data = 16'h0001;
		#10
		input_data = 16'h0002;
		#10
		input_data = 16'h0003;
		#10
		input_data = 16'h0004;
		#10
		input_data = 16'h0005;
		#10
		input_data = 16'h0006;
		#10
		input_data = 16'h0007;
		#10
		input_data = 16'h0008;
		#10
		input_data = 16'h0009;
		#10
		input_data = 16'h000A;
		#10
		input_data = 16'h000B;
		#10
		input_data = 16'h000C;
		#10
		input_data = 16'h000D;
		#10
		input_data = 16'h000E;
		#10
		input_data = 16'h000F;
		#10
		enable_read = 0;
		// End simulation
		$finish;
	end

endmodule