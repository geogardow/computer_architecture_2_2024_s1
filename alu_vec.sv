module alu_vec #(parameter vector_size = 256, element = 16)(
    input logic [vector_size-1:0] vectorA,
    input logic [vector_size-1:0] vectorB,
    input logic [2:0] opcode, // Control signal for the operation
    output logic [vector_size-1:0] result
);
    logic [vector_size-1:0] temp_result;
	 
    
    alu_element_vec #(.element(element)) alu_instance0 (
        .elementA(vectorA[15:0]),
        .elementB(vectorB[15:0]),
        .opcode(opcode),
        .result(temp_result[15:0])
    );

    alu_element_vec #(.element(element)) alu_instance1 (
        .elementA(vectorA[31:16]),
        .elementB(vectorB[31:16]),
        .opcode(opcode),
        .result(temp_result[31:16])
    );



    always_comb begin
        result = temp_result;
    end
endmodule
