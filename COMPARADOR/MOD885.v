module MagComp885 (PmQout, PMQout, P, Q);
  input [3:0] 	P,Q;
  output 		PmQout, PMQout;
  //reg 		   PmQout, PMQout; //Para el always

  assign {PMQout, PmQout} = ( P== Q )? 2'b11 : ( P>Q )? 2'b10 : ( P<Q )? 2'b01 : 2'b00;
    
//  always@(*)
//begin
//	{PMQout, PmQout} = 2'b00; //Inicializacion por default
//	
//	if(P==Q) 
//	{PMQout, PmQout} = 2'b11;
//	else
//	if(P>Q)
//	{PMQout, PmQout} = 2'b10;
//	else
//	if(P<Q)
//		{PMQout, PmQout} = 2'b01;
//		// observe en el RTL viewer como se construyen latches sin estas dos siguientes lineas
//	else     
//		{PMQout, PmQout} = 2'b00;
//end

endmodule 