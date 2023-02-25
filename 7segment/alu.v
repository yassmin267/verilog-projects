module alu(a,b,op,out);
parameter w=4;
input [w-1:0]a,b;
input [1:0]op;
output reg [3:0] out;
always @(*) begin
	case(op)
	2'b00:out=a+b;
	2'b01:out=a-b;
	2'b10:out=a|b;
	2'b11:out=a^b;
	endcase
end
endmodule
