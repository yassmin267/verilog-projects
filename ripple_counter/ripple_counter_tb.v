module ripple_counter_tb();
	reg clk,rstn;
	wire[3:0]out;
	integer i;

	ripple_counter R0(.clk(clk),.rstn(rstn),.out(out));

	initial begin
		clk=0;
		forever
		#1 clk=~clk;
	end 
	//always #5 clk = ~clk;  
	initial begin
		$monitor("out=",out);
		rstn<=0;
		clk<=0;
		#20

		#20 rstn=1;
		#80 rstn=0;
		#50 rstn=1;
		#1 $stop;
	end
endmodule
