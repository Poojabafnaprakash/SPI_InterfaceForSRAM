module counterRX_4bit(RXCount,sck,decRx,rstRX);

output reg [3:0] RXCount;
input sck,rstRX,decRx;

initial begin
RXCount <= 4'b1000;
end

always @(posedge sck)
begin
	if(rstRX)
		begin
			RXCount <= 4'b1000;
		end
	else
	begin
        if(RXCount != 4'b0000 && decRx) 
        begin  
        	if(!RXCount)
        	begin
        		RXCount <= 4'b1000;
        	end
		    RXCount <= RXCount - 1;
        end
    end
end
endmodule

