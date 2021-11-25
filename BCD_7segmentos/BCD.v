//=======================================================
// BCD -> 7-SEGMENT / MIGUEL BENAVIDES
//=======================================================

module BCD(SW,HEX0);

	//////////// SEG7 //////////
	output		     [6:0]		HEX0;
	//////////// SW //////////
	input 		     [3:0]		SW;

	
//=======================================================
//  Structural coding 
//======================================================= 

//allocation of reductions;
//D=SW[3], C=SW[2], B=SW[1], A=SW[0]
assign HEX0[0] = (~SW[3] & ~SW[2] & ~SW[1] & SW[0])|(SW[2] & ~SW[1] & ~SW[0]);
assign HEX0[1] = (SW[2] & ~SW[1] & SW[0])  |(SW[2] & SW[1] & ~SW[0]);
assign HEX0[2] = (~SW[2] & SW[1] & ~SW[0]);
assign HEX0[3] = (~SW[3] & ~SW[2] & ~SW[1] & SW[0]) | (SW[2] & ~SW[1] & ~SW[0]) | (SW[2] & SW[1] & SW[0]);
assign HEX0[4] = (SW[0]) | (SW[2] & ~SW[1]);
assign HEX0[5] = (SW[1] & SW[0]) | (~SW[2] & SW[1]) |(~SW[3] & ~SW[2] & SW[0]);
assign HEX0[6] = (~SW[3] & ~SW[2] & ~SW[1]) |(SW[2] & SW[1] & SW[0]);

endmodule
