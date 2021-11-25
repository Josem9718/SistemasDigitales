///// MIGUEL BENAVIDES JIMENEZ \\\\\

module Wrapper_fsm(

	input [1:0] SW,
	input [1:0] KEY,
	output [9:0] LEDR
	
);

fsm FSM(

	.s(LEDR[5]),
	.stout(LEDR[3:0]), 
	.w(SW[0]), 
	.clk(KEY[0]), 
	.rst_n(KEY[1])
);

endmodule 