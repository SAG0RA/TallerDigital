

module paramCalculator 
	(
	
	input		logic		[3 : 0]    Z, Y		,	// switches: [6, 9] => Z, [0, 3] => Y 
	
	input		logic		[1 : 0]    mode		,	// switches: 4 y 5 para elegir modo de operacion 
		
	input		logic		[1 : 0]    btn_change,	// button KEY0
	
	output   logic    [6 : 0]    segA, segB,  // 7 segmentos
										  segC
	
		
	//output   logic    [1 : 0]    flag				// Resultado
	
	);
	
	logic    [7 : 0]    aritm_out;		// Resultado de operaciones aritmetricas
	
	logic    		     logic_out;		// Resultado de operaciones aritmetricas
	
	logic    [11 : 0]   bcd;				// BCD para despliegue en decimal
	
	logic 	[1 : 0]	  flag;
	
	// Modulo para convertir binario a BCD
	bin2bcd uut (
        .bin(aritm_out), 
        .bcd(bcd)
    );
	
			
	
	always_comb begin
	
		
		case ({btn_change, mode})
			
			{2'b11, 2'b00}	:	begin		// ADD
						
										aritm_out = Z + Y;
										
										end
			
			{2'b11, 2'b01}	:	begin		// SUB **
										
										if (Z >= Y)
											aritm_out = Z - Y;
										else
											begin
											aritm_out = Y - Z;
											//segD = 7'b0000001;
											//flag = 2'b00; 		// Caso Negativo: N 
											end
										end
			
			{2'b11, 2'b10}	:	begin		//MULT
						
										aritm_out = Z * Y;
										
										end
			
			{2'b11, 2'b11}	:	begin		//DIV **
						
										aritm_out = Z / Y;
										
										end	
									
			{2'b10, 2'b00}	:	begin		//MOD **
						
										aritm_out = Z % Y;
										
										end	
									
			{2'b10, 2'b01}	:	begin		//AND
						
										logic_out = Z & Y;
										
										end	
										
			{2'b10, 2'b10}	:	begin		//OR 
						
										logic_out = Z | Y;
										
										end
										
			{2'b10, 2'b11}	:	begin		//XOR
						
										logic_out = Z ^ Y;
										
										end
										
			{2'b00, 2'b10}	:	begin		//SHIFT L
						
										aritm_out = Z << Y;
										
										end
										
			{2'b00, 2'b01}	:	begin		//SHIFT R
						
										aritm_out = Z >> Y;
										
										end
			default:	
				
				aritm_out = 0;
		
		endcase
		
		
		case (bcd[3:0])
			4'b0000: segA = 7'b0000001; //0
			4'b0001: segA = 7'b1001111; //1
			4'b0010: segA = 7'b0010010; //2
			4'b0011: segA = 7'b0000110; //3
			4'b0100: segA = 7'b1001100; //4 
			4'b0101: segA = 7'b0100100; //5
			4'b0110: segA = 7'b0100000; //6
			4'b0111: segA = 7'b0001111; //7
			4'b1000: segA = 7'b0000000; //8
			4'b1001: segA = 7'b0000100; //9
			default: segA = 7'b1111111; // OFF
		 endcase

		case (bcd[7:4])
			4'b0000: segB = 7'b0000001; //0
			4'b0001: segB = 7'b1001111; //1
			4'b0010: segB = 7'b0010010; //2
			4'b0011: segB = 7'b0000110; //3
			4'b0100: segB = 7'b1001100; //4 
			4'b0101: segB = 7'b0100100; //5
			4'b0110: segB = 7'b0100000; //6
			4'b0111: segB = 7'b0001111; //7
			4'b1000: segB = 7'b0000000; //8
			4'b1001: segB = 7'b0000100; //9
			default: segB = 7'b1111111; // OFF
		endcase
		
		case (bcd[11:8])
			4'b0000: segC = 7'b0000001; //0
			4'b0001: segC = 7'b1001111; //1
			4'b0010: segC = 7'b0010010; //2
			4'b0011: segC = 7'b0000110; //3
			4'b0100: segC = 7'b1001100; //4 
			4'b0101: segC = 7'b0100100; //5
			4'b0110: segC = 7'b0100000; //6
			4'b0111: segC = 7'b0001111; //7
			4'b1000: segC = 7'b0000000; //8
			4'b1001: segC = 7'b0000100; //9
			default: segC = 7'b1111111; // OFF
		endcase
		
		/*case (flag)
			2'b00:	segD = 7'b0000001;	// (-)
			2'b01:	segD = 7'b0010010;   // Z
			2'b10:	segD = 7'b1000110;   // C
			2'b11:	segD = 7'b1000001;   // V
			default: segD = 7'b1111111; // OFF
		endcase
		*/
		
	end
	
	

endmodule