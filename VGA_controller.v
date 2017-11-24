module VGA_controller (clk, reset, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);

input wire clk, reset;
output reg VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC;
reg red, green, blue;
//clock_divider
wire newClock;
//horizontal_counter_generator
wire [9:0]hor_cnt;
wire [7:0]scl_hor_cnt;
wire new_line;
//vertical_counter_generator
wire [8:0]ver_cnt;
wire [6:0]scl_ver_cnt;

clock_divider clock_divider(
	.clk(clk),
	.reset(reset),
  	.newClock(newClock)
);

horizontal_counter_generator horizontal_counter_generator(
  	.clk(newClock),
  	.reset(reset),
  	.hor_cnt(hor_cnt),
  	.scl_hor_cnt(scl_hor_cnt),
	.new_line(new_line),
  	.HSYNC(VGA_HSYNC)
);

vertical_counter_generator vertical_counter_generator(
	.clk(newClock),
	.reset(reset),
	.new_line(new_line),
	.ver_cnt(ver_cnt),
	.scl_ver_cnt(scl_ver_cnt),
	.VSYNC(VGA_VSYNC)
);

vram vram (
	.CLK(newClock),
	.SSR(reset),
	.ADDR(VRAM_address),
	.VGA_RED(red),
	.VGA_GREEN(green),
	.VGA_BLUE(blue)
);

assign VRAM_address = {scl_ver_cnt, scl_hor_cnt};

always @ (posedge newClock or posedge reset) begin
	if (reset == 1) begin
		VGA_RED <= 0;
		VGA_GREEN <= 0;
		VGA_BLUE <= 0;
	end
	else begin
		if (((hor_cnt >= 10'd144) && (hor_cnt <= 10'd784)) && ((ver_cnt >= 9'd35) && ver_cnt <= 9'd515)) begin
		VGA_RED <= red;
		VGA_GREEN <= green;
		VGA_BLUE <= blue;
		end
		else begin
		VGA_RED <= 0;
		VGA_GREEN <= 0;
		VGA_BLUE <= 0;
		end
	end
end

endmodule
