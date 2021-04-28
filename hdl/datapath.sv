module datapath(input   logic              clk, reset, kSelect, 
                input   logic       [1:0]  ndSelect,
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

    mux4by16   selecter(.d0(D),
                        .d1(N),
                        .d2(newD),
                        .d3(newN),
                        .s(ndSelect),
                        .y(ndSel_reg));

    flopr  #(16) ndHolder(.clk(clk),
                        .reset(reset),
                        .d(ndSel_reg),
                        .q(ndReg_CSAM));

    // Stage 2

    CSAM multiplier(.Z(CSAM_RNE),
                    .X(ndReg_CSAM),
                    .Y(gen_CSAM));

    RNE rounder(.big(CSAM_RNE),
                .rounded(RNE_reg));

    flopenr  #(16) CSAM_Reg_N(.clk(clk),
                        .reset(reset),
                        .d(RNE_reg),
                        .q(newN));

    flopenr  #(16) CSAM_Reg_D(.clk(clk),
                        .reset(reset),
                        .d(RNE_reg),
                        .q(newD));



endmodule
