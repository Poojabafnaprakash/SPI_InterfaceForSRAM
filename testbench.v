
module testBench;
reg sck;
reg sdi;
reg clk;
reg rst;
reg latchA, dA;
datapath datapath_Inst ( .sck(sck),
		  				 .sdi(sdi),
		  				 .rst(rst),
		  				 .lA(latchA),
		  				 .dA(dA));

initial begin
	$dumpfile("TestFixture.vcd");
	$dumpvars(9,testBench);

	sdi = 0;
	sck = 0;
	clk = 0;
	rst <= 1;
	latchA = 1;
	dA = 1;
end

always 
#1 clk = ~clk;

always 
#5 sck = ~sck;


initial
begin
rst <= 0;
latchA = 1;
dA = 1;
	@ (negedge sck);
	rst <= 0;
	latchA = 0;
	dA = 0;
	 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 0;
	#10 sdi <= 1;

	#10 sdi <= 1; 

	#10 sdi <= 1;
	#10 sdi <= 0;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 0;	
	#10 sdi <= 1;
	#10	dA <= 1;
		latchA <= 1; 
		rst <= 1;

	//reading data
	#10 rst <= 0; 

	#10	sdi <= 1; 
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 1;
	#10 sdi <= 0;
		latchA <= 0;
		dA <= 0;
	#10 sdi <= 1;

	#10 sdi <= 0; 

	#10 sdi <= 1'bz;
	#200 $finish;
end
endmodule


// module testBench;
// reg sck;
// reg sdi;
// reg clk;
// reg rst;
// reg latchA, dA;
// datapath datapath_Inst ( .sck(sck),
// 		  				 .sdi(sdi),
// 		  				 .rst(rst),
// 		  				 .lA(latchA),
// 		  				 .dA(dA));

// initial begin
// 	$dumpfile("TestFixture.vcd");
// 	$dumpvars(9,testBench);

// 	sdi = 0;
// 	sck = 0;
// 	clk = 0;
// 	rst <= 1;
// 	latchA = 1;
// 	dA = 1;
// end

// always 
// #1 clk = ~clk;

// always 
// #5 sck = ~sck;


// initial
// begin
// rst <= 0;
// latchA = 1;
// dA = 1;
// 	@ (negedge sck);
// 	rst <= 0;
// 	latchA = 0;
// 	dA = 0;
// 	 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 0;
// 	#10 sdi <= 1;

// 	#10 sdi <= 1; 

// 	#10 sdi <= 1;
// 	#10 sdi <= 0;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 0;	
// 	#10 sdi <= 1;
// 	#10	dA <= 1;
// 		latchA <= 1; 
// 		rst <= 1;

// 	//reading data
// 	#10 rst <= 0; 

// 	#10	sdi <= 1; 
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 1;
// 	#10 sdi <= 0;
// 		latchA <= 0;
// 		dA <= 0;
// 	#10 sdi <= 1;

// 	#10 sdi <= 0; 

// 	#10 sdi <= 1'bz;
// 	#200 $finish;
// end
// endmodule