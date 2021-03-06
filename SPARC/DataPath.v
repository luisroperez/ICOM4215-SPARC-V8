module DataPath(
	// IR
	input IR_Enable,
	input [31:0]IR_In,
	output [31:0]IR_Out,
	
	// PC
	input PC_enable, PC_Clr,
	
	// nPC
	input NPC_enable, NPC_Clr,
	
	// PSR
	input PSR_Enable,PSR_Clr,
	input S, PS, ET,
	output [31:0]PSR_out,
	
	// Temp
	input TEMP_Enable, TEMP_Clr,
	
	// MDR
	input MDR_Enable, MDR_Clr,

	// MAR
	input MAR_Enable, MAR_Clr,
	
	//TBR
	input TBR_enable, TBR_Clr,
	input [2:0] tt,
	
	// ALU
	input [5:0]ALU_op,
	output [31:0]ALU_out,
	
	// register file
	input register_file_enable,
	input [4:0] in_PA, in_PB, in_PC,
	output [31:0]out_PA, out_PB,
	
	// Sign Extender
	input [2:0]extender_select,
	output [31:0]extender_out,
	
	// ALUA Mux
	input [1:0]ALUA_Mux_select,
	output [31:0]ALUA_Mux_out,
	
	// ALUB Mux
	input [2:0]ALUB_Mux_select,
	output [31:0]ALUB_Mux_out,
	
	// MDR Mux
	input MDR_Mux_select,
	
	// PC in Mux
	input [1:0]PC_In_Mux_select,
	
	// TBR Mux
	input TBR_Mux_select,
	
	// PSR Mux
	input [1:0]PSR_Mux_select,
	
	// Ram
	input [5:0]RAM_OpCode,
	input RAM_enable,
	output MFC, MSET,
	
	input out_BLA, BA_O, BN_O,

	
	input Clk); //Missing shit like crazy
	
	
	wire rett, N, Z, C, V;
	wire [4:0] cwp_in;
	
	wire [1:0] trap;

	wire [31:0] MDR_Mux_out, MDR_Out, MAR_Out, RAM_Out, TEMP_Out, NPC_out, PC_out, TBR_Out, PC_Mux_out, TBR_Mux_out, PSR_Mux_out;
	wire [19:0] TBA;
	
	/* Registers */

	// NPC and PC registers
 	register_32 NPC (NPC_out, ALU_out, NPC_enable, NPC_Clr, Clk);
	register_32 PC (PC_out, PC_Mux_out, PC_enable, PC_Clr, Clk); 
	
	// IR
	register_32 IR(IR_Out, IR_In, IR_Enable, IR_Clr, Clk);
	
	// Memory registers
	register_32 MDR(MDR_Out, MDR_Mux_out, MDR_Enable, MDR_Clr, Clk);
	register_32 MAR(MAR_Out, ALU_out, MAR_Enable, MAR_Clr, Clk); 
	register_32 TEMP(TEMP_Out, RAM_Out, TEMP_Enable, TEMP_Clr, Clk);

	// Process State Register
	register_32 PSR(PSR_out, PSR_Mux_out, PSR_Enable, PSR_Clr, Clk);
	
	register_32 TBR (TBR_Out, TBR_Mux_out, TBR_enable, TBR_Clr, Clk);
	
	/* Components */
	
	register_file register_file(out_PA, out_PB, ALU_out, in_PA, in_PB, in_PC, register_file_enable, register_file_Clr, Clk, PSR_out[1:0]);
	
	// ALU
	alu alu(ALU_out, N, Z, V, C, ALU_op, ALUA_Mux_out, ALUB_Mux_out, PSR_out[20]);
	
	// Sign Extender for immediate values: 00 = 13 bit, 01 = 22 bit, 10 = 30 bit
	sign_extender_magic_box s_extender(extender_out, IR_Out, extender_select);

	// RAM
	ram512x8 ram(RAM_Out, MFC, MSET, RAM_enable, RAM_OpCode, MAR_Out, MDR_Out);
	
	/* Muxes */
	
	// Mux for the input of MDR (Memory out or ALU out)
	mux_2x1 MDR_Mux(MDR_Mux_out, MDR_Mux_select, ALU_out, RAM_Out);
	
	// Mux for selecting second operand for ALU
	mux_8x1 ALUB_Mux(ALUB_Mux_out, ALUB_Mux_select, out_PB, extender_out, MDR_Out, PC_out, NPC_out, TEMP_Out, 32'h00000004, 32'h00000001);

	// Mux for selecting first operand for ALU
	mux_32_4x1 ALUA_Mux(ALUA_Mux_out, ALUA_Mux_select, out_PA, PC_out, NPC_out, {30'b000_0000_0000_0000_0000_0000_0000_000, PSR_out[1:0]});
	
	// Mux for PC input
	mux_32_4x1 PC_In_Mux(PC_Mux_out, PC_In_Mux_select, NPC_out, ALU_out, TBR_Out, 32'h00000000);
	
	// Mux for the input of TBR. Used for writing TBA or TT
	mux_2x1 TBR_Mux(TBR_Mux_out, TBR_Mux_select, {ALU_out[31:7], TBR_Out[6:0]}, {TBR_Out[31:7], tt,TBR_Out[3:0]});
	
	// Mux for the input of PSR
	mux_32_4x1 PSR_Mux(PSR_Mux_out, PSR_Mux_select, {PSR_out[31:24],N,Z,V,C,PSR_out[19:0]}, {PSR_out[31:8],S,PS,PSR_out[5:0]}, {PSR_out[31:6],ET,PSR_out[4:0]}, {PSR_out[31:2], ALU_out[1:0]});
	
	BLA bla(out_BLA, BA_O, BN_O, IR_In[28:25], PSR_out[23:20]);

	
endmodule