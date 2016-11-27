module TxBuf(sdo, sck, ParallelIn, LoadTx, ShiftTx, TxCount);

output reg sdo;
input[7:0] ParallelIn;
input sck, LoadTx, ShiftTx;
input[3:0] TxCount;

integer i;
parameter s = 7;
reg [s:0]temp;
reg [s:0]tempR;

always@(negedge (sck)) 
begin
	if (LoadTx)
		begin
		temp <= ParallelIn;
		end
	else 
	begin
		for (i = s; i >= 0; i = i-1)
		tempR[s-i] = temp[i];
	end
		
		assign sdo = (ShiftTx)? tempR[TxCount-1] : 1'bz; 		
end



endmodule