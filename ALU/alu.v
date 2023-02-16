module alu(a,b,op,out);
parameter w=4;
input [w-1:0]a,b;
input [1:0]op;
output reg [w-1:0] out;

wire [w-1:1] adder_result;
N_bit_adder #(.N(w)) add(a,b,adder_result);

always @(*) begin
	case(op)
	2'b00:out=adder_result;
	2'b01:out=a-b;
	2'b10:out=a|b;
	2'b11:out=a^b;
	endcase
end
endmodule

