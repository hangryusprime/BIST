`timescale 1ns / 1ps

module BISTtb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] x;
	reg [7:0] y;
	reg testmode;

	// Outputs
	wire [7:0] z;
	wire [15:0] e;
	wire [7:0] d;

	// Instantiate the Unit Under Test (UUT)
	BIST uut (
		.clk(clk), 
		.rst(rst), 
		.x(x), 
		.y(y), 
		.z(z), 
		.e(e), 
		.d(d), 
		.testmode(testmode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		x = 8'd159;
		y = 8'd76;
		testmode = 0;
		$monitor ("x=%d, y=%d, z=%d",e[7:0],e[15:8],z[7:0]);
	end
      
		always #5 clk = !clk;
		
		initial begin
		#10 rst =1'b0;
		testmode =1'b1;
		end
endmodule

