module datapath(input   logic       clk, reset, kSelect, ndSelect,
                input   logic       [31:0] N,
                input   logic       [31:0] D,
                input   logic       [15:0] IA,
                output  logic       [31:0] result);

    logic [31:0] CSAM_register;
    logic [15:0] gen_CSAM;
    logic [15:0] ndSel_CSAM;


    kGenerator kStuff(.previousK(result),
                      .IA(),
                      .kSelect(kSelect),
                      .k(gen_CSAM));

    mux2 #(16) selecter(.d0(N),
                        .d1(D),
                        .s(ndSelect),
                        .y(ndSel_CSAM));

    CSAM multiplier(.Z(CSAM_register),
                    .X(ndSel_CSAM),
                    .Y(gen_CSAM));

    flopr  #(32) output(.clk(clk),
                        .reset(reset),
                        .d(CSAM_register),
                        .q(result));
endmodule
