module datapath(sck, sdi, rst, lA, dA);

input sdi, sck, rst, lA, dA;

wire [3:0] ACount, TXCount, RXCount;
wire decA, rstA, decRx, sdo;
wire [7:0] Aout, D, Q, dout, rxout, ParallelIn;
wire cin, LoadCBuf, cout, latchA, latchRx;
wire sigRE, command, sigWE ;
wire ss, decTx, rstRX, LoadTx, ShiftTx, rstTx, validA;
wire in1,in2,in3,in4,in5, validRx;

counter_5bit counter_5bit_Inst( .in1(in1),
								.in2(in2),
								.in3(in3),
								.in4(in4),
								.in5(in5),
								.sck(sck),
								.rst(rst));

controller controller_Inst( .decA(decA), 
							.rstA(rstA), 
							.latchA(latchA), 
							.validA(validA), 
							.loadCbuf(LoadCBuf), 
							.command(command), 
							.latchRx(latchRx), 
							.decRx(decRx), 
							.rstRx(rstRX), 
							.loadTx(LoadTx), 
							.decTx(decTx), 
							.shiftTx(ShiftTx), 
							.rstTx(rstTx),
							.ss(ss),
							.in1(in1),
							.in2(in2),
							.in3(in3),
							.in4(in4),
							.in5(in5),
							.rst(rst),
							.lA(lA),
							.dA(dA),
							.validRx(validRx),
							.cout(cout));

counterRX_4bit counterRX_4bit_Inst( .RXCount(RXCount),
									.sck(sck),
									.decRx(decRx),
									.rstRX(rstRX));

rxbuf rxbuf_Inst( .rxout(rxout), 
				  .sdi(sdi), 
				  .sck(sck), 
				  .latchrxdata(latchRx),
				  .RxCount(RXCount),
				  .validRx(validRx));

counterAddr_4bit counterAddr_4bit_Inst( .ACount(ACount),
									    .sck(sck),
									    .decA(decA),
									    .rstA(rstA));
addreg addreg_Inst( .Aout(Aout),
					.sdi(sdi), 
					.sck(sck), 
					.latchA(latchA),
					.validA(validA),
					.Acount(ACount));

dflipflop dflipflop_Inst( .Q(Q),
						  .D(Aout),
						  .sck(sck));

triStatebufLoadCommand triStatebufLoadCommand_Inst( .cin(cin),
													.sdi(sdi),
													.LoadCBuf(LoadCBuf));

commandBuf commandBuf_Inst( .cout(cout),  
							.sck(sck), 
							.cin(cin),
							.loadCBuf(LoadCBuf));

readWriteSig readWriteSig_Inst( .sigWE(sigWE), 
								.sigRE(sigRE), 
								.cout(cout),
								.command(command));

sram sram_Inst( .dout(dout), 
				.din(rxout), 
				.addr(Q), 
				.sck(sck), 
				.re(sigRE), 
				.we(sigWE), 
				.ss(ss));

counterTX_4bit counterTX_4bit_Inst( .TXCount(TXCount),
									.sck(sck),
									.decTx(decTx),
									.rstTX(rstTx));

TxBuf TxBuf_Inst( .sdo(sdo), 
				  .sck(sck), 
				  .ParallelIn(dout), 
				  .LoadTx(LoadTx), 
				  .ShiftTx(ShiftTx), 
				  .TxCount(TXCount));
endmodule