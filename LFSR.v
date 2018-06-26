`timescale 1ns / 1ps



module LFSR(e, clk, rst);

  output [15:0] e;
  input clk, rst;

  dff r16(.d(w3)   , .q(e[15]), .set(rst), .clk(clk));
  dff r15(.d(e[15]), .q(e[14]), .set(rst), .clk(clk));
  dff r14(.d(e[14]), .q(e[13]), .set(rst), .clk(clk));
  dff r13(.d(e[13]), .q(e[12]), .set(rst), .clk(clk));
  dff r12(.d(e[12]), .q(e[11]), .set(rst), .clk(clk));
  dff r11(.d(e[11]), .q(e[10]), .set(rst), .clk(clk));
  dff r10(.d(e[10]), .q(e[9]) , .set(rst), .clk(clk));
  dff r9 (.d(e[9]) , .q(e[8]) , .set(rst), .clk(clk));
  dff r8 (.d(e[8]) , .q(e[7]) , .set(rst), .clk(clk));
  dff r7 (.d(e[7]) , .q(e[6]) , .set(rst), .clk(clk));
  dff r6 (.d(e[6]) , .q(e[5]) , .set(rst), .clk(clk));
  dff r5 (.d(e[5]) , .q(e[4]) , .set(rst), .clk(clk));
  dff r4 (.d(e[4]) , .q(e[3]) , .set(rst), .clk(clk));
  dff r3 (.d(e[3]) , .q(e[2]) , .set(rst), .clk(clk));
  dff r2 (.d(e[2]) , .q(e[1]) , .set(rst), .clk(clk));
  dff r1 (.d(e[1]) , .q(e[0]) , .set(rst), .clk(clk));
  
  xor g2(w3,w2,e[5]);
  xor g3(w2,w1,e[3]);
  xor g4(w1,e[0],e[2]);

endmodule

module dff(d, clk, set, rst, q);

input clk, d, set, rst;
output q;
reg q;

always @ (posedge clk or posedge set or posedge rst)
	begin
		if (set)
		q <= 1'b1;
		else if (rst)
		q <= 1'b0;
		else
		q <= d;
	end
endmodule

module LFSR_tb();
	reg clk,rst;
	wire [15:0] e;
	integer pattern;

initial
begin
    pattern = 0;
    clk = 0;
	 rst = 0;	 
end

always
begin
    #5;
    clk = ~ clk;
end
 
always 
begin 
	#10;
	pattern = pattern + 1'b1;
	$display("pattern:%d e:%d at %0t",pattern,e,$time);
end

	LFSR DUT(e, clk, rst);
	
endmodule