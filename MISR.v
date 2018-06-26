`timescale 1ns / 1ps

module MISR(z,d,clk,rst);
  
   input [7:0] z;
	input clk,rst;
	output [7:0] d; 
   wire [7:0] r;
	
  dff r1(.d(d[0]) , .q(r[0]) , .rst(rst), .clk(clk));
  dff r2(.d(d[1]) , .q(r[1]) , .rst(rst), .clk(clk));
  dff r3(.d(d[2]) , .q(r[2]) , .rst(rst), .clk(clk));
  dff r4(.d(d[3]) , .q(r[3]) , .rst(rst), .clk(clk));
  dff r5(.d(d[4]) , .q(r[4]) , .rst(rst), .clk(clk));
  dff r6(.d(d[5]) , .q(r[5]) , .rst(rst), .clk(clk));
  dff r7(.d(d[6]) , .q(r[6]) , .rst(rst), .clk(clk));
  dff r8(.d(d[7]) , .q(r[7]) , .rst(rst), .clk(clk));
  
  xor g1(d[0],z[0],r[7]);
  xor g2(d[1],z[1],r[0],r[7]);
  xor g3(d[2],z[2],r[1]);
  xor g4(d[3],z[3],r[2]);
  xor g5(d[4],z[4],r[3]);
  xor g6(d[5],z[5],r[4],r[7]);
  xor g7(d[6],z[6],r[5],r[7]);
  xor g8(d[7],z[7],r[6]);

endmodule