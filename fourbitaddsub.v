`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 01:40:47 PM
// Design Name: 
// Module Name: fourbitaddsub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fourbitaddsub(
input [3:0] A,B ,
output [3:0] S ,
input Cin ,Sub ,
output Cout 
    );
    wire [3:0] bx ;
    wire  cx ;
    wire [2:0] c ;
    assign bx= B^{4{Sub}};
    assign cx =Cin ^Sub ;
    // Instantiation 
    HA ut1(A[0],bx[0],cx,S[0],c[0]);
    HA ut2(A[1],bx[1],c[0],S[1],c[1]);
    HA ut3(A[2],bx[2],c[1],S[2],c[2]);
    HA ut4(A[3],bx[3],c[2],S[3],Cout);
   
endmodule

module HA(A,B,Cin,Sum,Cout);
input A,B,Cin ;
output Sum ,Cout ;
assign {Cout,Sum} = A+B+Cin ;
endmodule
