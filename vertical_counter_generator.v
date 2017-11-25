module vertical_counter_generator (clk, reset, new_line, ver_cnt, scl_ver_cnt, VSYNC);

input wire clk, reset, new_line;
output wire [6:0]scl_ver_cnt;
output wire [9:0]ver_cnt;
output reg VSYNC;

wire [2:0]int_cnt;
reg [2:0]next_int_cnt;
reg [6:0]next_scl_ver_cnt;
reg [9:0]next_ver_cnt;

assign int_cnt = next_int_cnt;
assign scl_ver_cnt = next_scl_ver_cnt;
assign ver_cnt = next_ver_cnt;

always @ (posedge clk) begin
	if (reset == 1'b1) begin
    	VSYNC <=1'b0;
  	end
  	else begin
    	if ((ver_cnt < 10'd2) || ((ver_cnt == 10'd524) && (new_line == 1'b1))) begin // possibly missing a cc
      		VSYNC <= 1'b0;
    	end
   		else begin
      		VSYNC <=1'b1;
    	end
  	end
end

always @ ( posedge clk or posedge reset ) begin
  	if (reset == 1'b1) begin
    	next_int_cnt <= 3'b000;
    	next_scl_ver_cnt <= 6'b000000;
    	next_ver_cnt <= 10'b0000000000;
  	end
  	else begin
    	if (new_line == 1'b1) begin
      		if (ver_cnt == 10'd524) begin
        		next_int_cnt <= 3'b000;
        		next_scl_ver_cnt <= 6'b000000;
        		next_ver_cnt <= 10'b0000000000;
      		end
		end
      	else begin
        	next_ver_cnt <= ver_cnt + 10'b0000000001;
        	if (int_cnt == 3'b100) begin
         		next_int_cnt <= 3'b000;
          		if (ver_cnt > 10'd35 && ver_cnt < 10'd515) begin
            		next_scl_ver_cnt <= scl_ver_cnt + 6'b000001;
          		end
        	end
        	else begin
          		next_int_cnt <= int_cnt + 1;
        	end
      	end
    end
end

endmodule
