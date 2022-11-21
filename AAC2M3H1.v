////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//               Application Assignment Problem 5 Module 3 Course 2           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
//
// 
// @file AAC2M3H1.v
// @brief Application Assignment 2-007 4-bit full adder
// @version: 1.0 
// Date of current revision:  @date 2019-07-01  
// Target FPGA: [Intel Altera MAX10] 
// Tools used: [Quartus Prime 16.1 or Sigasi] for editing and/or synthesis 
//             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
//             [Quartus Prime 16.1]  for place and route if applied
//             
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of 4-bit adder with carry. The inputs are 2 
//               3-bit vectors A and B, and a scalar carry in Cin.  Outputs are
//               Sum and Cout.  
//
//  Hierarchy:  There is only one level in this simple design.
//        
//  Designed by:  @author [your name] 
//                [Organization]
//                [email] 
//
//      Copyright (c) 2019 by Tim Scherr
//
// Redistribution, modification or use of this software in source or binary
// forms is permitted as long as the files maintain this copyright. Users are
// permitted to modify this and use it to learn about the field of HDl code.
// Tim Scherr and the University of Colorado are not liable for any misuse
// of this material.
//////////////////////////////////////////////////////////////////////////////
// 
  	                                            		

module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B; 
    input Cin; 			
    output  [3:0] Sum;
    output  Cout;

//sequentially with one module
reg Cout0, Cout1, Cout2, Cout3;
reg Sout0, Sout1, Sout2, Sout3;

always @(A, B, Cin) begin

Sout0 = A[0] ^ B[0] ^ Cin;
Cout0 = (A[0] & B[0]) | (A[0] & Cin) | (B[0] & Cin);

Sout1 = A[1] ^ B[1] ^ Cout0;
Cout1 = (A[1] & B[1]) | (A[1] & Cout0) | (B[1] & Cout0);

Sout2 = A[2] ^ B[2] ^ Cout1;
Cout2 = (A[2] & B[2]) | (A[2] & Cout1) | (B[2] & Cout1);

Sout3 = A[3] ^ B[3] ^ Cout2;
Cout3 = (A[3] & B[3]) | (A[3] & Cout2) | (B[3] & Cout2);
end //end the always block.



assign Sum = {Sout3, Sout2, Sout1, Sout0};
assign Cout = Cout3;
endmodule // Majority  




    