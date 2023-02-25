module SLE_tb();
	reg D,clk,En,ALn,ADn,SLn,SD,LAT;
	wire Q;
	integer i;
	SLE dut(D,clk,En,ALn,ADn,SLn,SD,LAT,Q);

	initial begin
		clk=0;
		forever
		#1 clk=~clk;
	end

	initial begin
	$monitor("D=%b,LAT=%b , clk=%b ,ALn=%b ,En=%b ,SLn=%b ,ADn=%b ,SD=%b ,Q=%b",D,LAT, clk,ALn,En,SLn,ADn,SD,Q);
		ALn=0;
		D=0;
		En=0;
		ADn=0;
		SLn=0;
		SD=0;
		LAT=0;
		#10
		//ALn=0;
		//#100;
		for (i = 0; i < 5; i=i+1) begin
			@(negedge clk);
			ALn=0;  //whatever any other value Q=!ADn
			En=$random;
			D=$random;
			ADn=$random;
			SD=$random;
			SLn=$random;
			LAT=$random;
		end
		for (i = 0; i <10; i=i+1) begin
			@(negedge clk);
			ALn=1;
			En=1;
			SLn=$random;
			ADn=$random;
			SD=$random;
			D=$random;
			LAT=$random;
			//En=$random;
		end
		for (i = 0; i <5; i=i+1) begin
			@(negedge clk);
			ALn=1;
			En=0;
			SLn=$random;
			ADn=$random;
			SD=$random;
			D=$random;
			LAT=$random;
			//En=$random;
		end
		#1 $stop;

	end
endmodule 