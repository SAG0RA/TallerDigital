

module paramCalculator_tb;

	parameter N = 4;

	
	logic		[N-1 : 0]    Z, Y		;	// switches: [6, 9] => Z, [0, 3] => Y 
	
	logic		[1 : 0]    mode		;	// switches: 4 y 5 para elegir modo de operacion 
		
	logic		[1 : 0]	  btn_change;	// button KEY0
	
	logic    [6 : 0]    segA, segB, segD;
	
	logic    [N-1 : 0]    aritm_out;
	
	paramCalculator u0 (
		
		.Z				(Z),
		.Y				(Y),
		.mode			(mode),
		.btn_change	(btn_change),
		.segA			(segA),
		.segB			(segB),
		.segD			(segD),
		.aritm_out	(aritm_out)
		
		);
		
		initial begin
		
			// Probando ADD
		
			btn_change = 2'b11;
			mode		  = 2'b00;
			
			Z = 4'b0001;
			Y = 4'b0001;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando SUB
			
			btn_change = 2'b11;
			mode		  = 2'b01;
			
			Z = 4'b0001;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando MULT
			
			btn_change = 2'b11;
			mode		  = 2'b10;
			
			Z = 4'b0001;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando DIV
			
			btn_change = 2'b11;
			mode		  = 2'b11;
			
			Z = 4'b0001;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando MOD
			
			btn_change = 2'b10;
			mode		  = 2'b00;
			
			Z = 4'b0001;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando AND
			
			btn_change = 2'b10;
			mode		  = 2'b01;
			
			Z = 4'b0001;
			Y = 4'b0000;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando OR
			
			btn_change = 2'b10;
			mode		  = 2'b10;
			
			Z = 4'b0000;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando XOR
			
			btn_change = 2'b10;
			mode		  = 2'b11;
			
			Z = 4'b0000;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando SHIFT L
			
			btn_change = 2'b00;
			mode		  = 2'b10;
			
			Z = 4'b0000;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
			// Probando SHIFT R
			
			btn_change = 2'b00;
			mode		  = 2'b01;
			
			Z = 4'b0000;
			Y = 4'b0010;
			
			#50;
			
			Z = 4'b1000;
			Y = 4'b1000;
			
			#50;
			
			Z = 4'b0101;
			Y = 4'b0011;
			
			#50;
			
		
		end
		

endmodule