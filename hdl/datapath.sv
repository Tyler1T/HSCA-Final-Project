module datapath(input   logic       clk, reset, kSelect, ndSelect,
                input   logic       [15:0] N,
                input   logic       [15:0] D,
                input   logic       [15:0] IA,
                output  logic       [15:0] result);

    logic [31:0] CSAM_register;
    logic [31:0] toRound;
    logic [15:0] gen_CSAM;
    logic [15:0] ndSel_reg;
    logic [15:0] ndReg_CSAM;
    logic [15:0] kReg;
    logic [15:0] ready;

    logic kEnable;

    assign kEnable = ~ndSelect;
    assign result = ready;

    // Stage 1

    kGenerator kStuff(.previousK(ready),
                      .IA(IA),
                      .kSelect(kSelect),
                      .k(kReg));

    flopenr  #(16) kHolder(.clk(clk),
                        .reset(reset),
                        .en(kEnable),
                        .d(kReg),
                        .q(gen_CSAM));

    mux2 #(16) selecter(.d0(D),
                        .d1(N),
                        .s(ndSelect),
                        .y(ndSel_reg));

    flopr  #(16) ndHolder(.clk(clk),
                        .reset(reset),
                        .d(ndSel_reg),
                        .q(ndReg_CSAM));

    // Stage 2

    CSAM multiplier(.Z(CSAM_register),
                    .X(ndReg_CSAM),
                    .Y(gen_CSAM));

    flopr  #(32) CSAM_Reg(.clk(clk),
                        .reset(reset),
                        .d(CSAM_register),
                        .q(toRound));

    RNE rounder(.big(toRound),
                .rounded(ready));

endmodule
