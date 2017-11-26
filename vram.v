module vram (CLK, SSR, ADDR, VGA_RED, VGA_GREEN, VGA_BLUE);

input wire CLK, SSR;
input wire [13:0]ADDR;
output VGA_RED, VGA_GREEN, VGA_BLUE;

// RAMB16_S1: 16kx1 Single-Port RAM
//            Spartan-3E
// Xilinx HDL Language Template, version 14.7

RAMB16_S1 #(
   	.INIT(1'b0),  // Value of output RAM registers at startup
   	.SRVAL(1'b0), // Output value upon SSR assertion
   	.WRITE_MODE("WRITE_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

   	// The forllowing INIT_xx declarations specify the initial contents of the RAM
   	// Address 0 to 4095
   	.INIT_00({128'h11111111111111111111111111111111,	//row1 	- red
	   		  128'h11111111111111111111111111111111}),	//row2 	- red
   	.INIT_01({128'h00000000000000000000000000000000,	//row3 	- white
	   		  128'h00000000000000000000000000000000}),	//row4 	- white
   	.INIT_02({128'h11111111111111111111111111111111,	//row5 	- red
	    	  128'h11111111111111111111111111111111}),	//row6	- red
   	.INIT_03({128'h00000000000000000000000000000000,	//row7	- white
	    	  128'h00000000000000000000000000000000}),	//row8	- white
   	.INIT_04({128'h11111111111111111111111111111111,	//row9	- red
	    	  128'h11111111111111111111111111111111}),	//row10 - red
   	.INIT_05({128'h00000000000000000000000000000000,	//row11 - white
	    	  128'h00000000000000000000000000000000}),	//row12 - white
   	.INIT_06({128'h11111111111111111111111111111111,	//row13 - red
	    	  128'h11111111111111111111111111111111}),	//row14 - red
   	.INIT_07({128'h00000000000000000000000000000000,	//row15 - white
	    	  128'h00000000000000000000000000000000}),	//row16 - white
   	.INIT_08({128'h11111111111111111111111111111111,	//row17 - red
	    	  128'h11111111111111111111111111111111}),	//row18 - red
   	.INIT_09({128'h00000000000000000000000000000000,	//row19 - white
	    	  128'h00000000000000000000000000000000}),	//row20 - white
   	.INIT_0A({128'h11111111111111111111111111111111,	//row21 - red
	    	  128'h11111111111111111111111111111111}),	//row22 - red
   	.INIT_0B({128'h00000000000000000000000000000000,	//row23 - white
	    	  128'h00000000000000000000000000000000}),	//row24 - white
   	.INIT_0C({128'h11111111111111111111111111111111,	//row25 - red
	    	  128'h11111111111111111111111111111111}),	//row26 - red
   	.INIT_0D({128'h00000000000000000000000000000000,	//row27 - white
	    	  128'h00000000000000000000000000000000}),	//row28 - white
   	.INIT_0E({128'h11111111111111111111111111111111,	//row29 - red
	    	  128'h11111111111111111111111111111111}),	//row30 - red
   	.INIT_0F({128'h00000000000000000000000000000000,	//row31 - white
	    	  128'h00000000000000000000000000000000}),	//row32	- white
   	// Address 4096 to 8191
   	.INIT_10({128'h00000000000000000000000000000000,	//row33	- green
	   		  128'h00000000000000000000000000000000}),	//row34	- green
   	.INIT_11({128'h00000000000000000000000000000000,	//row35	- white
	   		  128'h00000000000000000000000000000000}),	//row36	- white
   	.INIT_12({128'h00000000000000000000000000000000,	//row37	- green
	    	  128'h00000000000000000000000000000000}),	//row38	- green
   	.INIT_13({128'h00000000000000000000000000000000,	//row39	- white
	    	  128'h00000000000000000000000000000000}),	//row40	- white
   	.INIT_14({128'h00000000000000000000000000000000,	//row41	- green
	    	  128'h00000000000000000000000000000000}),	//row42	- green
   	.INIT_15({128'h00000000000000000000000000000000,	//row43	- white
	    	  128'h00000000000000000000000000000000}),	//row44	- white
   	.INIT_16({128'h00000000000000000000000000000000,	//row45	- green
	    	  128'h00000000000000000000000000000000}),	//row46	- green
   	.INIT_17({128'h00000000000000000000000000000000,	//row47	- white
	    	  128'h00000000000000000000000000000000}),	//row48	- white
   	.INIT_18({128'h00000000000000000000000000000000,	//row49	- green
	    	  128'h00000000000000000000000000000000}),	//row50	- green
   	.INIT_19({128'h00000000000000000000000000000000,	//row51	- white
	    	  128'h00000000000000000000000000000000}),	//row52	- white
   	.INIT_1A({128'h00000000000000000000000000000000,	//row53	- green
	    	  128'h00000000000000000000000000000000}),	//row54	- green
   	.INIT_1B({128'h00000000000000000000000000000000,	//row55	- white
	    	  128'h00000000000000000000000000000000}),	//row56	- white
   	.INIT_1C({128'h00000000000000000000000000000000,	//row57	- green
	    	  128'h00000000000000000000000000000000}),	//row58	- green
   	.INIT_1D({128'h00000000000000000000000000000000,	//row59	- white
	    	  128'h00000000000000000000000000000000}),	//row60	- white
   	.INIT_1E({128'h00000000000000000000000000000000,	//row61	- green
	    	  128'h00000000000000000000000000000000}),	//row62	- green
   	.INIT_1F({128'h00000000000000000000000000000000,	//row63	- white
	    	  128'h00000000000000000000000000000000}),	//row64	- white
   	// Address 8192 to 12287
   	.INIT_20({128'h00000000000000000000000000000000,	//row65	- blue
	   		  128'h00000000000000000000000000000000}),	//row66	- blue
   	.INIT_21({128'h00000000000000000000000000000000,	//row67	- white
	   		  128'h00000000000000000000000000000000}),	//row68	- white
   	.INIT_22({128'h00000000000000000000000000000000,	//row69	- blue
	    	  128'h00000000000000000000000000000000}),	//row70	- blue
   	.INIT_23({128'h00000000000000000000000000000000,	//row71	- white
	    	  128'h00000000000000000000000000000000}),	//row72	- white
   	.INIT_24({128'h00000000000000000000000000000000,	//row73	- blue
	    	  128'h00000000000000000000000000000000}),	//row74	- blue
   	.INIT_25({128'h00000000000000000000000000000000,	//row75	- white
	    	  128'h00000000000000000000000000000000}),	//row76	- white
   	.INIT_26({128'h00000000000000000000000000000000,	//row77	- blue
	    	  128'h00000000000000000000000000000000}),	//row78	- blue
   	.INIT_27({128'h00000000000000000000000000000000,	//row79	- white
	    	  128'h00000000000000000000000000000000}),	//row80	- white
   	.INIT_28({128'h00000000000000000000000000000000,	//row81	- blue
	    	  128'h00000000000000000000000000000000}),	//row82	- blue
   	.INIT_29({128'h00000000000000000000000000000000,	//row83	- white
	    	  128'h00000000000000000000000000000000}),	//row84	- white
   	.INIT_2A({128'h00000000000000000000000000000000,	//row85	- blue
	    	  128'h00000000000000000000000000000000}),	//row86	- blue
   	.INIT_2B({128'h00000000000000000000000000000000,	//row87	- white
	    	  128'h00000000000000000000000000000000}),	//row88	- white
   	.INIT_2C({128'h00000000000000000000000000000000,	//row89	- blue
	    	  128'h00000000000000000000000000000000}),	//row90	- blue
   	.INIT_2D({128'h00000000000000000000000000000000,	//row91	- white
	    	  128'h00000000000000000000000000000000}),	//row92	- white
   	.INIT_2E({128'h00000000000000000000000000000000,	//row93	- blue
	    	  128'h00000000000000000000000000000000}),	//row94	- blue
   	.INIT_2F({128'h00000000000000000000000000000000,	//row95	- white
	    	  128'h00000000000000000000000000000000}),	//row96	- white
   	// Address 12288 to 16383
	.INIT_30({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row97		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row98		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_31({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row99		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row100	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_32({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row101	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row102	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_33({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row103	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row104	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_34({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row105	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row106	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_35({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row107	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row108	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_36({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row109	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row110	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_37({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row111	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row112	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_38({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row113	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row114	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_39({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row115	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row116	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3A({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row117	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row118	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3B({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row119	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row120	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3C({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row121	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row122	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3D({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row123	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row124	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3E({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row125	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111}),	//row126	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3F({128'h0000_0000_0000_0000_1111_1111_1111_1111,		//row127	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_0000_0000_1111_1111_1111_1111})	//row128	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
) RAMB16_S1_RED (
	.DO(VGA_RED),    // 1-bit Data Output
	.ADDR(ADDR),     // 14-bit Address Input
	.CLK(CLK),       // Clock
	.DI(1'b0),          // 1-bit Data Input
	.EN(1'b1),          // RAM Enable Input
	.SSR(SSR),       // Synchronous Set/Reset Input
	.WE(1'b0)           // Write Enable Input
);

// RAMB16_S1: 16kx1 Single-Port RAM
//            Spartan-3E
// Xilinx HDL Language Template, version 14.7

RAMB16_S1 #(
	.INIT(1'b0),  // Value of output RAM registers at startup
	.SRVAL(1'b0), // Output value upon SSR assertion
	.WRITE_MODE("WRITE_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

	// The forllowing INIT_xx declarations specify the initial contents of the RAM
	// Address 0 to 4095
	.INIT_00({128'h00000000000000000000000000000000,	//row1 	- red
	   		  128'h00000000000000000000000000000000}),	//row2 	- red
   	.INIT_01({128'h00000000000000000000000000000000,	//row3 	- white
	   		  128'h00000000000000000000000000000000}),	//row4 	- white
   	.INIT_02({128'h00000000000000000000000000000000,	//row5 	- red
	    	  128'h00000000000000000000000000000000}),	//row6	- red
   	.INIT_03({128'h00000000000000000000000000000000,	//row7	- white
	    	  128'h00000000000000000000000000000000}),	//row8	- white
   	.INIT_04({128'h00000000000000000000000000000000,	//row9	- red
	    	  128'h00000000000000000000000000000000}),	//row10 - red
   	.INIT_05({128'h00000000000000000000000000000000,	//row11 - white
	    	  128'h00000000000000000000000000000000}),	//row12 - white
   	.INIT_06({128'h00000000000000000000000000000000,	//row13 - red
	    	  128'h00000000000000000000000000000000}),	//row14 - red
   	.INIT_07({128'h00000000000000000000000000000000,	//row15 - white
	    	  128'h00000000000000000000000000000000}),	//row16 - white
   	.INIT_08({128'h00000000000000000000000000000000,	//row17 - red
	    	  128'h00000000000000000000000000000000}),	//row18 - red
   	.INIT_09({128'h00000000000000000000000000000000,	//row19 - white
	    	  128'h00000000000000000000000000000000}),	//row20 - white
   	.INIT_0A({128'h00000000000000000000000000000000,	//row21 - red
	    	  128'h00000000000000000000000000000000}),	//row22 - red
   	.INIT_0B({128'h00000000000000000000000000000000,	//row23 - white
	    	  128'h00000000000000000000000000000000}),	//row24 - white
   	.INIT_0C({128'h00000000000000000000000000000000,	//row25 - red
	    	  128'h00000000000000000000000000000000}),	//row26 - red
   	.INIT_0D({128'h00000000000000000000000000000000,	//row27 - white
	    	  128'h00000000000000000000000000000000}),	//row28 - white
   	.INIT_0E({128'h00000000000000000000000000000000,	//row29 - red
	    	  128'h00000000000000000000000000000000}),	//row30 - red
   	.INIT_0F({128'h00000000000000000000000000000000,	//row31 - white
	    	  128'h00000000000000000000000000000000}),	//row32	- white
   	// Address 4096 to 8191
   	.INIT_10({128'h11111111111111111111111111111111,	//row33	- green
	   		  128'h11111111111111111111111111111111}),	//row34	- green
   	.INIT_11({128'h00000000000000000000000000000000,	//row35	- white
	   		  128'h00000000000000000000000000000000}),	//row36	- white
   	.INIT_12({128'h11111111111111111111111111111111,	//row37	- green
	    	  128'h11111111111111111111111111111111}),	//row38	- green
   	.INIT_13({128'h00000000000000000000000000000000,	//row39	- white
	    	  128'h00000000000000000000000000000000}),	//row40	- white
   	.INIT_14({128'h11111111111111111111111111111111,	//row41	- green
	    	  128'h11111111111111111111111111111111}),	//row42	- green
   	.INIT_15({128'h00000000000000000000000000000000,	//row43	- white
	    	  128'h00000000000000000000000000000000}),	//row44	- white
   	.INIT_16({128'h11111111111111111111111111111111,	//row45	- green
	    	  128'h11111111111111111111111111111111}),	//row46	- green
   	.INIT_17({128'h00000000000000000000000000000000,	//row47	- white
	    	  128'h00000000000000000000000000000000}),	//row48	- white
   	.INIT_18({128'h11111111111111111111111111111111,	//row49	- green
	    	  128'h11111111111111111111111111111111}),	//row50	- green
   	.INIT_19({128'h00000000000000000000000000000000,	//row51	- white
	    	  128'h00000000000000000000000000000000}),	//row52	- white
   	.INIT_1A({128'h11111111111111111111111111111111,	//row53	- green
	    	  128'h11111111111111111111111111111111}),	//row54	- green
   	.INIT_1B({128'h00000000000000000000000000000000,	//row55	- white
	    	  128'h00000000000000000000000000000000}),	//row56	- white
   	.INIT_1C({128'h11111111111111111111111111111111,	//row57	- green
	    	  128'h11111111111111111111111111111111}),	//row58	- green
   	.INIT_1D({128'h00000000000000000000000000000000,	//row59	- white
	    	  128'h00000000000000000000000000000000}),	//row60	- white
   	.INIT_1E({128'h11111111111111111111111111111111,	//row61	- green
	    	  128'h11111111111111111111111111111111}),	//row62	- green
   	.INIT_1F({128'h00000000000000000000000000000000,	//row63	- white
	    	  128'h00000000000000000000000000000000}),	//row64	- white
   	// Address 8192 to 12287
   	.INIT_20({128'h00000000000000000000000000000000,	//row65	- blue
	   		  128'h00000000000000000000000000000000}),	//row66	- blue
   	.INIT_21({128'h00000000000000000000000000000000,	//row67	- white
	   		  128'h00000000000000000000000000000000}),	//row68	- white
   	.INIT_22({128'h00000000000000000000000000000000,	//row69	- blue
	    	  128'h00000000000000000000000000000000}),	//row70	- blue
   	.INIT_23({128'h00000000000000000000000000000000,	//row71	- white
	    	  128'h00000000000000000000000000000000}),	//row72	- white
   	.INIT_24({128'h00000000000000000000000000000000,	//row73	- blue
	    	  128'h00000000000000000000000000000000}),	//row74	- blue
   	.INIT_25({128'h00000000000000000000000000000000,	//row75	- white
	    	  128'h00000000000000000000000000000000}),	//row76	- white
   	.INIT_26({128'h00000000000000000000000000000000,	//row77	- blue
	    	  128'h00000000000000000000000000000000}),	//row78	- blue
   	.INIT_27({128'h00000000000000000000000000000000,	//row79	- white
	    	  128'h00000000000000000000000000000000}),	//row80	- white
   	.INIT_28({128'h00000000000000000000000000000000,	//row81	- blue
	    	  128'h00000000000000000000000000000000}),	//row82	- blue
   	.INIT_29({128'h00000000000000000000000000000000,	//row83	- white
	    	  128'h00000000000000000000000000000000}),	//row84	- white
   	.INIT_2A({128'h00000000000000000000000000000000,	//row85	- blue
	    	  128'h00000000000000000000000000000000}),	//row86	- blue
   	.INIT_2B({128'h00000000000000000000000000000000,	//row87	- white
	    	  128'h00000000000000000000000000000000}),	//row88	- white
   	.INIT_2C({128'h00000000000000000000000000000000,	//row89	- blue
	    	  128'h00000000000000000000000000000000}),	//row90	- blue
   	.INIT_2D({128'h00000000000000000000000000000000,	//row91	- white
	    	  128'h00000000000000000000000000000000}),	//row92	- white
   	.INIT_2E({128'h00000000000000000000000000000000,	//row93	- blue
	    	  128'h00000000000000000000000000000000}),	//row94	- blue
   	.INIT_2F({128'h00000000000000000000000000000000,	//row95	- white
	    	  128'h00000000000000000000000000000000}),	//row96	- white
   	// Address 12288 to 16383
	.INIT_30({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row97		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row98		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_31({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row99		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row100	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_32({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row101	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row102	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_33({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row103	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row104	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_34({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row105	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row106	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_35({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row107	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row108	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_36({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row109	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row110	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_37({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row111	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row112	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_38({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row113	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row114	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_39({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row115	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row116	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3A({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row117	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row118	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3B({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row119	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row120	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3C({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row121	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row122	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3D({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row123	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row124	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3E({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row125	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111}),	//row126	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3F({128'h0000_0000_1111_1111_0000_0000_1111_1111,		//row127	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_0000_1111_1111_0000_0000_1111_1111})	//row128	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
) RAMB16_S1_GREEN (
	.DO(VGA_GREEN),      // 1-bit Data Output
	.ADDR(ADDR),         // 14-bit Address Input
	.CLK(CLK),           // Clock
	.DI(1'b0),              // 1-bit Data Input
	.EN(1'b1),              // RAM Enable Input
	.SSR(SSR),           // Synchronous Set/Reset Input
	.WE(1'b0)               // Write Enable Input
);

// RAMB16_S1: 16kx1 Single-Port RAM
//            Spartan-3E
// Xilinx HDL Language Template, version 14.7

RAMB16_S1 #(
   	.INIT(1'b0),  // Value of output RAM registers at startup
   	.SRVAL(1'b0), // Output value upon SSR assertion
   	.WRITE_MODE("WRITE_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

   	// The forllowing INIT_xx declarations specify the initial contents of the RAM
   	// Address 0 to 4095
   	.INIT_00({128'h00000000000000000000000000000000,	//row1 	- red
	   		  128'h00000000000000000000000000000000}),	//row2 	- red
   	.INIT_01({128'h00000000000000000000000000000000,	//row3 	- white
	   		  128'h00000000000000000000000000000000}),	//row4 	- white
   	.INIT_02({128'h00000000000000000000000000000000,	//row5 	- red
	    	  128'h00000000000000000000000000000000}),	//row6	- red
   	.INIT_03({128'h00000000000000000000000000000000,	//row7	- white
	    	  128'h00000000000000000000000000000000}),	//row8	- white
   	.INIT_04({128'h00000000000000000000000000000000,	//row9	- red
	    	  128'h00000000000000000000000000000000}),	//row10 - red
   	.INIT_05({128'h00000000000000000000000000000000,	//row11 - white
	    	  128'h00000000000000000000000000000000}),	//row12 - white
   	.INIT_06({128'h00000000000000000000000000000000,	//row13 - red
	    	  128'h00000000000000000000000000000000}),	//row14 - red
   	.INIT_07({128'h00000000000000000000000000000000,	//row15 - white
	    	  128'h00000000000000000000000000000000}),	//row16 - white
   	.INIT_08({128'h00000000000000000000000000000000,	//row17 - red
	    	  128'h00000000000000000000000000000000}),	//row18 - red
   	.INIT_09({128'h00000000000000000000000000000000,	//row19 - white
	    	  128'h00000000000000000000000000000000}),	//row20 - white
   	.INIT_0A({128'h00000000000000000000000000000000,	//row21 - red
	    	  128'h00000000000000000000000000000000}),	//row22 - red
   	.INIT_0B({128'h00000000000000000000000000000000,	//row23 - white
	    	  128'h00000000000000000000000000000000}),	//row24 - white
   	.INIT_0C({128'h00000000000000000000000000000000,	//row25 - red
	    	  128'h00000000000000000000000000000000}),	//row26 - red
   	.INIT_0D({128'h00000000000000000000000000000000,	//row27 - white
	    	  128'h00000000000000000000000000000000}),	//row28 - white
   	.INIT_0E({128'h00000000000000000000000000000000,	//row29 - red
	    	  128'h00000000000000000000000000000000}),	//row30 - red
   	.INIT_0F({128'h00000000000000000000000000000000,	//row31 - white
	    	  128'h00000000000000000000000000000000}),	//row32	- white
   	// Address 4096 to 8191
   	.INIT_10({128'h00000000000000000000000000000000,	//row33	- green
	   		  128'h00000000000000000000000000000000}),	//row34	- green
   	.INIT_11({128'h00000000000000000000000000000000,	//row35	- white
	   		  128'h00000000000000000000000000000000}),	//row36	- white
   	.INIT_12({128'h00000000000000000000000000000000,	//row37	- green
	    	  128'h00000000000000000000000000000000}),	//row38	- green
   	.INIT_13({128'h00000000000000000000000000000000,	//row39	- white
	    	  128'h00000000000000000000000000000000}),	//row40	- white
   	.INIT_14({128'h00000000000000000000000000000000,	//row41	- green
	    	  128'h00000000000000000000000000000000}),	//row42	- green
   	.INIT_15({128'h00000000000000000000000000000000,	//row43	- white
	    	  128'h00000000000000000000000000000000}),	//row44	- white
   	.INIT_16({128'h00000000000000000000000000000000,	//row45	- green
	    	  128'h00000000000000000000000000000000}),	//row46	- green
   	.INIT_17({128'h00000000000000000000000000000000,	//row47	- white
	    	  128'h00000000000000000000000000000000}),	//row48	- white
   	.INIT_18({128'h00000000000000000000000000000000,	//row49	- green
	    	  128'h00000000000000000000000000000000}),	//row50	- green
   	.INIT_19({128'h00000000000000000000000000000000,	//row51	- white
	    	  128'h00000000000000000000000000000000}),	//row52	- white
   	.INIT_1A({128'h00000000000000000000000000000000,	//row53	- green
	    	  128'h00000000000000000000000000000000}),	//row54	- green
   	.INIT_1B({128'h00000000000000000000000000000000,	//row55	- white
	    	  128'h00000000000000000000000000000000}),	//row56	- white
   	.INIT_1C({128'h00000000000000000000000000000000,	//row57	- green
	    	  128'h00000000000000000000000000000000}),	//row58	- green
   	.INIT_1D({128'h00000000000000000000000000000000,	//row59	- white
	    	  128'h00000000000000000000000000000000}),	//row60	- white
   	.INIT_1E({128'h00000000000000000000000000000000,	//row61	- green
	    	  128'h00000000000000000000000000000000}),	//row62	- green
   	.INIT_1F({128'h00000000000000000000000000000000,	//row63	- white
	    	  128'h00000000000000000000000000000000}),	//row64	- white
   	// Address 8192 to 12287
   	.INIT_20({128'h11111111111111111111111111111111,	//row65	- blue
	   		  128'h11111111111111111111111111111111}),	//row66	- blue
   	.INIT_21({128'h00000000000000000000000000000000,	//row67	- white
	   		  128'h00000000000000000000000000000000}),	//row68	- white
   	.INIT_22({128'h11111111111111111111111111111111,	//row69	- blue
	    	  128'h11111111111111111111111111111111}),	//row70	- blue
   	.INIT_23({128'h00000000000000000000000000000000,	//row71	- white
	    	  128'h00000000000000000000000000000000}),	//row72	- white
   	.INIT_24({128'h11111111111111111111111111111111,	//row73	- blue
	    	  128'h11111111111111111111111111111111}),	//row74	- blue
   	.INIT_25({128'h00000000000000000000000000000000,	//row75	- white
	    	  128'h00000000000000000000000000000000}),	//row76	- white
   	.INIT_26({128'h11111111111111111111111111111111,	//row77	- blue
	    	  128'h11111111111111111111111111111111}),	//row78	- blue
   	.INIT_27({128'h00000000000000000000000000000000,	//row79	- white
	    	  128'h00000000000000000000000000000000}),	//row80	- white
   	.INIT_28({128'h11111111111111111111111111111111,	//row81	- blue
	    	  128'h11111111111111111111111111111111}),	//row82	- blue
   	.INIT_29({128'h00000000000000000000000000000000,	//row83	- white
	    	  128'h00000000000000000000000000000000}),	//row84	- white
   	.INIT_2A({128'h11111111111111111111111111111111,	//row85	- blue
	    	  128'h11111111111111111111111111111111}),	//row86	- blue
   	.INIT_2B({128'h00000000000000000000000000000000,	//row87	- white
	    	  128'h00000000000000000000000000000000}),	//row88	- white
   	.INIT_2C({128'h11111111111111111111111111111111,	//row89	- blue
	    	  128'h11111111111111111111111111111111}),	//row90	- blue
   	.INIT_2D({128'h00000000000000000000000000000000,	//row91	- white
	    	  128'h00000000000000000000000000000000}),	//row92	- white
   	.INIT_2E({128'h11111111111111111111111111111111,	//row93	- blue
	    	  128'h11111111111111111111111111111111}),	//row94	- blue
   	.INIT_2F({128'h00000000000000000000000000000000,	//row95	- white
	    	  128'h00000000000000000000000000000000}),	//row96	- white
   	// Address 12288 to 16383
	.INIT_30({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row97		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row98		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_31({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row99		- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	   		  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row100	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_32({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row101	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row102	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_33({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row103	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row104	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_34({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row105	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row106	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_35({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row107	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row108	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_36({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row109	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row110	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_37({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row111	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row112	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_38({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row113	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row114	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_39({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row115	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row116	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3A({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row117	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row118	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3B({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row119	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row120	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3C({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row121	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row122	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3D({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row123	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row124	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3E({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row125	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111}),	//row126	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
   	.INIT_3F({128'h0000_1111_0000_1111_0000_1111_0000_1111,		//row127	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
	    	  128'h0000_1111_0000_1111_0000_1111_0000_1111})	//row128	- black x4 | blue x4 | green x4 | cyan x4 | red x4 | purple x4 | yellow x4 | white x4
) RAMB16_S1_BLUE (
   	.DO(VGA_BLUE),       // 1-bit Data Output
   	.ADDR(ADDR),         // 14-bit Address Input
   	.CLK(CLK),           // Clock
   	.DI(1'b0),              // 1-bit Data Input
   	.EN(1'b1),              // RAM Enable Input
   	.SSR(SSR),           // Synchronous Set/Reset Input
   	.WE(1'b0)               // Write Enable Input
);

endmodule