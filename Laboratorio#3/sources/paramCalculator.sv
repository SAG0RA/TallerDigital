

module paramCalculator 
	(
	
	input		logic		[3 : 0]    Z, Y		,	// switches: [6, 9] => Z, [0, 3] => Y 
		
	input		logic				     btn_change,	// button KEY0
	
	output   logic    [6 : 0]    segA, segB,
		
	output   logic    [3 : 0]    out			
	
	);
	
	
	logic 	[3 : 0]	counter;
		
	
	always @* begin
	
		
		// Si el boton se presiona, cambia al siguiente modo de operacion.
		
		if (btn_change == 1b'1) begin	
	
			if (counter == 4b'1011) 
				counter = 4b'0000;
			
			else
				counter = counter + 1;
		end
		
		else begin
		
			case (counter)
				
				1	:	begin
							
							out = Z + Y;
						
						end
						
				default:	
					
					out = 0;
			
			endcase
			
		end

	end
	
	

endmodule