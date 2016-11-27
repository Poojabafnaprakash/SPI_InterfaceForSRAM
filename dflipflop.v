module dflipflop(Q,D,sck);
input [7:0] D;
input sck;

output reg [7:0] Q;

always @(posedge sck)
 Q = D;
endmodule





