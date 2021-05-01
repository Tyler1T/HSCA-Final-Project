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

        // Test 1
        // Numbers are: 1.5 / 1.25 = 0.5274773219409266
        // Result should be near 1.2 or 1001100110001
        #0  IA = 16'b1001_0000_0000_0000;
    	#0  N = 16'b1100_0000_0000_0000;
    	#0  D = 16'b1010_0000_0000_0000;

        // Test 2
        // Numbers are: 1.5 / 1.25 = 0.5274773219409266
        // Result should be near 1.2 or 0.1110110000001111
        #0  IA = 16'b1001_0000_0000_0000;
    	#0  N = 16'b10100001011101000;
    	#0  D = 16'b10101111000101111;

        // Test 3
        // Numbers are: 1.2325816297378218 / 1.2992114720212904 = 0.9487151678396073
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11001101000110111;
        #0 N = 16'b10011101110001010;
        #0 D = 16'b10100110010011001;

/*
        // Test 4
        // Numbers are: 1.9743933069016655 / 1.5700704522079345 = 1.2575189247878311
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11100001011100100;
        #0 N = 16'b11111100101110001;
        #0 D = 16'b11001000111110000;


        // Test 5
        // Numbers are: 1.589691270022441 / 1.1718207692291827 = 1.3565993296638115
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11110110011111100;
        #0 N = 16'b11001011011110110;
        #0 D = 16'b10010101111111100;


        // Test 6
        // Numbers are: 1.3030424176394266 / 1.7266342101643897 = 0.7546719565549245
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11100110111010101;
        #0 N = 16'b10100110110010100;
        #0 D = 16'b11011101000000100;


        // Test 7
        // Numbers are: 1.3842607364780861 / 1.3016918320377324 = 1.0634319908968748
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11111001000000011;
        #0 N = 16'b10110001001011110;
        #0 D = 16'b10100110100111011;


        // Test 8
        // Numbers are: 1.2355902878107559 / 1.49201337760296 = 0.8281361992851776
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11101011101001001;
        #0 N = 16'b10011110001001111;
        #0 D = 16'b10111110111110100;


        // Test 9
        // Numbers are: 1.473045193785771 / 1.425121243210727 = 1.0336279813407832
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b10101010101001111;
        #0 N = 16'b10111100100011001;
        #0 D = 16'b10110110011010100;


        // Test 10
        // Numbers are: 1.8263234273274074 / 1.2588689112071405 = 1.4507653744313456
        // Result should be near 1.2 or 1001100110001

        #0 IA = 16'b11011101110100101;
        #0 N = 16'b11101001110001001;
        #0 D = 16'b10100001001000101;
*/

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
