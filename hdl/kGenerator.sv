module kGenerator(  input logic[18:0] previousK,
                    input logic[18:0] IA,
                    input logic kSelect,
                    output logic[18:0] k);

    logic [18:0] sum;
    logic [18:0] between;
    oneC #(19) negate(previousK, between);
    halfAdderChain adder(between, sum);
    mux2 #(19) selecter(sum, IA, kSelect, k);


endmodule
