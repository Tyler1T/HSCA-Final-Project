module datapath(input   logic              clk, reset, kSelect,
                input   logic       [1:0]  ndSelect,
                input   logic       [15:0] N, D, IA,
                output  logic       [15:0] result);

    wire [37:0] CSAM_RNE;
    wire [18:0] RNE_reg, K_CSAM;
    wire [15:0] regD, regN;
    wire [18:0] 19N, 19D;
    assign 19N[18:3] = N;
    assign 19N[2:0] = 3'b000;
    assign 19D[18:3] = D;
    assign 19D[2:0] = 3'b000;
    assign 19IA[18:3] = IA;
    assign 19IA[2:0] = 3'b000;



    // Stage 1
    kGenerator kStuff(.previousK(ready),
                      .IA(IA),
                      .kSelect(kSelect),
                      .k(K_CSAM));


    mux4by19   selecter(.d0(19D),
                        .d1(19N),
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
