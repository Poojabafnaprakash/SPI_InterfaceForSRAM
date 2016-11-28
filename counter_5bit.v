module counter_5bit(in1,in2,in3,in4,in5,sck, rst);

reg [4:0] out;
output reg in1,in2,in3,in4,in5;
input sck, rst;

always @(posedge sck)
begin
	if(rst)
		begin
		out <= 5'b00000;
		in1=0;in2=0;in3=0;in4=0;in5=0;

		end

	else
	begin
	case(out)
		5'b00001 : begin in1=0;in2=0;in3=0;in4=0;in5=1; end
		5'b00010 : begin in1=0;in2=0;in3=0;in4=1;in5=0; end
		5'b00011 : begin in1=0;in2=0;in3=0;in4=1;in5=1; end
		5'b00100 : begin in1=0;in2=0;in3=1;in4=0;in5=0; end
		5'b00101 : begin in1=0;in2=0;in3=1;in4=0;in5=1; end
		5'b00110 : begin in1=0;in2=0;in3=1;in4=1;in5=0; end
		5'b00111 : begin in1=0;in2=0;in3=1;in4=1;in5=1; end
		5'b01000 : begin in1=0;in2=1;in3=0;in4=0;in5=0; end
		5'b01001 : begin in1=0;in2=1;in3=0;in4=0;in5=1; end
		5'b01010 : begin in1=0;in2=1;in3=0;in4=1;in5=0; end
		5'b01011 : begin in1=0;in2=1;in3=0;in4=1;in5=1; end
		5'b01100 : begin in1=0;in2=1;in3=1;in4=0;in5=0; end
		5'b01101 : begin in1=0;in2=1;in3=1;in4=0;in5=1; end
		5'b01110 : begin in1=0;in2=1;in3=1;in4=1;in5=0; end
		5'b01111 : begin in1=0;in2=1;in3=1;in4=1;in5=1; end
		5'b10000 : begin in1=1;in2=0;in3=0;in4=0;in5=0; end
		5'b10001 : begin in1=1;in2=0;in3=0;in4=0;in5=1; end
		5'b10010 : begin in1=1;in2=0;in3=0;in4=1;in5=0; end
		5'b10011 : begin in1=1;in2=0;in3=0;in4=1;in5=1; end

		5'b10100 : begin in1=1;in2=0;in3=1;in4=0;in5=0; end	//20
		5'b10101 : begin in1=1;in2=0;in3=1;in4=0;in5=1; end
		5'b10110 : begin in1=1;in2=0;in3=1;in4=1;in5=0; end	
		5'b10111 : begin in1=1;in2=0;in3=1;in4=1;in5=1; end
		5'b11000 : begin in1=1;in2=1;in3=0;in4=0;in5=0; end
		5'b11001 : begin in1=1;in2=1;in3=0;in4=0;in5=1; end
		5'b11010 : begin in1=1;in2=1;in3=0;in4=1;in5=0; end
		5'b11011 : begin in1=1;in2=1;in3=0;in4=1;in5=1; end
		5'b11100 : begin in1=1;in2=1;in3=1;in4=0;in5=0; end
		5'b11101 : begin in1=1;in2=1;in3=1;in4=0;in5=1; end
		5'b11110 : begin in1=1;in2=1;in3=1;in4=1;in5=0; end
		5'b11111 : begin in1=1;in2=1;in3=1;in4=1;in5=1; end
		default: begin in1=0;in2=0;in3=0;in4=0;in5=1; out = 5'b00001; end
	endcase
	out = out + 1;
	end
end

endmodule
