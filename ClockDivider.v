module ClockDivider (clk, reset, newClock);

input wire clk, reset;
output reg newClock;

reg counterClock;

always @ (posedge clk or posedge reset) begin
	if (reset == 1'b1)
	begin
		newClock <= 1'b0;
		counterClock <= 1'b0;
	end
	else begin
		counterClock <= counterClock + 1'b1;
		if (counterClock == 1'b0)
		begin
			newClock <= ~newClock;
		end
	end
end

endmodule
