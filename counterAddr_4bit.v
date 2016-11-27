module counterAddr_4bit(ACount,sck,decA,rstA);

output reg [3:0] ACount;
input sck,rstA,decA;

initial begin
ACount <= 4'b1000;
end

always @(posedge sck)

begin
	if(rstA)
		begin
		ACount <= 4'b1000;
		end

	else
	begin
        if(ACount != 4'b0000 && decA) 
        begin  
        	if(!ACount)
        	begin
        		ACount <= 4'b1000;
        	end
		    ACount <= ACount - 1;
        end
    end
end
endmodule
