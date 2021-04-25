module kGenerator(  input logic[31:0] previousK,
                    input logic[31:0] IA,
                    input logic kSelect,
                    output logic[31:0] k);

    logic [31:0] sum, between;
    oneC #(32) negate(previousK, between);
    halfAdderChain adder(between, sum);
    mux2 #(32) selecter(sum, IA, kSelect, k);


endmodule
