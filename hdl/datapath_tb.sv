module stimulus;

   reg [15:0]  D;
   reg [15:0]  N;
   reg [15:0]  IA;
   reg 	      load_regN, load_regD;
   reg [1:0]  sel_ND_mux;
   reg        sel_K_mux;
   reg 	      clk, reset;
   wire [15:0] result;

   integer     handle3;
   integer     desc3;

   datapath dut1 (clk, reset, sel_K_mux, load_regN, load_regD, sel_ND_mux, N, D, IA, result);

   initial
     begin
	   clk = 1'b1;
	   forever #5 clk = ~clk;
     end

   initial
     begin
	   handle3 = $fopen("datapath.out");
     end

   always
     begin
	   desc3 = handle3;
	   #5 $fdisplay(desc3, "%b %b %b", sel_ND_mux,
		     sel_K_mux, result);
     end

   initial
     begin
        #0  reset <= 1'b0;

        // Numbers are: 1.0460665924473482 / 1.9831498889813877 = 0.5274773219409266
        // Result should be near 1.0111100111110101
        #0  IA = 16'b01000000000000000;
    	#0  N = 16'b10000101111001011;
    	#0  D = 16'b11111101110101111;

    	//Cycle 1: IA * D
    	#4  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b00;
    	#0  sel_K_mux <= 1'b1;

    	//Cycle 2: IA * N
    	#14  load_regN <= 1'b1;
    	#0  load_regD <= 1'b0;
    	#1  sel_ND_mux <= 2'b01;
    	#0  sel_K_mux <= 1'b1;


    	//Cycle 3: K1 * D
    	#14  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b10;
    	#0  sel_K_mux <= 1'b0;

    	//Cycle 4: K1 * N
    	#14  load_regN <= 1'b1;
    	#0  load_regD <= 1'b0;
    	#1  sel_ND_mux <= 2'b11;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 5: K2 * D
    	#14  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b10;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 6: K2 * N
    	#14  load_regN <= 1'b1;
    	#0  load_regD <= 1'b0;
    	#1  sel_ND_mux <= 2'b11;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 7: K3 * D
    	#14  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b10;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 8: K3 * N
    	#14  load_regN <= 1'b1;
    	#0  load_regD <= 1'b0;
    	#1  sel_ND_mux <= 2'b11;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 9: K4 * D
    	#14  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b10;
    	#0  sel_K_mux <= 1'b0;


    	//Cycle 10: K4 * N
    	#14  load_regN <= 1'b1;
    	#0  load_regD <= 1'b0;
    	#1  sel_ND_mux <= 2'b11;
    	#0  sel_K_mux <= 1'b0;


     end


endmodule // stimulus
