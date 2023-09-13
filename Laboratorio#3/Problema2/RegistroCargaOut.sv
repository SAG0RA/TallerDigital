module RegistroCargaOut
#(parameter N = 4)
(
clk, rst, segA_out, segA_m, segB_out, segB_m, segD_out, segD_m, aritm_out_out, aritm_out_m
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de salida
	output logic [6:0] segA_out;
	output logic [6:0] segB_out;
	output logic [6:0] segD_out;
	output logic [N-1:0] aritm_out_out;
	
	//Registros de entrada intermedios
	input [6:0] segA_m;
	input [6:0] segB_m;
	input [6:0] segD_m;
	input [N-1:0] aritm_out_m;
	
	always @ (posedge clk or posedge rst)
		if (rst) begin
			segA_out <= 0;
			segB_out <= 0;
			segD_out <= 0;
			aritm_out_out <= 0;
		end
		else begin
			segA_out = segA_m;
			segB_out = segB_m;
			segD_out = segD_m;
			aritm_out_out = aritm_out_m;
		end
	
endmodule
