module halfAdderChain(  input logic [18:0] oneC,
                        output logic [18:0] toMux);
    logic carry[18:0];
    half_adder CPA0(carry[0], toMux[0], oneC[0], 1'b0);
    half_adder CPA1(carry[1], toMux[1], oneC[1], 1'b1);
    half_adder CPA2(carry[2], toMux[2], oneC[2], carry[1]);
    half_adder CPA3(carry[3], toMux[3], oneC[3], carry[2]);
    half_adder CPA4(carry[4], toMux[4], oneC[4], carry[3]);
    half_adder CPA5(carry[5], toMux[5], oneC[5], carry[4]);
    half_adder CPA6(carry[6], toMux[6], oneC[6], carry[5]);
    half_adder CPA7(carry[7], toMux[7], oneC[7], carry[6]);
    half_adder CPA8(carry[8], toMux[8], oneC[8], carry[7]);
    half_adder CPA9(carry[9], toMux[9], oneC[9], carry[8]);
    half_adder CPA10(carry[10], toMux[10], oneC[10], carry[9]);
    half_adder CPA11(carry[11], toMux[11], oneC[11], carry[10]);
    half_adder CPA12(carry[12], toMux[12], oneC[12], carry[11]);
    half_adder CPA13(carry[13], toMux[13], oneC[13], carry[12]);
    half_adder CPA14(carry[14], toMux[14], oneC[14], carry[13]);
    half_adder CPA15(carry[15], toMux[15], oneC[15], carry[14]);
    half_adder CPA16(carry[16], toMux[16], oneC[16], carry[15]);
    half_adder CPA17(carry[17], toMux[17], oneC[17], carry[16]);
    half_adder CPA18(carry[18], toMux[18], oneC[18], carry[17]);

endmodule
