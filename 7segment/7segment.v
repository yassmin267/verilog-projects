module hexto7segment(a,b,op,out);

parameter w=4;
input [w-1:0]a,b;
input [1:0]op;
output reg [6:0]out;

wire [3:0] alu_out;
alu #(.w(w)) al(a,b,op,alu_out);

always @ (*) begin
case (alu_out)
4'b0000 :out = 7'b1111110;      // Hexadecimal 0
4'b0001 :out = 7'b0110000;    	// Hexadecimal 1
4'b0010 :out = 7'b1101101;  	// Hexadecimal 2
4'b0011 :out = 7'b1111001; 		// Hexadecimal 3
4'b0100 :out = 7'b0110011;		// Hexadecimal 4
4'b0101 :out = 7'b1011011;		// Hexadecimal 5 
4'b0110 :out = 7'b1011111;		// Hexadecimal 6
4'b0111 :out = 7'b1110000;		// Hexadecimal 7
4'b1000 :out = 7'b1111111;     	// Hexadecimal 8
4'b1001 :out = 7'b1111011;    	// Hexadecimal 9
4'b1010 :out = 7'b1110111;      // Hexadecimal A 
4'b1011 :out = 7'b0011111;		// Hexadecimal B
4'b1100 :out = 7'b1001110;		// Hexadecimal C
4'b1101 :out = 7'b0111101;		// Hexadecimal D
4'b1110 :out = 7'b1001111;		// Hexadecimal E
4'b1111 :out = 7'b1000111;		// Hexadecimal F
endcase
end
endmodule