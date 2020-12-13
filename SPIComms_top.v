module SPIComms_top (clk, sck, mosi, cs, selOut, seg);
	
	//Ports -- inputs & outputs
	input clk;
	input sck;
	input mosi;
	input cs;

	output [6:0] seg;
	output [3:0] selOut;
	wire [15:0] dataOut;
	wire [15:8] binary = dataOut[15:8];
	wire [7:0] binary2 = dataOut[7:0];
	wire rdy;
	wire [23:0] clk_out;
	wire [1:0] displaySel;
	wire [3:0] Y;
	wire [3:0] bcdA;
	wire [3:0] bcdB;
	wire [3:0] bcdC;
	wire [3:0] bcdD;
	
	//instantiating the ports with the modules
	clkDiv clkThread(.clk_in(clk), .clk_out(clk_out));
	SPI_Module SPIThread(.clk(clk), .sck(sck), .mosi(mosi), .cs(cs), .input_shiftreg(dataOut), .done(rdy));
	Bin2BCD bcdThread(.binary(binary), .thousands(bcdD), .hundreds(bcdC));
	Bin2BCD_2 bcd2Thread(.binary(binary2), .tens(bcdB), .ones(bcdA));
	rotateDisplay rotateThread(.clk(clk_out[10]), .cnt(displaySel), .selOut(selOut));
	mux4 muxThread(.A(bcdA), .B(bcdB), .C(bcdC), .D(bcdD), .Sel(displaySel), .Y(Y));
	BCD7Seg segThread(.bcd(Y), .seg(seg));
endmodule
