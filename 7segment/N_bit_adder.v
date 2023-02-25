module N_bit_adder(input1,input2,result);
parameter N=32;
input [N-1:0] input1,input2;
output [N-1:0] result;

assign result=input1+input2;

endmodule 