module tb_N_bit_adder;
 // Inputs
 reg [31:0] input1;
 reg [31:0] input2;
 // Outputs
 wire [31:0] result;

 N_bit_adder uut (.input1(input1),.input2(input2), .result(result));

 initial begin
  input1 = 129; input2 = 1055; #100;

  input1 = 220; input2 = 20; #100;

  input1 = 50; input2 = -10; #100;

  input1 = 100; input2 = 30; #100;
end

  initial begin
  $monitor("i1=%d ,i2=%d : sum=%d ",input1,input2,result); 
 end       
endmodule