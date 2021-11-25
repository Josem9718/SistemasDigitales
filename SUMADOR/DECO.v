module DECO(SW, HEX0, HEX1);

input[8:0] SW;
output [6:0] HEX0,HEX1;
wire c_i, c_o;
wire[3:0] a, b, sum, num1, num2;
wire[4:0] tsum;
reg [4:0] COM;
reg [1:0] DP;
assign a = SW[7:4];
assign b = SW[3:0];
assign c_i = SW[8];


ADDER adder0 (sum, c_o, a, b, c_i);

assign tsum = {c_o,sum};

always@(tsum, c_o)
  begin
  
	if(tsum > 29)
		begin 
			COM = 5'd30;
			DP = 2'd3;
		end	
	else if(tsum > 19) begin COM = 5'd20;DP = 2'd2; end	
	else if(tsum > 9) begin COM = 5'd10; DP =2'd1; end
	else begin COM=5'd0; DP=2'd0; end

//	case(tsum)
//	5'b00000 : begin SEG = 4'b0000; SEG2 = 4'b0000; end//0
//	5'b00001 : begin SEG = 4'b0001; SEG2 = 4'b0000; end//1
//	5'b00010 : begin SEG = 4'b0010; SEG2 = 4'b0000; end//2
//	5'b00011 : begin SEG = 4'b0011; SEG2 = 4'b0000; end//3
//	//5'b01000 : begin SEG = 4'b0000; SEG2 = 4'b1000; end//31
//	5'b11111 : begin SEG = 4'b0011; SEG2 = 4'b0001; end//31
//	default : SEG = 4'b0010;
//	endcase

end
assign num1 = tsum - COM;
assign num2 = DP;


BCDFA dis1 (num1,HEX0);
BCDFA dis2 (num2,HEX1);
endmodule


