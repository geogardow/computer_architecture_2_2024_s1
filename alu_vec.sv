module alu_vec #(element = 16)(
    input logic [element-1:0][element-1:0] vectorA,
    input logic [element-1:0][element-1:0] vectorB,
    input logic [15:0] scalar,
    input logic [2:0] sel,
    input logic operand_flag,
    output logic [element-1:0][element-1:0] result
);
    logic [element-1:0][element-1:0] temp_result;
    logic [element-1:0] out_alu_instance0;
    logic [element-1:0] out_alu_instance1;
    logic [element-1:0] out_alu_instance2;
    logic [element-1:0] out_alu_instance3;
    logic [element-1:0] out_alu_instance4;
    logic [element-1:0] out_alu_instance5;
    logic [element-1:0] out_alu_instance6;
    logic [element-1:0] out_alu_instance7;
    logic [element-1:0] out_alu_instance8;
    logic [element-1:0] out_alu_instance9;
    logic [element-1:0] out_alu_instance10;
    logic [element-1:0] out_alu_instance11;
    logic [element-1:0] out_alu_instance12;
    logic [element-1:0] out_alu_instance13;
    logic [element-1:0] out_alu_instance14;
    logic [element-1:0] out_alu_instance15;

    mux_2to1 #(.N(element)) mux_alu_instance0 (
        .A(vectorB[0]),
        .B(scalar), 
        .sel(operand_flag), 
        .C(out_alu_instance0)
        );

    alu_element_vec #(.element(element)) alu_instance0 (
        .elementA(vectorA[0]),
        .elementB(out_alu_instance0),
        .sel(sel),
        .result(temp_result[0])
    );

    mux_2to1 #(.N(element)) mux_alu_instance1 (
    .A(vectorB[1]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance1)
    );

    alu_element_vec #(.element(element)) alu_instance1 (
        .elementA(vectorA[1]),
        .elementB(out_alu_instance1),
        .sel(sel),
        .result(temp_result[1])
    );

    mux_2to1 #(.N(element)) mux_alu_instance2 (
    .A(vectorB[2]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance2)
    );

    alu_element_vec #(.element(element)) alu_instance2 (
        .elementA(vectorA[2]),
        .elementB(out_alu_instance2),
        .sel(sel),
        .result(temp_result[2])
    );

    mux_2to1 #(.N(element)) mux_alu_instance3 (
    .A(vectorB[3]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance3)
    );

    alu_element_vec #(.element(element)) alu_instance3 (
        .elementA(vectorA[3]),
        .elementB(out_alu_instance3),
        .sel(sel),
        .result(temp_result[3])
    );

    mux_2to1 #(.N(element)) mux_alu_instance4 (
    .A(vectorB[4]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance4)
    );

    alu_element_vec #(.element(element)) alu_instance4 (
        .elementA(vectorA[4]),
        .elementB(out_alu_instance4),
        .sel(sel),
        .result(temp_result[4])
    );

    mux_2to1 #(.N(element)) mux_alu_instance5 (
    .A(vectorB[5]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance5)
    );

    alu_element_vec #(.element(element)) alu_instance5 (
        .elementA(vectorA[5]),
        .elementB(out_alu_instance5),
        .sel(sel),
        .result(temp_result[5])
    );

    mux_2to1 #(.N(element)) mux_alu_instance6 (
    .A(vectorB[6]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance6)
    );

    alu_element_vec #(.element(element)) alu_instance6 (
        .elementA(vectorA[6]),
        .elementB(out_alu_instance6),
        .sel(sel),
        .result(temp_result[6])
    );

    mux_2to1 #(.N(element)) mux_alu_instance7 (
    .A(vectorB[7]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance7)
    );

    alu_element_vec #(.element(element)) alu_instance7 (
        .elementA(vectorA[7]),
        .elementB(out_alu_instance7),
        .sel(sel),
        .result(temp_result[7])
    );

    mux_2to1 #(.N(element)) mux_alu_instance8 (
    .A(vectorB[8]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance8)
    );

    alu_element_vec #(.element(element)) alu_instance8 (
        .elementA(vectorA[8]),
        .elementB(out_alu_instance8),
        .sel(sel),
        .result(temp_result[8])
    );

    mux_2to1 #(.N(element)) mux_alu_instance9 (
    .A(vectorB[9]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance9)
    );

    alu_element_vec #(.element(element)) alu_instance9 (
        .elementA(vectorA[9]),
        .elementB(out_alu_instance9),
        .sel(sel),
        .result(temp_result[9])
    );

    mux_2to1 #(.N(element)) mux_alu_instance10 (
    .A(vectorB[10]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance10)
    );

    alu_element_vec #(.element(element)) alu_instance10 (
        .elementA(vectorA[10]),
        .elementB(out_alu_instance10),
        .sel(sel),
        .result(temp_result[10])
    );

    mux_2to1 #(.N(element)) mux_alu_instance11 (
    .A(vectorB[11]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance11)
    );

    alu_element_vec #(.element(element)) alu_instance11 (
        .elementA(vectorA[11]),
        .elementB(out_alu_instance11),
        .sel(sel),
        .result(temp_result[11])
    );

    mux_2to1 #(.N(element)) mux_alu_instance12 (
    .A(vectorB[12]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance12)
    );

    alu_element_vec #(.element(element)) alu_instance12 (
        .elementA(vectorA[12]),
        .elementB(out_alu_instance12),
        .sel(sel),
        .result(temp_result[12])
    );

    mux_2to1 #(.N(element)) mux_alu_instance13 (
    .A(vectorB[13]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance13)
    );

    alu_element_vec #(.element(element)) alu_instance13 (
        .elementA(vectorA[13]),
        .elementB(out_alu_instance13),
        .sel(sel),
        .result(temp_result[13])
    );

    mux_2to1 #(.N(element)) mux_alu_instance14 (
    .A(vectorB[14]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance14)
    );

    alu_element_vec #(.element(element)) alu_instance14 (
        .elementA(vectorA[14]),
        .elementB(out_alu_instance14),
        .sel(sel),
        .result(temp_result[14])
    );

    mux_2to1 #(.N(element)) mux_alu_instance15 (
    .A(vectorB[15]),
    .B(scalar), 
    .sel(operand_flag), 
    .C(out_alu_instance15)
    );

    alu_element_vec #(.element(element)) alu_instance15 (
        .elementA(vectorA[15]),
        .elementB(out_alu_instance15),
        .sel(sel),
        .result(temp_result[15])
    );

    always_comb begin
        result = temp_result;
    end
endmodule
