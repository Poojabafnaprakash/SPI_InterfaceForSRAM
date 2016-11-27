module counterTX_4bit(TXCount,sck,decTx,rstTX);

output reg [3:0] TXCount;
input sck,rstTX,decTx;



initial begin
TXCount <= 4'b1000;
end

always @(negedge sck)
begin
	if(rstTX)
		begin
		TXCount <= 4'b1000;
		end

	else
	begin
        if (TXCount != 4'b0000 && decTx) 
        begin  
		    TXCount <= TXCount - 1;
        end
    end
end
endmodule

