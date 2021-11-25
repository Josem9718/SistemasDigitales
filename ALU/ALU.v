////// ALU MIGUEL BENAVIDES ///////

module ALU	 // ARITHMETIC UNIT
	#(parameter WIDTH = 4)
	(output reg	[WIDTH -1: 0] 	y,
	input		[WIDTH -1: 0]	a, b,
	input					c_in,
	input		[WIDTH: 0]	select);
	//reg	[WIDTH -1: 0]	y);

always @ (*)
begin
y= 4'b0;
case ({select, c_in})
6'b00000_0:	y = a;
6'b00000_1:	y = a + 1'b1;
6'b00001_0:	y = a + b;
6'b00001_1:	y = a + b + 1'b1;
6'b00010_0:	y = a + ~b;
6'b00010_1:	y = a + (~b) + 1'b1;
6'b00011_0:	y = a - 1'b1;
6'b00011_1:	y = b;
6'b00100_0:	y = a & b;
6'b00101_0:	y = a | b;
6'b00110_0: y = a ^ b;
6'b00111_0:	y = ~a;
6'b01000_0:	y = a << 1;
6'b10000_0:	y = a >> 1;		
6'b11000_0:	y = 0;  
6'b11001_0:	y = ~b;  //25 nuevo caso NOT b
6'b11001_1:	y = a ^~ b;  //25 nuevo caso  XNOR       
default:		y = 4'b0;
endcase
end
endmodule
