module extend_tb;

    // Inputs
    logic [27:0] Instr;
    logic [1:0] ImmSrc;
    
    // Outputs
    logic [18:0] ExtImm;

    // Instantiate the extend module
    extend dut(
        .Instr(Instr),
        .ImmSrc(ImmSrc),
        .ExtImm(ExtImm)
    );

    // Test cases
    initial begin
        $display("Testing with 28-bit unsigned immediate");
        Instr = 28'b1010101010101010101010101010;
        ImmSrc = 2'b00;
        #10 $display("Instr = %b, ImmSrc = %b, ExtImm = %b", Instr, ImmSrc, ExtImm);

        $display("Testing with 18-bit unsigned immediate");
        Instr = 28'b1010101010101010101010101010;
        ImmSrc = 2'b01;
        #10 $display("Instr = %b, ImmSrc = %b, ExtImm = %b", Instr, ImmSrc, ExtImm);

        $display("Testing with 17-bit unsigned immediate");
        Instr = 28'b1010101010101010101010101010;
        ImmSrc = 2'b10;
        #10 $display("Instr = %b, ImmSrc = %b, ExtImm = %b", Instr, ImmSrc, ExtImm);

        $display("Testing with 16-bit unsigned immediate");
        Instr = 28'b1010101010101010101010101010;
        ImmSrc = 2'b11;
        #10 $display("Instr = %b, ImmSrc = %b, ExtImm = %b", Instr, ImmSrc, ExtImm);
        
    end

endmodule
