module vectorial_rf_tb;

    // Constants
    localparam int WIDTH = 16;

    // Inputs
    logic clk;
    logic rst;
    logic WEV;
    logic [4:0] RS1, RS2, RS3, RD;
    logic [WIDTH-1:0][WIDTH-1:0] WD;

    // Outputs
    logic [WIDTH-1:0][WIDTH-1:0] RD1, RD2, RD3;

    // Instantiate the vectorial_rf module
    vectorial_rf #(WIDTH) dut (
        .RS1(RS1),
        .RS2(RS2),
        .RS3(RS3),
        .RD(RD),
        .WD(WD),
        .WEV(WEV),
        .clk(clk),
        .rst(rst),
        .RD1(RD1),
        .RD2(RD2),
        .RD3(RD3)
    );

    /// Clock generation
	always begin
		#5 clk = ~clk;
	end

    // Test cases
    initial begin
		  rst = 1'b1;
		  clk = 1'b0;
        #20 
		  rst = 1'b0;
		  #10
        // Write to register 1
        WEV = 1'b1;
        RD = 5'b1;
        WD = '{'{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}, '{16'b1100110011001100}};
        #10;
        WEV = 1'b0;
		  #10
        // Read from register 1
        RS1 = 5'b1;
        RS2 = 1'b0;
        RS3 = 1'b0;
        #10 $display("Read data from RD1: %p", RD1);

    end

endmodule