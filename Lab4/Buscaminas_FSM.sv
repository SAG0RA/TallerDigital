module Buscaminas_FSM (
    input clk,
    input reset,
    input [3:0] click_x,
    input [3:0] click_y,
    input [63:0] bombs,
    output [63:0] board_out,
    output logic win,
    output logic lose
);

    // Define states
    typedef enum logic [2:0] {
        IDLE,
        REVEAL,
        CHECK_WIN,
        CHECK_LOSE
    } state_t;

    // Define signals
    logic [63:0] board;
    state_t state, next_state;
    logic win_flag, lose_flag;

    // Sequential logic to update state and board
    always_ff @(posedge clk or negedge reset) begin
        if (~reset) begin
            board <= 64'h0000;
            state <= IDLE;
            win_flag <= 0;
            lose_flag <= 0;
        end else begin
            board <= board_out;
            state <= next_state;
            win_flag <= win;
            lose_flag <= lose;
        end
    end

    // State machine
    always_comb begin
        case (state)
            IDLE: begin
                board_out = board;
                if (click_x != 4'b1111 && click_y != 4'b1111) begin
                    next_state = REVEAL;
                end else begin
                    next_state = IDLE;
                end
            end

            REVEAL: begin

		// Lógica para revelar la celda en la que se hizo clic
                // implementar la lógica para revelar celdas según las coordenadas en las que se hace clic y verificar si hay bombas.
                // Actualiza board_out en consecuencia.


  
                // board_out[clicked_position] = bombs[clicked_position] ? '1 : '0;
                
                // Revisa si pierde o gana
                next_state = CHECK_WIN;
            end

            CHECK_WIN: begin
                if (win_flag) begin
                    next_state = IDLE;
                end else begin
                    next_state = CHECK_LOSE;
                end
            end

            CHECK_LOSE: begin
                if (lose_flag) begin
                    next_state = IDLE;
                end else begin
                    next_state = IDLE;
                end
            end
        endcase
    end
endmodule
