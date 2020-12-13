module clkDiv(clk_in, clk_out);

	input clk_in;
	output [23:0] clk_out;
	reg [23:0] clk_out = 23'd0;

	always @(posedge clk_in)
		begin 
			clk_out <= clk_out + 23'd1; //add 1 to each output clock cycle
		end

endmodule
