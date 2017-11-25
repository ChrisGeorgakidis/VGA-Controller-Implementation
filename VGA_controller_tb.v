module VGA_controller_tb();

reg clk, reset;
wire VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC;


VGA_controller DUT(
	.clk		(clk),
	.reset		(reset),
	.VGA_RED	(VGA_RED),
	.VGA_GREEN	(VGA_GREEN),
	.VGA_BLUE	(VGA_BLUE),
	.VGA_HSYNC	(VGA_HSYNC),
	.VGA_VSYNC	(VGA_VSYNC)
);

initial begin
	clk = 0;
	reset = 1;
	#100 reset = 0;
end

always begin
	#10 clk = ~clk;
end

endmodule
