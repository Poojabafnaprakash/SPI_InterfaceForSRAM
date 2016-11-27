module commandBuf (cout, sck, cin, loadCBuf);
output cout;
input cin; 
input sck, loadCBuf;

reg cout;

always @(posedge sck)
begin
	if(loadCBuf)
		cout = cin;
end
endmodule