

module paramCalculator 
	(
	
	input		logic		[3 : 0]    Z, Y		,	// switches: [6, 9] => Z, [0, 3] => Y 
	
	input		logic		[1 : 0]    mode		,	// switches: 4 y 5 para elegir modo de operacion 
		
	input		logic				     btn_change,	// button KEY0
	
	output   logic    [6 : 0]    segA, segB,
		
	output   logic    [3 : 0]    out			
	
	);
	
			
	
	always_comb begin
	
		
		case ({btn_change, mode})
			
			{1'b0, 2'b00}	:	begin
						
										out = Z + Y;
										$display ("Resultado ADD: %b", out);
										
										end
					
			default:	
				
				out = 0;
		
		endcase
			

	end
	
	

endmodule