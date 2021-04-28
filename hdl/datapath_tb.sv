module stimulus();

  logic [15:0] N;
  logic [15:0] D;
  logic [31:0] Z;

  logic [15:0] answer;
  logic clk, ndSelect, kSelect;
  logic [15:0] IA;
  logic [15:0] result;

  //for five vector numbers we need 3 bits
  logic [31:0] vectornum, errors;

  //the testvector file should be 5 rows each 27 bits wide
  logic [47:0] testVector[29:0];


  // Instantiate DUT
  datapath dut(clk, reset, kSelect, ndSelect, N, D, IA, result);

  initial
    begin
      $readmemb("testvector.tv", testVector);
      vectornum = 0; errors = 0;
    end

    if(answer !== Z) begin
      $display("Error: inputs for test N = %b D = %b", N, D);
      $display("  outputs = %b (%b expected)", result, answer);
      $display("");
      errors = errors + 1;
    end
  end
endmodule
