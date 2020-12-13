module SPI_Module(clk, sck, mosi, cs, input_shiftreg, done);

	input clk; //system clock
	input sck; //SPI slave clock
	input mosi; //Data input
	input cs; //Chip select
	
	output [15:0] input_shiftreg; //Shift register containing data
	output done; //Transaction complete
	
	reg [2:0] sck_record; //store 3 previous states of SCK
	always @(posedge clk)
	sck_record <= { sck_record[1:0], sck};

	reg [2:0] cs_record; //store 3 previous states of CS
	always @(posedge clk)
	cs_record <= { cs_record[1:0], cs};
	
	reg current_state;
	reg [3:0] bitcounter;
	reg [15:0] input_shiftreg;
	
	//	Sample mosi at each sclk rising edge
	// and Handle start/stop of messages
	always @(posedge clk) begin
		if (cs_record[2:1] == 2'b01) begin //rising edge (end)
			current_state <= 0; //stop listening
			bitcounter <=0;
		end else if (cs_record[2:1] == 2'b10) begin	//falling edge (start)
			bitcounter <= 0; //reset bit counter
			current_state <= 1; //start listening
		end else if (current_state == 1'b1 && sck_record[2:1] == 2'b01) begin
			input_shiftreg = input_shiftreg << 1;
			input_shiftreg[0] = mosi;
			bitcounter <= bitcounter + 1;
			
			if (bitcounter == 16) //16 bits
				current_state <= 0;
		end else begin
			input_shiftreg <= input_shiftreg;
		end
	end
	
	wire done = (bitcounter == 16);
endmodule



