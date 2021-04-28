module datapath(input   logic              clk, reset, kSelect,
                input   logic       [1:0]  ndSelect,
                input   logic       [15:0] N, D, IA,
                output  logic       [15:0] result);

    // Stage 1

    kGenerator kStuff(.previousK(ready),
                      .IA(IA),
                      .kSelect(kSelect),
                      .k(K_CSAM));


    mux4by16   selecter(.d0(D),
                        .d1(N),
                        .d2(newD),
                        .d3(newN),
                        .s(ndSelect),
                        .y(num_CSAM));


    // Stage 2

    CSAM multiplier(.Z(CSAM_RNE),
                    .X(K_CSAM),
                    .Y(num_CSAM));

    RNE rounder(.big(CSAM_RNE),
                .rounded(RNE_reg));

    flopenr  #(16) CSAM_Reg_N(.clk(clk),
                        .reset(reset),
                        .en(nEnable),
                        .d(RNE_reg),
                        .q(newN));

    flopenr  #(16) CSAM_Reg_D(.clk(clk),
                        .reset(reset),
                        .en(dEnable),
                        .d(RNE_reg),
                        .q(newD));

    assign result = newD;

endmodule
