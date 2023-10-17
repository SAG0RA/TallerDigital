

module paramCalculator 

	# (parameter N = 4)	// Cantidad de bits de entrada y salida.
	
	(
	
	input		logic		[N-1 : 0]    Z, Y		,	// switches: [6, 9] => Z, [0, 3] => Y 
	
	input		logic		[1 : 0]    mode		,	// switches: 4 y 5 para elegir modo de operacion 
		
	input		logic		[1 : 0]    btn_change,	// button KEY0
	
	output   logic    [6 : 0]    segA, segB,  // 7 segmentos
										  segD
										  
	//output   logic    [N-1 : 0]  aritm_out  
			
	);
	
	logic    [N-1 : 0]    aritm_out;		// Resultado de operaciones aritmetricas
	
	logic    [N : 0]      temp_out;		// Variable temporal para verificar overflow
		
	logic    [7 : 0]  	 bcd;				// BCD para despliegue en decimal
	
	logic 		  	  		 flag_N, flag_Z, 
								 flag_C, flag_V;
								 
	logic    [N-1 : 0]    a1, b1;
	logic    [N   : 0]    p1;
	
	integer i;
	
	// Modulo para convertir binario a BCD
	bin2bcd uut (
        .bin(aritm_out), 
        .bcd(bcd)
    );
	
			
	
	always_comb begin
	
		aritm_out = 0;
		temp_out	= 0;
		flag_N = 0;
		flag_Z = 0;
		flag_C = 0;
		flag_V = 0;
		
		// Division variables
		a1 = Z;
      b1 = Y;
      p1= 0;
		i = 0;
	
		
		case ({btn_change, mode})
			
			{2'b11, 2'b00}	:	begin		// ADD
						
										temp_out = Z + Y;
										
										if (temp_out > 5'h0_F)
											begin
												aritm_out = 0;
												flag_C = 1;
											end
											
										else if (temp_out == 0)
											flag_Z = 1;
											
										else
											aritm_out = temp_out;
											
									 end
			
			{2'b11, 2'b01}	:	begin		// SUB 
										
										if (Z < Y)
											aritm_out = Z - Y;
											
										else if (Y == Z)
											flag_Z = 1;
										
										else if (Z > Y)
											begin
												aritm_out = Y - Z;
												flag_N = 1; 			// Caso Negativo: N 
											end
										end
			
			{2'b11, 2'b10}	:	begin		//MULT
						
										temp_out = Z * Y;
										
										if (temp_out > 5'h0_F)
											begin
												aritm_out = 0;
												flag_C = 1;
											end
											
										else if (Z == 0  || Y == 0)
											begin
												flag_Z = 1;
												aritm_out = 0;
											end
											
										else
											aritm_out = temp_out;
										
										
										end
			
			{2'b11, 2'b11}	:	begin		//DIV **
						
										
										if (Y == 0)
											begin
												flag_V = 1;
												aritm_out = 0;
											end
											
										else if (Z == 0)
											begin
												flag_Z = 1;
												aritm_out = 0;
											end

										else  
											begin
											for(i=0;i < N;i=i+1)    
												begin //start the for loop
													p1 = {p1[N-2:0],a1[N-1]};
													a1[N-1:1] = a1[N-2:0];
													p1 = p1-b1;
													if(p1[N-1] == 1)    
														begin
														 a1[0] = 0;
														 p1 = p1 + b1;   
														end
													else
														a1[0] = 1;
												end
											end
											aritm_out = a1;
										
										end	
									
			{2'b10, 2'b00}	:	begin		//MOD **
										
										if (Y == 0)
											begin
												flag_V = 1;
												aritm_out = 0;
											end
											
										else if (Z == 0)
											begin
												flag_Z = 1;
												aritm_out = 0;
											end

										else
										
											aritm_out = Z % Y;
										
										end	
									
			{2'b10, 2'b01}	:	begin		//AND true when both its operands are true or non-zero
						
										temp_out = Z & Y;
										
										if (aritm_out == 0)
											flag_Z = 1;
											
										
										end	
										
			{2'b10, 2'b10}	:	begin		//OR true when either of its operands are true or non-zero
										
										aritm_out = Z | Y;
										
										if (aritm_out == 0)
											flag_Z = 1;
											
										
										end
										
			{2'b10, 2'b11}	:	begin		//XOR
						
										aritm_out = Z ^ Y;
										
										if (aritm_out == 0)
											flag_Z = 1;
											
										
										end
										
			{2'b00, 2'b10}	:	begin		//SHIFT L
						
										aritm_out = Z << Y;
										
										if (aritm_out == 0)
											flag_Z = 1;
											
										
										end
										
			{2'b00, 2'b01}	:	begin		//SHIFT R
						
										aritm_out = Z >> Y;
										
										if (aritm_out == 0)
											flag_Z = 1;
											
										
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
		
		/*case (bcd[11:8])
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
		*/
		
		case ({flag_N, flag_Z, flag_C, flag_V})
			4'b1000:	begin
							segD = 7'b1111110;	// (-)
						end
			4'b0100:	begin
							segD = 7'b0010010;   // Z
						end
			4'b0010:	begin
							segD = 7'b1010101;   // C
						end
			4'b0001:	begin
							segD = 7'b1000001;   // V
						end
			default: 
						begin
							segD = 7'b1111111; // OFF
						end
		endcase
		
		
	end
	
	

endmodule