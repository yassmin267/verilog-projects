module task3_tb();
reg [3:0]x;
wire [1:0]y;

task3 DUT(.y(y),.x(x));
initial begin
	x=4'b0000;
	#10 x = 4'b0000;
	#10 x = 4'b1000;
	#10 x = 4'b0100;
	#10 x = 4'b0010;
	#10 x = 4'b0001;
	#10 x = 4'b1010;
	#10 x = 4'b1111;
end
 initial begin
 $monitor("x=%b : y=%b ",x,y); 
 end  
endmodule

 
