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
	   #15 $fdisplay(desc3, "%b %b %b", sel_ND_mux, sel_K_mux, result);
     end

   initial
     begin
        #0  reset <= 1'b0;

        // Test 0
        // Numbers are: 1.8165377917701346 / 1.9565319103670569 = 0.9284478224683499
        // Result should be near 0.9284478224683499 or 01110110110101110
        // IA is 1.5049118541816742

        #0 IA = 16'b11000000101000001;
        #0 N = 16'b11101000100001000;
        #0 D = 16'b11111010011011111;


        // Test 1
        // Numbers are: 1.7194397503154375 / 1.9174017704676052 = 0.8967550655260479
        // Result should be near 0.8967550655260479 or 01110010110010001
        // IA is 1.482505184870552

        #0 IA = 16'b10111101110000101;
        #0 N = 16'b11011100000101101;
        #0 D = 16'b11110101011011010;


        // Test 2
        // Numbers are: 1.1777577353094817 / 1.9569011254028217 = 0.6018483611771873
        // Result should be near 0.6018483611771873 or 01001101000010010
        // IA is 1.551172381778117

        #0 IA = 16'b11000110100011001;
        #0 N = 16'b10010110110000001;
        #0 D = 16'b11111010011110111;


        // Test 3
        // Numbers are: 1.55074412008246 / 1.0448167123606797 = 1.4842259907756241
        // Result should be near 1.4842259907756241 or 10111101111110110
        // IA is 1.248007928123953

        #0 IA = 16'b10011111101111101;
        #0 N = 16'b11000110011111101;
        #0 D = 16'b10000101101111001;


        // Test 4
        // Numbers are: 1.720467896747824 / 1.6620017248405612 = 1.0351781656020071
        // Result should be near 1.0351781656020071 or 10000100100000001
        // IA is 1.8776399876341983

        #0 IA = 16'b11110000010101101;
        #0 N = 16'b11011100001110000;
        #0 D = 16'b11010100101111000;


        // Test 5
        // Numbers are: 1.909861148417805 / 1.0477627929190292 = 1.822799169167862
        // Result should be near 1.822799169167862 or 11101001010100010
        // IA is 1.7553197265036848

        #0 IA = 16'b11100000101011100;
        #0 N = 16'b11110100011101100;
        #0 D = 16'b10000110000111010;


        // Test 6
        // Numbers are: 1.1846334980579583 / 1.1617747953883502 = 1.0196756744597537
        // Result should be near 1.0196756744597537 or 10000010100001001
        // IA is 1.0742586056154626

        #0 IA = 16'b10001001100000010;
        #0 N = 16'b10010111101000100;
        #0 D = 16'b10010100101101010;


        // Test 7
        // Numbers are: 1.475171576828526 / 1.483774113438664 = 0.9942022599449445
        // Result should be near 0.9942022599449445 or 01111111010000100
        // IA is 1.8671808615830976

        #0 IA = 16'b11101110111111111;
        #0 N = 16'b10111100110100100;
        #0 D = 16'b10111101111011000;


        // Test 8
        // Numbers are: 1.9237322026208155 / 1.6205966995198096 = 1.1870517835750414
        // Result should be near 1.1870517835750414 or 10010111111100010
        // IA is 1.4258643076503583

        #0 IA = 16'b10110110100000101;
        #0 N = 16'b11110110001111001;
        #0 D = 16'b11001111011011111;


        // Test 9
        // Numbers are: 1.9354956245589827 / 1.3782570448095055 = 1.4043067161151317
        // Result should be near 1.4043067161151317 or 10110011110000000
        // IA is 1.8606814555204951

        #0 IA = 16'b11101110001010101;
        #0 N = 16'b11110111101111100;
        #0 D = 16'b10110000011010101;


        // Test 10
        // Numbers are: 1.6378751277635373 / 1.6894631103360065 = 0.9694648659347115
        // Result should be near 0.9694648659347115 or 01111100000101110
        // IA is 1.4349626594593197

        #0 IA = 16'b10110111101011001;
        #0 N = 16'b11010001101001011;
        #0 D = 16'b11011000010000000;


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

    	//Cycle 9: K5 * D
    	#14  load_regN <= 1'b0;
    	#0  load_regD <= 1'b1;
    	#1  sel_ND_mux <= 2'b10;
    	#0  sel_K_mux <= 1'b0;


     end


endmodule // stimulus
