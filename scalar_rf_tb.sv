module scalar_rf_tb;

	logic clk, rst, WES;
	logic [4:0] RS1, RS2, RS3, RD;
	logic [15:0] WD;
	logic [15:0] RD1, RD2, RD3;

	// Instantiate the scalar_rf module
	scalar_rf dut (
		.RS1(RS1),
		.RS2(RS2),
		.RS3(RS3),
		.RD(RD),
		.WD(WD),
		.WES(WES),
		.clk(clk),
		.rst(rst),
		.RD1(RD1),
		.RD2(RD2),
		.RD3(RD3)
	);

	// Clock generation
	always begin
		#5 clk = ~clk;
	end
	
	
    // Testbench stimulus
    initial begin
        // Initialize inputs
        RS1 = 4'd2;  // Example RS1 value
        RS2 = 4'd5;  // Example RS2 value
        RS3 = 4'd10; // Example RS3 value
        RD = 4'd7;   // Example RD value
        WD = 32'hAABBCCDD; // Example WD value
        WES = 1'b1;   // Enable write operation
        clk = 1'b0;         // Initial clock state
        rst = 1'b1;         // Reset active (high) initially
        
        // Release reset after some time
        #20 rst = 1'b0;
        
        // Testbench logic
        #10 WES = 1'b0; // Disable write operation
        #10 RS1 = 4'd3;  // Change RS1 value
        #10 RS2 = 4'd7;  // Change RS2 value
        #10 RS3 = 4'd15; // Change RS3 value
        #10 RD = 4'd1;   // Change RD value
        #10 WD = 32'h12345678; // Change WD value
		  
		  #10 WES = 1'b1; // Enable write operation
        #10 RS1 = 4'd3;  // Change RS1 value
        #10 RS2 = 4'd7;  // Change RS2 value
        #10 RS3 = 4'd15; // Change RS3 value
        #10 RD = 4'd1;   // Change RD value
        #10 WD = 32'h12345678; // Change WD value
		  
		  #10 WES = 1'b0; // Disable write operation
        #10 RS1 = 4'd1;  // Change RS1 value
        #10 RS2 = 4'd7;  // Change RS2 value
        #10 RS3 = 4'd15; // Change RS3 value
        #10 RD = 4'd1;   // Change RD value
        #10 WD = 32'h12345678; // Change WD value
		  
    end


endmodule