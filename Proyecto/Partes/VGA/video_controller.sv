module video_controller (
    input logic clk,
	 input logic [11:0] block00, block01, block02, block03, block04, block05, block06, block07,
							  block10, block11, block12, block13, block14, block15, block16, block17,
							  block20, block21, block22, block23, block24, block25, block26, block27,
							  block30, block31, block32, block33, block34, block35, block36, block37,
							  block40, block41, block42, block43, block44, block45, block46, block47,
							  block50, block51, block52, block53, block54, block55, block56, block57,
							  block60, block61, block62, block63, block64, block65, block66, block67,
							  block70, block71, block72, block73, block74, block75, block76, block77,
	 input logic [5 : 0] bombs,
	 input logic reset,
//
//    input logic [3:0] selected,
    output logic h_synq,
    output logic v_synq,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
    output logic clk_25mhz,
    output logic sync_n,
    output logic blank_n
    );
	
	logic [23:0] pixel_data;
	// VGA variables de control 
	logic enable_v_counter;
	logic [15:0] h_count_value;
	logic [15:0] v_count_value;
	
	wire [11:0] board [7:0][7:0];

	 
    logic [7:0] white;
    logic [7:0] black;
    logic [7:0] gray;
    logic [7:0] bomb;
    logic [7:0] num1;
    logic [7:0] num2;
    logic [7:0] num3;
    logic [7:0] flag;
//    logic [15:0] address;
	
	// Clock divider
	clock_divider vga_clock_gen (clk, clk_25mhz);

	
	// Counters
	horizontal_counter vga_horizontal (clk_25mhz, enable_v_counter, h_count_value);
	vertical_counter vga_Vertical (clk_25mhz, enable_v_counter, v_count_value);
	
	// vertical y horizontal sync basados en los estandares C:\Users\1001001164\Documents\UNIVERSIDAD\Virtual\2023\LAB\LabFabian\Laboratorio4\Convertidordeimagenes
	assign h_synq = (h_count_value < 96) ? 1'b1:1'b0;
	assign v_synq = (v_count_value < 2) ? 1'b1:1'b0;
	

	// Colores
	assign white = 8'hFF;
	assign black = 8'h00;	
	assign gray  = 8'h80;	

	always @*
	begin		
			 if (h_count_value < 358 && h_count_value > 316 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block70)
						// Casilla seleccionada sin bomba - Azul
							12'b000000000010 :
							begin
								red = black;
								green = black;
								blue = white;
							end
						// Marca 1 - Morado
							12'b000000000100 :
							begin
								red = white;
								green = black;
								blue = white;
							end
							// Marca 2 - Amarillo
							12'b000000001000 :
							begin
								red = white;
								green = white;
								blue = black;
							end
							// Marca 3 - Verde
							12'b000000001000 :
							begin
								red = black;
								green = white;
								blue = black;
							end
							// Bomba - Rojo
							12'b000000000100 :
							begin
								red = white;
								green = black;
								blue = black;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = 8'h80;
						green = 8'h80;
						blue = 8'h80;
					end
					
			end
			
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block71)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = 8'h80;
						green = 8'h80;
						blue = 8'h80;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block72)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block73)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block74)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block75)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block76)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 220 && v_count_value > 178) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 215 && v_count_value >= 183) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block77)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block60)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block61)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block62)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block63)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block64)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block65)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block66)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 262 && v_count_value > 220) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 257 && v_count_value >= 225) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block67)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block50)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			

	
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block51)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = 8'h80;
						green = 8'h80;
						blue = 8'h80;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block52)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block53)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block54)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block55)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block56)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 304 && v_count_value > 262) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 299 && v_count_value >= 267) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block57)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			 
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block40)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
	
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block41)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block42)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block43)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block44)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block45)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block46)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 346 && v_count_value > 304) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 341 && v_count_value >= 309) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block47)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block30)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block31)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block32)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block33)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block34)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block35)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block36)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 388 && v_count_value > 346) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 383 && v_count_value >= 351) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block37)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			// Fila 2
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block20)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block21)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block22)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block23)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block24)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block25)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block26)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 430 && v_count_value > 388) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 425 && v_count_value >= 393) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block27)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			 else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block10)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block11)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block12)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block13)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block14)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block15)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end	
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block16)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 473 && v_count_value > 430) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 468 && v_count_value >= 435) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block17)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
				
			//	Fila 0
			else if (h_count_value < 358 && h_count_value > 316 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 353 && h_count_value >= 321 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block00)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end

			else if (h_count_value < 400 && h_count_value > 358 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 395 && h_count_value >= 363 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block01)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			else if (h_count_value < 442 && h_count_value > 400 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 437 && h_count_value >= 405 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block02)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			else if (h_count_value < 484 && h_count_value > 442 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 479 && h_count_value >= 447 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block03)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
						
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 526 && h_count_value > 484 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 521 && h_count_value >= 489 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block04)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
						
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 568 && h_count_value > 526 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 563 && h_count_value >= 531 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block05)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
						
				end 
				else begin
							red = gray;
							green = gray;
							blue = gray;
					end
					
			end
			
			else if (h_count_value < 610 && h_count_value > 568 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 605 && h_count_value >= 573 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block06)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h00;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
						
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
			else if (h_count_value < 652 && h_count_value > 610 && v_count_value < 515 && v_count_value > 473) begin
				if (h_count_value <= 647 && h_count_value >= 615 && v_count_value <= 510 && v_count_value >= 478) begin
						  // Resto 649 y divido entre 100 para obtener la posición de la imagen correspondiente
						  //address = (h_count_value - 653) + (v_count_value - 425 - 1) * 100;
						  case (block07)
						//2
							12'b000000000010 :
							begin
								red = 8'h0;
								green = 8'hFF;
								blue = 8'hFF;
							end
							//4
							12'b000000000100 :
							begin
								red = 8'hFF;
								green = 8'h0;
								blue = 8'hFF;
							end
							default :
								begin
									red = 8'h0;
									green = 8'hFF;
									blue = 8'hFF;
								end 

						endcase
						
				end 
				else
					begin
						red = gray;
						green = gray;
						blue = gray;
					end
					
			end
			
	end
	
		
	assign sync_n = 1'b0;
	assign blank_n = 1'b1;

	
endmodule
	