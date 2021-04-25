module halfAdderChain(  input logic [31:0] oneC,
                        output logic [31:0] toMux);
    logic carry[31:0];
    half_adder CPA0(carry[0], toMux[0], oneC[0], 0);
    half_adder CPA1(carry[1], toMux[1], oneC[1], 1);
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
    half_adder CPA19(carry[19], toMux[19], oneC[19], carry[18]);
    half_adder CPA20(carry[20], toMux[20], oneC[20], carry[19]);
    half_adder CPA21(carry[21], toMux[21], oneC[21], carry[20]);
    half_adder CPA22(carry[22], toMux[22], oneC[22], carry[21]);
    half_adder CPA23(carry[23], toMux[23], oneC[23], carry[22]);
    half_adder CPA24(carry[24], toMux[24], oneC[24], carry[23]);
    half_adder CPA25(carry[25], toMux[25], oneC[25], carry[24]);
    half_adder CPA26(carry[26], toMux[26], oneC[26], carry[25]);
    half_adder CPA27(carry[27], toMux[27], oneC[27], carry[26]);
    half_adder CPA28(carry[28], toMux[28], oneC[28], carry[27]);
    half_adder CPA29(carry[29], toMux[29], oneC[29], carry[28]);
    half_adder CPA30(carry[30], toMux[30], oneC[30], carry[29]);
    half_adder CPA31(carry[31], toMux[31], oneC[31], carry[30]);
    
endmodule
