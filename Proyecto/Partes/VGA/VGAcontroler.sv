module VGAcontroler (
	input CLOCK_50,
	//input move,
//	input select,
	input logic 		  reset,
	input logic [5 : 0] bombs,
	
	
	
//	input up,
//   input down,
//   input left,
//   input right,
//	input [3:0] setMaxScore,
	
	output VGA_HS,
	output VGA_VS,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N
//	output finish,
//   output counting,
//   output finish_30sec
	);
	
	// indica al controlador del video que mostrar 
   logic 	[11:0] 	  block00, block01, block02, block03, block04, block05, block06, block07,
							  block10, block11, block12, block13, block14, block15, block16, block17,
							  block20, block21, block22, block23, block24, block25, block26, block27,
							  block30, block31, block32, block33, block34, block35, block36, block37,
							  block40, block41, block42, block43, block44, block45, block46, block47,
							  block50, block51, block52, block53, block54, block55, block56, block57,
							  block60, block61, block62, block63, block64, block65, block66, block67,
							  block70, block71, block72, block73, block74, block75, block76, block77;
//	logic [11:0] selected;
//	logic [11:0] outCont;
   wire [11:0] pos00, pos01, pos02, pos03, pos04, pos05, pos06, pos07,
					pos10, pos11, pos12, pos13, pos14, pos15, pos16, pos17,
					pos20, pos21, pos22, pos23, pos24, pos25, pos26, pos27,
					pos30, pos31, pos32, pos33, pos34, pos35, pos36, pos37,
					pos40, pos41, pos42, pos43, pos44, pos45, pos46, pos47,
					pos50, pos51, pos52, pos53, pos54, pos55, pos56, pos57,
					pos60, pos61, pos62, pos63, pos64, pos65, pos66, pos67,
					pos70, pos71, pos72, pos73, pos74, pos75, pos76, pos77
					;
	wire [11:0] board [7:0][7:0]; 
