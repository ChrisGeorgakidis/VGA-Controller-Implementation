module RGB (clk, reset, hor_cnt, ver_cnt, red, green, blue, VGA_RED, VGA_GREEN, VGA_BLUE);

input wire clk, reset;
input wire [9:0]hor_cnt;
input wire [9:0]ver_cnt;
input wire red, green, blue;
output reg VGA_RED, VGA_GREEN, VGA_BLUE; 

always @ (posedge clk or posedge reset) begin
	if (reset == 1'b1) begin
		VGA_RED <= 1'b0;
		VGA_GREEN <= 1'b0;
		VGA_BLUE <= 1'b0;
	end
	else begin
		if (((hor_cnt >= 10'd144) && (hor_cnt <= 10'd784)) && ((ver_cnt >= 10'd35) && (ver_cnt <= 10'd515))) begin
          VGA_RED <= red;
		    VGA_GREEN <= green;
		    VGA_BLUE <= blue;
		end
		else begin
		    VGA_RED <= 1'b0;
		    VGA_GREEN <= 1'b0;
		    VGA_BLUE <= 1'b0;
		end
	end
end

endmodule  