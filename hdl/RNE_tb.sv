module stimulus();

  logic [15:0] X;
  logic [31:0] Z;

  logic clk;



  // Instantiate DUT
  CSAM dut(Z, X);
  always
    begin
      clk = 1; #5;
      clk = 0; #5;
    end

  initial

  always @(posedge clk)
    begin
        
    end

endmodule
