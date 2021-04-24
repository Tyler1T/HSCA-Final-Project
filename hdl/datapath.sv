module datapath(input   logic        clk, reset,
                input   logic        N, D, IA,
                output  logic [31:0] result);

    wire CSAM_register;

    CSAM multiplier(.Z(CSAM_register));
    flopr  #(32) output(.clk(clk),
                        .reset(reset),
                        .en(MemSysReady),
                        .d(CSAM_register),
                        .q(result));
endmodule
