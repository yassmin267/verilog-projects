module sequence_010_detector_tb();
	reg x,clk,rst;
	wire y;
	wire [9:0] count;
	
	sequence_010_detector m(x,clk,rst,y,count);

	 initial begin
		clk=0;
		forever
		#10 clk=~clk;
	end 

	initial begin
		rst=1;
		x=0;#10

		rst=0;
		x=0; #10
		x=1; #10
		x=1; #10
		x=0; #10
		x=0; #10 
		x=1; #10
		x=1; #10 
		x=1; #10 

		x=0; #10
		x=1; #10
		x=1; #10
		x=0; #10
		x=0; #10 
		x=1; #10
		x=1; #10 
		x=1; #10 
		$stop;
	end
	initial begin
		$monitor("x=%b,clk=%b,rst=%b,y=%b,count=%b",x,clk,rst,y,count);
	end
endmodule 
