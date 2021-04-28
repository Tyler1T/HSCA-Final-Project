module mux4 (   input  logic        d0, d1, d2, d3,
                input  logic [1:0]  S,
                output logic        Y);



    flipper i1 (S[0], Sbar0);
    flipper i2 (S[1], Sbar1);
    and3 a1 (w1, d0, Sbar0, Sbar1);
    and3 a2 (w2, d1, S[0], Sbar1);
    and3 a3 (w3, d2, Sbar0, S[1]);
    and3 a4 (w4, d3, S[0], S[1]);
    or4 o1 (Y, w1, w2, w3, w4);

endmodule // mux41
