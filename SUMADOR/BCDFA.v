// MIGUEL BENAVIDES
//BCD - 7SEG


module BCDFA(SW, DIS	);

	output[6:0]	DIS;
	input [3:0]	SW;

//allocation of reductions;
//D=SW[3], C=SW[2], B=SW[1], A=SW[0]
assign DIS[0] = (~SW[3] & ~SW[2] & ~SW[1] & SW[0])|(SW[2] & ~SW[1] & ~SW[0]);
assign DIS[1] = (SW[2] & ~SW[1] & SW[0])  |(SW[2] & SW[1] & ~SW[0]);
assign DIS[2] = (~SW[2] & SW[1] & ~SW[0]);
assign DIS[3] = (~SW[3] & ~SW[2] & ~SW[1] & SW[0]) | (SW[2] & ~SW[1] & ~SW[0]) | (SW[2] & SW[1] & SW[0]);
assign DIS[4] = (SW[0]) | (SW[2] & ~SW[1]);
assign DIS[5] = (SW[1] & SW[0]) | (~SW[2] & SW[1]) |(~SW[3] & ~SW[2] & SW[0]);
assign DIS[6] = (~SW[3] & ~SW[2] & ~SW[1]) |(SW[2] & SW[1] & SW[0]);


endmodule
