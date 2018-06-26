`timescale 1ns / 1ps
	
module fulladder(a,b,cin,s,cout);

	input a,b,cin;					
	output s,cout;					
	wire w1,w2,w3;
	
	xor g1(w1,a,b);				
	xor g2(s,w1,cin);				
	and g3(w2,cin,w1);				
	and g4(w3,b,a);				
	or  g5(cout,w2,w3);		

endmodule

module rca_8bit(a,b,z);

	input [7:0] a,b;						
	output [7:0] z;									
	wire [7:0] c;					

	fulladder FA1 (a[0],b[0],1'b0,z[0],c[0]);		
	fulladder FA2 (a[1],b[1],c[0],z[1],c[1]);
	fulladder FA3 (a[2],b[2],c[1],z[2],c[2]);
	fulladder FA4 (a[3],b[3],c[2],z[3],c[3]);
	fulladder FA5 (a[4],b[4],c[3],z[4],c[4]);
	fulladder FA6 (a[5],b[5],c[4],z[5],c[5]);
	fulladder FA7 (a[6],b[6],c[5],z[6],c[6]);
	fulladder FA8 (a[7],b[7],c[6],z[7],c[7]);
	
endmodule