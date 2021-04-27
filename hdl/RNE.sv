module RNE(input logic[31:0] big,
            output logic [15:0] rounded);

    assign rounded[15:1] = big[31:16];
    assign rounded[0] = big[15] & big[14] | ~big[15] & big[14];

endmodule
