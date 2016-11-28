module rxbuf(rxout, sdi, sck, latchrxdata, RxCount, validRx);
output[7:0] rxout;
input sdi, sck, latchrxdata, validRx;
input [3:0] RxCount;

reg [7:0] finalRotateRxData;

initial begin
	finalRotateRxData <= 8'b00000000;
end

always @(posedge sck)

begin
	if(latchrxdata)
	begin
		finalRotateRxData[RxCount-1] <= sdi;
	end	
end

assign  rxout = (validRx) ? finalRotateRxData : 8'bz;

endmodule
