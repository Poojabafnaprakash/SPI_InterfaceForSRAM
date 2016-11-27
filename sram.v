module sram(dout, din, addr, sck, re, we, ss);
output [7:0] dout;
input [7:0] addr;
input [7:0] din;
input re, we, ss, sck;

reg[7:0] sram [0:255];
reg[7:0] dout;
wire[7:0] din;
reg[1:0] read_write_state;
 
wire en;
assign en = ~ss;

integer k;
initial
begin
for (k = 0; k < 256 - 1; k = k + 1)
begin
    //sram[k] <= 8'b01110111;
    sram[k] <= 8'b00000000;

end
end

always@(posedge sck)
begin
	if(en)
	begin
		read_write_state = { we, re};
		case(read_write_state)
			2'b00 : dout = 8'bz;
			2'b01 : dout = sram[addr];
			2'b10 : sram[addr] = din; 
			2'b11 : $display("error");
			//default : dout = sram[addr];
		endcase
	end
end
endmodule