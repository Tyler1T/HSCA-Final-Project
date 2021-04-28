module RNE(input logic[37:0] big,
            output logic [18:0] rounded);

    assign rounded[18:1] = big[36:18];
    assign rounded[0] = big[21] & big[20] | ~big[21] & big[20] & big[19];

endmodule
