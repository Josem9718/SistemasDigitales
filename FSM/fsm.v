///// MIGUEL BENAVIDES JIMENEZ 
///// Finite-State Machine

module fsm(

	output reg s,
	output [3:0] stout,
	input w, clk, rst_n

);

	parameter A = 4'b0000,
	B = 4'b0001,
	C = 4'b0010,
	D = 4'b0011,
	E = 4'b0100,
	F = 4'b0101,
	G = 4'b0110,
	H = 4'b0111,
	I = 4'b1000;

	reg [3:0] state, next;
	
	assign stout = state;
	
always @(posedge clk or negedge rst_n)
	
	begin
	if (!rst_n) state <= A;
	else state <= next;
	end
	
always @(state or w) begin
	next = 4'bx;
	s = 1'b0;

case (state)
	A :if (!w) next = B;
		else next = F;
	B :if (w) next = F;
		else next = C;
	C :if (w) next = F;
		else next = D;
	D :if (w) next = F;
		else next = E;
	E :begin
		s = 1'b1; 
		if (w) next = F;
		else next = E;
		end
	F :if (w) next = G;
		else next = B;
	G :if (w) next = H;
		else next = B;
	H :if (w) next = I;
		else next = B;
	I :begin
		s = 1'b1;
		if (w) next = I;
		else next = B;
		end
	default next = A;
endcase

end
endmodule
