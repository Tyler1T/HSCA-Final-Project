module oneC #(parameter WIDTH = 8)
    (   input [WIDTH-1:0] num,
        output [WIDTH-1:0] answer);

    assign answer = ~num;
endmodule
