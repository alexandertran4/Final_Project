module Bin2BCD(binary, thousands, hundreds);

input [7:0] binary;
output [3:0] thousands;
output [3:0] hundreds;

reg [3:0] thousands;
reg [3:0] hundreds;

integer i;

always @ (binary)

begin
	//set 1000's and 100's to 0
	thousands = 0;
	hundreds = 0;

for (i= 7; i>=0; i=i-1)
	begin
		//add 3 to columns >= 5
		if (thousands >= 5)
		thousands = thousands + 3;
		if (hundreds >= 5)
		hundreds = hundreds + 3;

		//shift left one
		thousands = thousands << 1;
		thousands[0] = hundreds[3];
		hundreds = hundreds << 1;
		hundreds[0] = binary[i];
   end
end

endmodule
