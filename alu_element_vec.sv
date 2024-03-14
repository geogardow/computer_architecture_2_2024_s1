module alu_element_vec #(parameter element = 16)(
    input logic [element-1:0] elementA,
    input logic [element-1:0] elementB,
    input logic [2:0] opcode, // Control signal for the operation
    output logic [element-1:0] result
);
    logic [element-1:0] temp_result;
	 
    always_comb begin
			case (opcode)
				 3'b000: temp_result = elementA + elementB; // Addition
				 
				 default: temp_result = 0;
			endcase
     end


    // Combine the results into the final vector
    always_comb begin
		result = temp_result;
    end
endmodule
