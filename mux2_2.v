module mux2_2(A, B, Sel, Y);

input [1:0] A;
input [1:0] B;
input [1:0] Sel;
output [3:0] Y;

reg [3:0] Y;

always @ (Sel)
begin
case (Sel)

0: Y = A;
1: Y = B;

endcase
end
endmodule
