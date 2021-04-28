module RNE(input logic[37:0] big,
            output logic [18:0] rounded);

    assign rounded[18:1] = big[36:18];
    assign rounded[0] = big[18] & big[17] | ~big[18] & big[17] & big[16];

endmodule
