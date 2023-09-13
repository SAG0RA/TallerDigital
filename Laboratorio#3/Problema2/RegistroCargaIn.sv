//RegistroCargaIn
module RegistroCargaIn
#(parameter N = 4)
(
	clk, rst, Z_in, Y_in, mode_in, btn_change_in, Z_m, Y_m, mode_m, btn_change_m
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de entrada
	input logic [N-1:0] Z_in;
	input logic [N-1:0] Y_in;
	input logic [1:0] mode_in;
	input logic [1:0] btn_change_in;
	
	//Registros de salida intermedios
	output [N-1:0] Z_m;
	output [N-1:0] Y_m;
	output [1:0] mode_m;
	output [1:0] btn_change_m;
	
	always @ (posedge clk or posedge rst)
		if (rst) begin
			Z_m <= 0;
			Y_m <= 0;
			mode_m <= 0;
			btn_change_m <= 0;
		end
		else begin
			Z_m = Z_in;
			Y_m = Y_in;
			mode_m = mode_in;
			btn_change_m = btn_change_in;
		end
endmodule