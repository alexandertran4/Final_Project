module mux4(A,B, C, D, Sel, Y);

	input [3:0] A;
	input [3:0] B;
	input [3:0] C;
	input [3:0] D;
	input [1:0] Sel;
	output [3:0] Y;

	reg [3:0] Y;
	
	always @ (Sel)
	begin
		case (Sel)
		2'b00: Y = A; 
		2'b01: Y = B;
		2'b10: Y = C;
		2'b11: Y = D;
		endcase
	end

endmodule
