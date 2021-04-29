module datapath(input   logic              clk, reset, kSelect, nEnable, dEnable,
                input   logic       [1:0]  ndSelect,
                input   logic       [15:0] N, D, IA,
                output  logic       [15:0] result);

    wire [37:0] CSAM_RNE;
    wire [18:0] RNE_reg, K_CSAM, newD, newN, num_CSAM, previousK;
    wire [15:0] regD, regN;
    wire [18:0] N19, D19, IA19;
    assign N19[18:3] = N;
    assign N19[2:0] = 3'b000;
    assign D19[18:3] = D;
    assign D19[2:0] = 3'b000;
    assign IA19[18:3] = IA;
    assign IA19[2:0] = 3'b000;



    // Stage 1
    kGenerator kStuff(.previousK(newD),
                      .IA(IA19),
                      .kSelect(kSelect),
                      .k(K_CSAM));


    mux4by19   selecter(.d0(D19),
                        .d1(N19),
                        .d2(newD),
                        .d3(newN),
                        .S(ndSelect),
                        .Y(num_CSAM));


    // Stage 2

    CSAM multiplier(.Z(CSAM_RNE),
                    .X(K_CSAM),
                    .Y(num_CSAM));

    RNE rounder(.big(CSAM_RNE),
                .rounded(RNE_reg));

    flopenr  #(19) CSAM_Reg_N(.clk(clk),
                        .reset(reset),
                        .en(nEnable),
                        .d(RNE_reg),
                        .q(newN));

    flopenr  #(19) CSAM_Reg_D(.clk(clk),
                        .reset(reset),
                        .en(dEnable),
                        .d(RNE_reg),
                        .q(newD));

    assign result = newD;

endmodule
