// 8 bit 4x1 Multiplexer
module mux_8_4x1 (output reg [7: 0]Y, input [1:0]S, [7: 0]I0, [7: 0]I1, [7: 0]I2, [7: 0]I3);
always @ (S, I0, I1, I2, I3) 
case(S)
2'b00: Y = I0; 
2'b01: Y = I1; 
2'b10: Y = I2; 
2'b11: Y = I3; 
endcase
endmodule

// 1 bit 4x1 Multiplexer
module mux4x1 (output reg Y, input [1:0]S, input I0, I1, I2, I3);
always @ (S, I0, I1, I2, I3) 
case(S)
2'b00: Y = I0; 
2'b01: Y = I1; 
2'b10: Y = I2; 
2'b11: Y = I3; 
endcase
endmodule


//---32-BIT-MULTIPLEXERS-----------------------------------------------------------------------------------------------

// 32 bit 2x1 Multiplexer
module mux_2x1 (output reg [31: 0]Y, input S, [31: 0]I0, [31: 0]I1);
always @ (S, I0, I1) 
if (S) Y = I1; 
else Y = I0; 
endmodule

// 32 bit 4x1 Multiplexer
module mux_32_4x1 (output reg [31: 0]Y, input [1:0]S, [31: 0]I0, [31:0]I1, [31:0]I2, [31:0]I3); 
always @ (S, I0, I1, I2, I3) 
case(S)
2'b00: Y = I0; 
2'b01: Y = I1; 
2'b10: Y = I2; 
2'b11: Y = I3; 
endcase
endmodule


// 32 bit 8x1 Multiplexer
module mux_8x1 (output reg [31: 0]Y, input wire [2:0]S, [31: 0]I0, [31:0]I1, [31:0]I2, [31:0]I3, [31:0]I4, [31:0]I5, [31:0]I6, [31:0]I7); 
always @ (S, I0, I1, I2, I3, I4, I5, I6, I7) 
case(S)
3'b000: Y = I0; 
3'b001: Y = I1; 
3'b010: Y = I2; 
3'b011: Y = I3; 
3'b100: Y = I4; 
3'b101: Y = I5; 
3'b110: Y = I6; 
3'b111: Y = I7;
endcase
endmodule
// 32 bit 32x1 Multiplexer
module mux_32x1 (output reg [31:0]Y, input [4:0]S, input [31:0]I0, [31:0]I1, [31:0]I2, [31:0]I3, [31:0]I4, [31:0]I5, [31:0]I6, [31:0]I7, [31:0]I8, [31:0]I9, [31:0]I10, [31:0]I11, [31:0]I12, [31:0]I13, [31:0]I14, [31:0]I15, [31:0]I16, [31:0]I17, [31:0]I18, [31:0]I19, [31:0]I20, [31:0]I21, [31:0]I22, [31:0]I23, [31:0]I24, [31:0]I25, [31:0]I26, [31:0]I27, [31:0]I28, [31:0]I29, [31:0]I30, [31:0]I31);
always @ (S, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31)
case(S)
5'b00000: Y = I0;
5'b00001: Y = I1;
5'b00010: Y = I2;
5'b00011: Y = I3;
5'b00100: Y = I4;
5'b00101: Y = I5;
5'b00110: Y = I6;
5'b00111: Y = I7;
5'b01000: Y = I8;
5'b01001: Y = I9;
5'b01010: Y = I10;
5'b01011: Y = I11;
5'b01100: Y = I12;
5'b01101: Y = I13;
5'b01110: Y = I14;
5'b01111: Y = I15;
5'b10000: Y = I16;
5'b10001: Y = I17;
5'b10010: Y = I18;
5'b10011: Y = I19;
5'b10100: Y = I20;
5'b10101: Y = I21;
5'b10110: Y = I22;
5'b10111: Y = I23;
5'b11000: Y = I24;
5'b11001: Y = I25;
5'b11010: Y = I26;
5'b11011: Y = I27;
5'b11100: Y = I28;
5'b11101: Y = I29;
5'b11110: Y = I30;
5'b11111: Y = I31;
endcase
endmodule


