module kGenerator(  input logic[15:0] previousK,
                    input logic[15:0] IA,
                    input logic kSelect,
                    output logic[15:0] k);

    logic [15:0] sum;
    logic [15:0] between;
    oneC #(16) negate(previousK, between);
    halfAdderChain adder(between, sum);
    mux2 #(16) selecter(sum, IA, kSelect, k);


endmodule
