// Módulo controlador de VGA

module VGA_Controller (
    input logic CLK, RST,
    output logic VCLK, HSYNC, VSYNC, BLANK, 
    output logic [7:0] R, G, B
);

    // VGA timing parameters for 640x480 resolution
    localparam HD  = 640;
    localparam HFP = 16;
    localparam HSP = 96;
    localparam HBP = 48;

    localparam VD  = 480;
    localparam VFP = 10;
    localparam VSP = 2;
    localparam VBP = 33;

    logic clk25 = 0;
    int hPos = 0;
    int vPos = 0;
    logic hs = 0;
    logic vs = 0;
    logic de = 0;

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            hPos <= 0;
        end else begin
            if (hPos == (HD + HFP + HSP + HBP - 1)) begin
                hPos <= 0;
            end else begin
                hPos <= hPos + 1;
            end
        end
    end

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            vPos <= 0;
        end else begin
            if (hPos == (HD + HFP + HSP + HBP - 1)) begin
                if (vPos == (VD + VFP + VSP + VBP - 1)) begin
                    vPos <= 0;
                end else begin
                    vPos <= vPos + 1;
                end
            end
        end
    end

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            hs <= 0;
            HSYNC <= 0;
        end else begin
            if ((hPos >= (HD + HFP)) && (hPos < HD + HFP + HSP)) begin
                hs <= 0;
            end else begin
                hs <= 1;
            end
            HSYNC <= hs;
        end
    end

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            vs <= 0;
            VSYNC <= 0;
        end else begin
            if ((vPos >= (VD + VFP)) && (vPos < VD + VFP + VSP)) begin
                vs <= 0;
            end else begin
                vs <= 1;
            end
            VSYNC <= vs;
        end
    end

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            de <= 0;
            BLANK <= 0;
        end else begin
            if ((hPos < HD) && (vPos < VD)) begin
                de <= 1;
            end else begin
                de <= 0;
            end
            BLANK <= de;
        end
    end

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            R <= 8'b00000000;
            G <= 8'b00000000;
            B <= 8'b00000000;
        end else begin
            if (de) begin
                R <= 8'b11111111;
                G <= 8'b11111111;
                B <= 8'b11111111;
            end else begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b00000000;
            end
        end
    end

    // Clock divider
    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            clk25 <= 0;
        end else begin
            clk25 <= ~clk25;
        end
    end

    assign VCLK = clk25;
endmodule