module readWriteSig(sigWE, sigRE, cout,command);
output sigRE, sigWE;
input cout;
input command;
wire cout,command;
wire sigRE, sigWE;
	assign sigWE = (command) ? cout : 1'b0;
	assign sigRE = (command) ? ~cout : 1'b0;
endmodule