module mux4 (   input  logic        d0, d1, d2, d3,
                input  logic [1:0]  S,
                output logic        Y);



    flipper i1 (S[0], Sbar0);
    flipper i2 (S[1], Sbar1);
    and3 a1 (d0, Sbar0, Sbar1, w1);
    and3 a2 (d1, S[0], Sbar1, w2);
    and3 a3 (d2, Sbar0, S[1], w3);
    and3 a4 (d3, S[0], S[1], w4);
    or4 o1 (w1, w2, w3, w4, Y);

endmodule // mux41
