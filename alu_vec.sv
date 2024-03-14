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

    alu_element_vec #(.element(element)) alu_instance2 (
        .elementA(vectorA[47:32]),
        .elementB(vectorB[47:32]),
        .opcode(opcode),
        .result(temp_result[47:32])
    );

    alu_element_vec #(.element(element)) alu_instance3 (
        .elementA(vectorA[63:48]),
        .elementB(vectorB[63:48]),
        .opcode(opcode),
        .result(temp_result[63:48])
    );

    alu_element_vec #(.element(element)) alu_instance4 (
        .elementA(vectorA[79:64]),
        .elementB(vectorB[79:64]),
        .opcode(opcode),
        .result(temp_result[79:64])
    );

    alu_element_vec #(.element(element)) alu_instance5 (
        .elementA(vectorA[95:80]),
        .elementB(vectorB[95:80]),
        .opcode(opcode),
        .result(temp_result[95:80])
    );

    alu_element_vec #(.element(element)) alu_instance6 (
        .elementA(vectorA[111:96]),
        .elementB(vectorB[111:96]),
        .opcode(opcode),
        .result(temp_result[111:96])
    );

    alu_element_vec #(.element(element)) alu_instance7 (
        .elementA(vectorA[127:112]),
        .elementB(vectorB[127:112]),
        .opcode(opcode),
        .result(temp_result[127:112])
    );

    alu_element_vec #(.element(element)) alu_instance8 (
        .elementA(vectorA[143:128]),
        .elementB(vectorB[143:128]),
        .opcode(opcode),
        .result(temp_result[143:128])
    );

    alu_element_vec #(.element(element)) alu_instance9 (
        .elementA(vectorA[159:144]),
        .elementB(vectorB[159:144]),
        .opcode(opcode),
        .result(temp_result[159:144])
    );

    alu_element_vec #(.element(element)) alu_instance10 (
        .elementA(vectorA[175:160]),
        .elementB(vectorB[175:160]),
        .opcode(opcode),
        .result(temp_result[175:160])
    );

    alu_element_vec #(.element(element)) alu_instance11 (
        .elementA(vectorA[191:176]),
        .elementB(vectorB[191:176]),
        .opcode(opcode),
        .result(temp_result[191:176])
    );

    alu_element_vec #(.element(element)) alu_instance12 (
        .elementA(vectorA[207:192]),
        .elementB(vectorB[207:192]),
        .opcode(opcode),
        .result(temp_result[207:192])
    );

    alu_element_vec #(.element(element)) alu_instance13 (
        .elementA(vectorA[223:208]),
        .elementB(vectorB[223:208]),
        .opcode(opcode),
        .result(temp_result[223:208])
    );

    alu_element_vec #(.element(element)) alu_instance14 (
        .elementA(vectorA[239:224]),
        .elementB(vectorB[239:224]),
        .opcode(opcode),
        .result(temp_result[239:224])
    );

    alu_element_vec #(.element(element)) alu_instance15 (
        .elementA(vectorA[255:240]),
        .elementB(vectorB[255:240]),
        .opcode(opcode),
        .result(temp_result[255:240])
    );

    always_comb begin
        result = temp_result;
    end
endmodule
