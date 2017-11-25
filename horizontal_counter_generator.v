module horizontal_counter_generator (clk, reset, hor_cnt, scl_hor_cnt, new_line, HSYNC);

input wire clk, reset;
output wire [6:0]scl_hor_cnt;
output wire [9:0]hor_cnt;
output reg new_line, HSYNC;

wire [2:0]int_cnt;
reg [2:0]next_int_cnt;
reg [6:0]next_scl_hor_cnt;
reg [9:0]next_hor_cnt;

assign int_cnt = next_int_cnt;
assign scl_hor_cnt = next_scl_hor_cnt;
assign hor_cnt = next_hor_cnt;

always @ (posedge clk or posedge reset) begin
	if (reset == 1) begin
		HSYNC <=1'b0;
	end
	else begin
		if (hor_cnt < 10'd95 || hor_cnt == 10'd799) begin
			HSYNC <= 1'b0;
		end
		else begin
			HSYNC <=1'b1;
		end
	end
end

always @ (posedge clk or posedge reset) begin
	if (reset == 1) begin
		new_line <=1'b0;
	end
	else begin
		if (hor_cnt == 10'd798) begin
			new_line <= 1'b1;
		end
		else begin
			new_line <=1'b0;
		end
	end
end

always @ (posedge clk or posedge reset) begin
	if (reset == 1) begin
		next_int_cnt <= 3'b000;
		next_scl_hor_cnt <= 6'b000000;
		next_hor_cnt <= 10'b0000000000;
	end
	else begin
		if (hor_cnt == 10'd799) begin
			next_int_cnt <= 3'b000;
			next_scl_hor_cnt <= 6'b000000;
			next_hor_cnt <= 10'b0000000000;
		end
		else begin
			next_hor_cnt <= hor_cnt + 1;
			if (int_cnt == 3'b100) begin    //if we reach a multiple of 5 pixel
				next_int_cnt <= 3'b000;
				if (hor_cnt > 10'd144 && hor_cnt < 10'd784)begin
					next_scl_hor_cnt <= scl_hor_cnt + 6'b000001;
				end
			end
			else begin
				next_int_cnt <= int_cnt + 1;
			end
		end
	end
end

endmodule
