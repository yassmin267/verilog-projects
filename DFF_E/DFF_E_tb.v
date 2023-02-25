module DFF_E_tb();
	reg D,E,clk;
	wire Q;
	integer i;
	DFF_E dut(D,E,clk,Q);

	//create forever loop for clk 
	initial begin
		clk=0;
		forever 
		#1 clk=~clk;
	end

	initial begin
		$monitor("clk=%b , E=%b ,D=%b ,Q=%b ",clk,E,D,Q);
		E=0;
		D=0;
		#50;

		for (i = 0; i < 100; i=i+1) begin
			@(negedge clk);
			D=$random;
			E=$random;
		end
		#1 $stop;
	end


endmodule 