// 32 bit 64x1 Multiplexer
module mux_64x1 (output reg [31: 0]Y, input [5:0]S, [31:0]I0, [31:0]I1, [31:0]I2, [31:0]I3, [31:0]I4, [31:0]I5, [31:0]I6, [31:0]I7, [31:0]I8, [31:0]I9, [31:0]I10, [31:0]I11, [31:0]I12, [31:0]I13, [31:0]I14, [31:0]I15, [31:0]I16, [31:0]I17, [31:0]I18, [31:0]I19, [31:0]I20, [31:0]I21, [31:0]I22, [31:0]I23, [31:0]I24, [31:0]I25, [31:0]I26, [31:0]I27, [31:0]I28, [31:0]I29, [31:0]I30, [31:0]I31, [31:0]I32, [31:0]I33, [31:0]I34, [31:0]I35, [31:0]I36, [31:0]I37, [31:0]I38, [31:0]I39, [31:0]I40, [31:0]I41, [31:0]I42, [31:0]I43, [31:0]I44, [31:0]I45, [31:0]I46, [31:0]I47, [31:0]I48, [31:0]I49, [31:0]I50, [31:0]I51, [31:0]I52, [31:0]I53, [31:0]I54, [31:0]I55, [31:0]I56, [31:0]I57, [31:0]I58, [31:0]I59, [31:0]I60, [31:0]I61, [31:0]I62, [31:0]I63); 
always @ (S, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, I32, I33, I34, I35, I36, I37, I38, I39, I40, I41, I42, I43, I44, I45, I46, I47, I48, I49, I50, I51, I52, I53, I54, I55, I56, I57, I58, I59, I60, I61, I62, I63) 
case(S)
6'b000000: Y = I0;
6'b000001: Y = I1;
6'b000010: Y = I2;
6'b000011: Y = I3;
6'b000100: Y = I4;
6'b000101: Y = I5;
6'b000110: Y = I6;
6'b000111: Y = I7;
6'b001000: Y = I8;
6'b001001: Y = I9;
6'b001010: Y = I10;
6'b001011: Y = I11;
6'b001100: Y = I12;
6'b001101: Y = I13;
6'b001110: Y = I14;
6'b001111: Y = I15;
6'b010000: Y = I16;
6'b010001: Y = I17;
6'b010010: Y = I18;
6'b010011: Y = I19;
6'b010100: Y = I20;
6'b010101: Y = I21;
6'b010110: Y = I22;
6'b010111: Y = I23;
6'b011000: Y = I24;
6'b011001: Y = I25;
6'b011010: Y = I26;
6'b011011: Y = I27;
6'b011100: Y = I28;
6'b011101: Y = I29;
6'b011110: Y = I30;
6'b011111: Y = I31;
6'b100000: Y = I32;
6'b100001: Y = I33;
6'b100010: Y = I34;
6'b100011: Y = I35;
6'b100100: Y = I36;
6'b100101: Y = I37;
6'b100110: Y = I38;
6'b100111: Y = I39;
6'b101000: Y = I40;
6'b101001: Y = I41;
6'b101010: Y = I42;
6'b101011: Y = I43;
6'b101100: Y = I44;
6'b101101: Y = I45;
6'b101110: Y = I46;
6'b101111: Y = I47;
6'b110000: Y = I48;
6'b110001: Y = I49;
6'b110010: Y = I50;
6'b110011: Y = I51;
6'b110100: Y = I52;
6'b110101: Y = I53;
6'b110110: Y = I54;
6'b110111: Y = I55;
6'b111000: Y = I56;
6'b111001: Y = I57;
6'b111010: Y = I58;
6'b111011: Y = I59;
6'b111100: Y = I60;
6'b111101: Y = I61;
6'b111110: Y = I62;
6'b111111: Y = I63;

endcase
endmodule