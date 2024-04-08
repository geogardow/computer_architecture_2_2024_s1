module mem_addr_manager_tb;

    // Define parameters
    parameter CLOCK_PERIOD = 10; // Clock period in nanoseconds

    // Signals
    logic clk;
    logic rst;
    logic read_enable;
    logic write_enable;
    logic [15:0] input_address;
    logic [15:0] output_address;

    // Instantiate the module under test
    mem_addr_manager dut (
        .clk(clk),
		  .rst(rst),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .input_address(input_address),
        .output_address(output_address)
    );

    // Clock generation
    always #((CLOCK_PERIOD)/2) clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        rst = 1;
        #20;
        rst = 0;
    end

    // Stimulus
    initial begin
        // enable
        read_enable = 1;
        write_enable = 0;
        input_address = 16'h0000;
        #50;

        // disable
        read_enable = 0;
        write_enable = 0;
        input_address = 16'hFFFF;
        #50;

        // End simulation
        $finish;
    end

    // Display outputs
    always @(posedge clk) begin
        $display("output_address = %h", output_address);
    end

endmodule