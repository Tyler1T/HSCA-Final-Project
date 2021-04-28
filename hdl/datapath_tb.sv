module stimulus;

   reg [15:0]  D;
   reg [15:0]  N;
   reg 	      load_regN, load_regD;
   reg [1:0]  sel_ND_mux;
   reg        sel_K_mux;
   reg 	      clk;
   wire [15:0] result;

   integer     handle3;
   integer     desc3;

   datapath dut1 (clk, reset, kSelect, ndSelect, N, D, IA, result);

   initial
     begin
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("datapath.out");
	#100 $finish;
     end

   always
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b %h", sel_ND_mux,
		     sel_K_mux, result);
     end

   initial
     begin
	#0  D = 16'b0101_0000;  // 1.5
	#0  N = 16'b0101_0000;  // 1.25

	#0  load_regN <= 1'b0;
	#0  load_regD <= 1'b0;
	#0  sel_ND_mux <= 2'b0;
	#0  sel_K_mux <= 1'b0;

	//S1:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b10;
	#0  sel_muxb <= 2'b00;
	#5  load_regD <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;

	//S2:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b10;
	#0  sel_muxb <= 2'b00;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;

	//S3:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b10;
	#5  load_rega <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;

	//S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b11;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;

	 //S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b10;
	#5  load_rega <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;

	 //S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b11;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;

     end


endmodule // stimulus
