module triStatebufLoadCommand (cin,sdi,LoadCBuf);
output cin;
input sdi;
input LoadCBuf;
wire sdi,LoadCBuf;
wire cin;
	assign cin = (LoadCBuf) ? sdi : 1'bz;
endmodule