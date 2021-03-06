module mux4by19(input  logic [18:0]     d0, d1, d2, d3,
                input  logic [1:0]      S,
                output logic [18:0]     Y);

    mux4 m0 (d0[0], d1[0], d2[0], d3[0], S, Y[0]);
    mux4 m1 (d0[1], d1[1], d2[1], d3[1], S, Y[1]);
    mux4 m2 (d0[2], d1[2], d2[2], d3[2], S, Y[2]);
    mux4 m3 (d0[3], d1[3], d2[3], d3[3], S, Y[3]);
    mux4 m4 (d0[4], d1[4], d2[4], d3[4], S, Y[4]);
    mux4 m5 (d0[5], d1[5], d2[5], d3[5], S, Y[5]);
    mux4 m6 (d0[6], d1[6], d2[6], d3[6], S, Y[6]);
    mux4 m7 (d0[7], d1[7], d2[7], d3[7], S, Y[7]);
    mux4 m8 (d0[8], d1[8], d2[8], d3[8], S, Y[8]);
    mux4 m9 (d0[9], d1[9], d2[9], d3[9], S, Y[9]);
    mux4 m10 (d0[10], d1[10], d2[10], d3[10], S, Y[10]);
    mux4 m11 (d0[11], d1[11], d2[11], d3[11], S, Y[11]);
    mux4 m12 (d0[12], d1[12], d2[12], d3[12], S, Y[12]);
    mux4 m13 (d0[13], d1[13], d2[13], d3[13], S, Y[13]);
    mux4 m14 (d0[14], d1[14], d2[14], d3[14], S, Y[14]);
    mux4 m15 (d0[15], d1[15], d2[15], d3[15], S, Y[15]);
    mux4 m16 (d0[16], d1[16], d2[16], d3[16], S, Y[16]);
    mux4 m17 (d0[17], d1[17], d2[17], d3[17], S, Y[17]);
    mux4 m18 (d0[18], d1[18], d2[18], d3[18], S, Y[18]);

endmodule // mux41
