// MIGUEL BENAVIDES
// ADDER


module ADDER(fsum, fcarry, a, b, ci);
//input a,b;
input[3:0] a,b;
input ci;
output [3:0]fsum;
output [1:0]fcarry;
//output fsum;
//output fcarry;
wire ci2,ci3,ci4;

full_adder FA1(fsum[0], ci2, a[0], b[0], ci);
full_adder FA2(fsum[1], ci3, a[1], b[1], ci2);
full_adder FA3(fsum[2], ci4, a[2], b[2], ci3);
full_adder FA4(fsum[3], fcarry, a[3], b[3], ci4);

endmodule

//FULL ADDER
module full_adder(fsum, fcarry, a, b, ci);

input a, b, ci;
output fsum;
output [1:0]fcarry;
wire W1, W2, W3;

half_adder M1(W1, W2, a, b);
half_adder M2(fsum, W3, W1, ci);
or M3(fcarry, W2, W3);

endmodule
// HALF ADDER
module half_adder(hsum, hcarry, a, b);

input a, b;
output hsum, hcarry;

xor M1(hsum, a, b);
and M2(hcarry, a, b);

endmodule 