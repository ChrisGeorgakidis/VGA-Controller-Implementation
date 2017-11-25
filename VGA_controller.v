module VGA_controller (clk, reset, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);

input wire clk, reset;
output wire VGA_RED, VGA_GREEN, VGA_BLUE;
output wire VGA_HSYNC, VGA_VSYNC;

wire red, green, blue;
//clock_divider
wire newClock;
//horizontal_counter_generator
wire [9:0]hor_cnt;
wire [6:0]scl_hor_cnt;
wire new_line;
//vertical_counter_generator
wire [9:0]ver_cnt;
wire [6:0]scl_ver_cnt;
//VRAM
wire [13:0]VRAM_address;

assign VRAM_address = {scl_ver_cnt, scl_hor_cnt};

ClockDivider ClockDivider(
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

RGB RGB (
	.clk(newClock),
	.reset(reset),
	.hor_cnt(hor_cnt),
	.ver_cnt(ver_cnt),
	.red(red),
	.green(green),
	.blue(blue),
	.VGA_RED(VGA_RED),
	.VGA_GREEN(VGA_GREEN),
	.VGA_BLUE(VGA_BLUE)
);

endmodule
