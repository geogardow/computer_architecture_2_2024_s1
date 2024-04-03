module alu_element_vec #(parameter element = 16)(
    input logic [element-1:0] elementA,
    input logic [element-1:0] elementB,
    input logic [2:0] sel, // Control signal for the operation
    output logic [element-1:0] result
);
    logic [element-1:0] temp_result;
	 
    always_comb begin
			case (sel)
				// suma
				3'b000: temp_result = elementA + elementB; 
				// resta
				3'b001: temp_result = elementA - elementB;
				// multiplicación 
				3'b010: temp_result = elementA * elementB;
				// corrimiento a aritmetico a la derecha
				3'b011: temp_result = elementA >> elementB; 
				// corrimiento a logico a la derecha
				3'b100: temp_result = elementA >>> elementB;
				// corrimiento a logico a la izquierda
				3'b101: temp_result = elementA <<< elementB;
				// union
				3'b110: temp_result = elementA & elementB; 

				default: temp_result = 0;
			endcase
     end

    always_comb begin
		result = temp_result;
    end
endmodule
