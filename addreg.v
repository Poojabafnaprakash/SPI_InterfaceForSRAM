module addreg(Aout, sdi, sck, latchA, validA, Acount);
output[7:0] Aout;
input sdi, sck, latchA, validA;
input [3:0] Acount;

reg [7:0] finalRotateAddr;
initial begin
	finalRotateAddr = 8'b00000000;
end
always @(posedge sck)

begin
	if(latchA)
	begin  
		finalRotateAddr[Acount] = sdi;
	end
end

assign  Aout = (validA) ? finalRotateAddr : Aout;
	
endmodule