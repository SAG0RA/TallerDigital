module RegistroALU #(parameter N=16)
(
	clk, rst, Z_in, Y_in, mode_in, btn_change_in,
   segA_out, segB_out, segD_out, aritm_out_out
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de entrada
	input logic [N-1:0] Z_in;
	input logic [N-1:0] Y_in;
	input logic [1:0] mode_in;
	input logic [1:0] btn_change_in;
	
	//Registros de entrada intermedios
	logic [N-1:0] Z_m;
	logic [N-1:0] Y_m;
	logic [1:0] mode_m;	
	logic [1:0] btn_change_m;	
	
	//Registros de salida
	output logic [6:0] segA_out;
	output logic [6:0] segB_out;
	output logic [6:0] segD_out;
	output logic [N-1:0] aritm_out_out;
	
	//Registros de salida intermedios
	logic [6:0] segA_m;
	logic [6:0] segB_m;
	logic [6:0] segD_m;
	logic [6:0] aritm_out_m;
	
	//Registro In
	RegistroCargaIn #(.N(N)) registroIn(clk, rst, Z_in, Y_in, mode_in, btn_change_in, Z_m, Y_m, mode_m, btn_change_m);
	//ALU
	paramCalculator #(.N(N)) alu_m(.Z(Z_m),
							.Y(Y_m),
							.mode(mode_m),
							.btn_change(btn_change_m),
							.segA(segA_m),
							.segB(segB_m),
							.segD(segD_m),
							.aritm_out(aritm_out_m)
							);
	//Registro out
	RegistroCargaOut #(.N(N)) registroOut(clk, rst, segA_out, segA_m, segB_out, segB_m, segD_out, segD_m, aritm_out_out, aritm_out_m);
	
endmodule