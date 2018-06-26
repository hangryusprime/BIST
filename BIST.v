`timescale 1ns / 1ps

module BIST(clk,rst,x,y,z,e,d,testmode);

input clk,rst,testmode;
input [7:0] x,y;
output [15:0] e;
output [7:0] d,z;
wire [7:0] a,b;

assign {b[7:0],a[7:0]} = (testmode == 1)? (e[15:0]) : ({y[7:0],x[7:0]});

LFSR I1(e, clk, rst);
rca_8bit I2(a,b,z);
MISR I3(z,d,clk,rst);

endmodule



