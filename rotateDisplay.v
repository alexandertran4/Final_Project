module rotateDisplay (clk, cnt, selOut);

input clk;
output [1:0] cnt;
output [3:0] selOut;

reg [3:0] selOut;
reg [1:0] cnt = 2'b00;

always @ (posedge clk)
begin 
	cnt <= cnt + 1'b1;
end

//2-bit counter 
always @(cnt)
begin
	case (cnt)
	2'b00: selOut = 4'b1110; //select the right most digit to be on
	2'b01: selOut = 4'b1101; //select the second right most digit to be on
	2'b10: selOut = 4'b1011; //select the second left most digit to be on
	2'b11: selOut = 4'b0111; //select the left most digit to be on
	endcase 
end
endmodule
