

module paramCalculator_tb;

	
	logic		[3 : 0]    Z, Y		;	// switches: [6, 9] => Z, [0, 3] => Y 
	
	logic		[1 : 0]    mode		;	// switches: 4 y 5 para elegir modo de operacion 
		
	logic				     btn_change;	// button KEY0
	
	logic    [6 : 0]    segA, segB;
		
	logic    [3 : 0]    out			;

	
	paramCalculator u0 (
		
		.Z				(Z),
		.Y				(Y),
		.mode			(mode),
		.btn_change	(btn_change),
		.segA			(segA),
		.segB			(segB),
		.out			(out)
		
		);
		
		initial begin
		
			btn_change = 1'b0;
			mode		  = 2'b00;
			
			Z = 4'b0001;
			Y = 4'b0001;
			
		
		end
		

endmodule