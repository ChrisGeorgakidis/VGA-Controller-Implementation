module clock_divider (clk, reset, newClock);

input clk, reset;
output newClock;

reg counterClock;
reg newClock;

always @ (posedge clk or posedge reset) begin
	if (reset == 1)
	begin
		newClock <= 0;
		counterClock <= 0;
	end
	else begin
		counterClock <= counterClock + 1'b1;
		if (counterClock == 1'b0) newClock <= ~newClock;
	end
end

endmodule
