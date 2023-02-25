module task3(x,y);
input [3:0]x;
output reg [1:0]y;

always @(x)begin
	if (x[3]==1)
	y=2'b11;
	else if (x[2]==1)
	y=2'b10;
	else if (x[1]==1)
	y=2'b01;
	else y=2'b00;
end

endmodule 


