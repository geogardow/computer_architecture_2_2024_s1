module extend_vector_size(
    input logic [18:0] input_data,
    output logic [255:0] output_data
);

    always_comb begin
        // 256-bit immediate
        output_data = { input_data, {237{1'b0}} };
    end

endmodule