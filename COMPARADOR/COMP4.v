module COMP4(SW, LEDR);

   input [7:0]	SW;
 	output[1:0]	LEDR;
   wire[3:0] in1,in2;
	wire PMQ, pmq;
	
assign in1 = SW[7:4];
assign in2 = SW[3:0];

MagComp885 M1(pmq, PMQ, in1, in2);

assign LEDR[0] = pmq;
assign LEDR[1] = PMQ;
	
endmodule