//	 
//   wire Px,Po;
//	wire[1:0]who;
	//contador cont(move,outCont);
	//selector sel (select,~reset,Px,Po);


		assign pos00 = board[0][0];
		assign pos01 = board[0][1];
		assign pos02 = board[0][2];
		assign pos03 = board[0][3];
		assign pos04 = board[0][4];
		assign pos05 = board[0][5];
		assign pos06 = board[0][6];
		assign pos07 = board[0][7];
		assign pos10 = board[1][0];
		assign pos11 = board[1][1];
		assign pos12 = board[1][2];
		assign pos13 = board[1][3];
		assign pos14 = board[1][4];
		assign pos15 = board[1][5];
		assign pos16 = board[1][6];
		assign pos17 = board[1][7];
		assign pos20 = board[2][0];
		assign pos21 = board[2][1];
		assign pos22 = board[2][2];
		assign pos23 = board[2][3];
		assign pos24 = board[2][4];
		assign pos25 = board[2][5];
		assign pos26 = board[2][6];
		assign pos27 = board[2][7];
		assign pos30 = board[3][0];
		assign pos31 = board[3][1];
		assign pos32 = board[3][2];
		assign pos33 = board[3][3];
		assign pos34 = board[3][4];
		assign pos35 = board[3][5];
		assign pos36 = board[3][6];
		assign pos37 = board[3][7];
		assign pos40 = board[4][0];
		assign pos41 = board[4][1];
		assign pos42 = board[4][2];
		assign pos43 = board[4][3];
		assign pos44 = board[4][4];
		assign pos45 = board[4][5];
		assign pos46 = board[4][6];
		assign pos47 = board[4][7];
		assign pos50 = board[5][0];
		assign pos51 = board[5][1];
		assign pos52 = board[5][2];
		assign pos53 = board[5][3];
		assign pos54 = board[5][4];
		assign pos55 = board[5][5];
		assign pos56 = board[5][6];
		assign pos57 = board[5][7];
		assign pos60 = board[6][0];
		assign pos61 = board[6][1];
		assign pos62 = board[6][2];
		assign pos63 = board[6][3];
		assign pos64 = board[6][4];
		assign pos65 = board[6][5];
		assign pos66 = board[6][6];
		assign pos67 = board[6][7];
		assign pos70 = board[7][0];
		assign pos71 = board[7][1];
		assign pos72 = board[7][2];
		assign pos73 = board[7][3];
		assign pos74 = board[7][4];
		assign pos75 = board[7][5];
		assign pos76 = board[7][6];
		assign pos77 = board[7][7];

	
	
	// ****************** MODIFY THIS VALUES BASED ON THE GAME LOGIC *******************
	// selector de imagenes: 00 or 11 = no sprite, 01 = sprite 1, 10 = sprite 2
	// Block 00
	assign block00 = pos00;
	assign block01 = pos01;
	assign block02 = pos02;
	assign block03 = pos03;
	assign block04 = pos04;
	assign block05 = pos05;
	assign block06 = pos06;
	assign block07 = pos07;
	assign block10 = pos10;
	assign block11 = pos11;
	assign block12 = pos12;
	assign block13 = pos13;
	assign block14 = pos14;
	assign block15 = pos15;
	assign block16 = pos16;
	assign block17 = pos17;
	assign block20 = pos20;
	assign block21 = pos21;
	assign block22 = pos22;
	assign block23 = pos23;
	assign block24 = pos24;
	assign block25 = pos25;
	assign block26 = pos26;
	assign block27 = pos27;
	assign block30 = pos30;
	assign block31 = pos31;
	assign block32 = pos32;
	assign block33 = pos33;
	assign block34 = pos34;
	assign block35 = pos35;
	assign block36 = pos36;
	assign block37 = pos37;
	assign block40 = pos40;
	assign block41 = pos41;
	assign block42 = pos42;
	assign block43 = pos43;
	assign block44 = pos44;
	assign block45 = pos45;
	assign block46 = pos46;
	assign block47 = pos47;
	assign block50 = pos50;
	assign block51 = pos51;
	assign block52 = pos52;
	assign block53 = pos53;
	assign block54 = pos54;
	assign block55 = pos55;
	assign block56 = pos56;
	assign block57 = pos57;
	assign block60 = pos60;
	assign block61 = pos61;
	assign block62 = pos62;
	assign block63 = pos63;
	assign block64 = pos64;
	assign block65 = pos65;
	assign block66 = pos66;
	assign block67 = pos67;
	assign block70 = pos70;
	assign block71 = pos71;
	assign block72 = pos72;
	assign block73 = pos73;
	assign block74 = pos74;
	assign block75 = pos75;
	assign block76 = pos76;
	assign block77 = pos77;
	
	
	
//	always@*
//	begin
//		if(who==2'b00)
//		selected <= outCont;
//		else
//		selected <= 4'b1111;
//	end
	
	// *******************************************************************************************
	
	
	
	video_controller VGA (
	CLOCK_50,
    block00,
	 block01,
    block02,
	 block03,
	 block04,
	 block05,
	 block06,
	 block07,
	 block10,
	 block11,
	 block12,
	 block13,
	 block14,
	 block15,
	 block16,
	 block17,
	 block20,
	 block21,
	 block22,
	 block23,
	 block24,
	 block25,
	 block26,
	 block27,
	 block30,
	 block31,
	 block32,
	 block33,
	 block34,
	 block35,
	 block36,
	 block37,
	 block40,
	 block41,
	 block42,
	 block43,
	 block44,
	 block45,
	 block46,
	 block47,
	 block50,
	 block51,
	 block52,
	 block53,
	 block54,
	 block55,
	 block56,
	 block57,
	 block60,
	 block61,
	 block62,
	 block63,
	 block64,
	 block65,
	 block66,
	 block67,
	 block70,
	 block71,
	 block72,
	 block73,
	 block74,
	 block75,
	 block76,
	 block77,
//	selected,
	VGA_HS,
	VGA_VS,
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_CLK,
	VGA_SYNC_N,
	VGA_BLANK_N);
	
endmodule

