`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 01:52:21 PM
// Design Name: 
// Module Name: addsub_tb
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


module addsub_tb;
wire [3:0] Sum ;
wire Cout ;
reg [3:0] A,B;
reg Cin ;
reg Sub ;

// Instantion 
fourbitaddsub utt1(.A(A),.B(B),.Cin(Cin),.S(Sum),.Cout(Cout),.Sub(Sub));

initial begin 
// Case 1: A = 10, B = 20, Add (with Cin = 1)
    Sub = 0; A = 4'd10; B = 4'd20; Cin = 1; #15;

    // Case 2: A = 10, B = 20, Add (Cin = 0)
    Cin = 0; #10;

    // Case 3: A = 15, B = 12, Subtract
    Sub = 1; A = 4'd15; B = 4'd12; Cin = 0; #10;

    // Case 4: A = 4, B = 14, Subtract → expect negative result
    A = 4'd4; B = 4'd14; Cin = 0; #10;

    // Case 5: A = 7, B = -3 (B = 4'b1101 = -3), Add
    Sub = 0; A = 4'd7; B = 4'b1101; Cin = 0; #10;

    // Case 6: A = -6, B = 5, Add
    A = 4'b1010; B = 4'd5; #10;

    // Case 7: A = -2, B = -3, Add
    A = 4'b1110; B = 4'b1101; #10;

    // Case 8: A = 3, B = 7, Subtract → 3 - 7 = -4
    Sub = 1; A = 4'd3; B = 4'd7; Cin = 0; #10;

    // Case 9: A = 0, B = 0, Add
    Sub = 0; A = 4'd0; B = 4'd0; Cin = 0; #10;

    // Case 10: A = 15, B = 15, Subtract → expect 0
    Sub = 1; A = 4'd15; B = 4'd15; #10;

    $finish;
end

initial begin
$monitor("A=%d | B=%d |Cin=%d | Sum=%d |Cout =%d | Sub=%b ",A,B,Cin,Sum,Cout,Sub);
end
endmodule

