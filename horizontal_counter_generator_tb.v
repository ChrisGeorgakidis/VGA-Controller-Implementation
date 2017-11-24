module horizontal_counter_generator_tb ();

reg clk, reset;
wire [9:0]hor_cnt;
wire [7:0]scl_hor_cnt;
wire new_line;


horizontal_counter_generator DUT(
	.clk(clk),
	.reset(reset),
	.hor_cnt(hor_cnt),
	.scl_hor_cnt(scl_hor_cnt),
	.new_line(new_line)
);

initial begin
	clk = 0;
	reset = 1;
	#100 reset = 0;
end

always begin
	#20 clk = ~clk;
end

endmodule
