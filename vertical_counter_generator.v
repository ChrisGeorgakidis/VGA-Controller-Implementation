module vertical_counter_generator (clk, reset, new_line, ver_cnt, scl_ver_cnt, VSYNC);

input wire clk, reset, new_line;
output wire [6:0]scl_ver_cnt;
output wire [9:0]ver_cnt;
output reg VSYNC;

wire [2:0]scale_cnt;
wire [18:0]clock_cnt;
reg [2:0]next_scale_cnt;
reg [6:0]next_scl_ver_cnt;
reg [9:0]next_ver_cnt;
reg [18:0]next_clock_cnt;

assign scale_cnt = next_scale_cnt;
assign scl_ver_cnt = next_scl_ver_cnt;
assign ver_cnt = next_ver_cnt;
assign clock_cnt = next_clock_cnt;

// always @ (posedge clk) begin
// 	if (reset == 1'b1) begin
//     	VSYNC <=1'b0;
//   	end
//   	else begin
//     	if ((ver_cnt < 10'd2) || ((ver_cnt == 10'd524) && (new_line == 1'b1))) begin // possibly missing a cc
//       		VSYNC <= 1'b0;
//     	end
//    		else begin
//       		VSYNC <=1'b1;
//     	end
//   	end
// end

always @ ( posedge clk or posedge reset ) begin
  	if (reset == 1'b1) begin
    	next_scale_cnt <= 3'b000;
    	next_scl_ver_cnt <= 7'b000000;
    	next_ver_cnt <= 10'b0000000000;
		VSYNC <=1'b0;
  	end
  	else begin
    	if (new_line == 1'b1) begin
      		if (ver_cnt == 10'd520) begin		//end of frame | begin from start
        		next_scale_cnt <= 3'b000;
        		next_scl_ver_cnt <= 7'b000000;
        		next_ver_cnt <= 10'b0000000000;
				VSYNC <= 1'b0;
      		end
			else begin							//continue with the rest of the image
				if (ver_cnt < 10'd1) begin		// VSYNC Pulse Width (P)
					VSYNC <= 1'b0;
				end
				else begin
					VSYNC <= 1'b1;				//Back Porch (Q)
				end

				next_ver_cnt <= ver_cnt + 10'b0000000001;
				if (ver_cnt >= 10'd31 && ver_cnt < 10'd511) begin		//at Display - Active Video Time (R)
					if (scale_cnt == 3'b100) begin	//multiple of 5 pixels
						next_scale_cnt <= 3'b000;
						next_scl_ver_cnt   <= scl_ver_cnt + 7'b0000001;
					end else begin
					  	next_scale_cnt <= scale_cnt + 3'b001;
					end
				end
      		end
		end
      	
    end
end

//clock counter
always @ (posedge clk or posedge reset) begin
	if (reset == 1'b1) begin
		next_clock_cnt <= 19'b0000000000000000000;
	end else begin
		if (clock_cnt == 19'd416799) begin
		  next_clock_cnt <= 19'b0000000000000000000;
		end
		next_clock_cnt <= clock_cnt + 19'b0000000000000000001;
	end
end

// //vertical counter ~ counter for the rows
// always @ (posedge clk or posedge reset) begin
// 	if (reset == 1'b1) begin
// 		next_ver_cnt <= 10'b0000000000;
// 	end else begin
// 	  	if (new_line == 1'b1) begin
// 		  	if (ver_cnt == 10'd524 && clock_cnt == 19'd416799) begin	//start from the beginning 
// 				next_ver_cnt <= 10'b0000000000;
// 			end else begin
// 				next_ver_cnt <= ver_cnt + 10'b0000000001;
// 			end
// 		end
// 	end
// end

// //scaled down vertical counter -> part of the VRAM address
// always @ (posedge clk or posedge reset) begin
// 	if (reset == 1'b1) begin
// 		next_scale_cnt <= 3'b000;
// 		next_scl_ver_cnt <= 7'b0000000;
// 	end else begin
// 		if (new_line == 1'b1) begin
// 			if (ver_cnt == 10'd524 && clock_cnt == 19'd416798) begin	//start from the beginning
// 			 	next_scale_cnt <= 3'b000;
// 			  	next_scl_ver_cnt <= 7'b0000000;
// 			end else begin
// 				if (scale_cnt == 3'b000) begin	//reach the scale limit
// 					next_scale_cnt <= 3'b000;
// 					if (ver_cnt > 10'd35 && ver_cnt < 10'd515) begin		//at Active Video Time
// 						next_scl_ver_cnt <= scale_cnt + 7'b0000001;
// 					end
// 				end else begin
// 					next_scale_cnt <= scale_cnt + 3'b001;
// 				end
// 			end
// 		end
// 	end
// end

// //VSYNC -> used for vertical synchronisation of the image
// always @ (posedge clk or posedge reset) begin
// 	if (reset == 1'b1) begin
// 		VSYNC <= 1'b0;
// 	end else begin
// 		if (clock_cnt < 19'd1600) begin
// 			VSYNC <= 1'b1;
// 		end
// 	end
// end


endmodule
