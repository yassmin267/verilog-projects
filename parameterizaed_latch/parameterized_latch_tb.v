module parameterized_latch_tb();
parameter w=4;
	reg aset,gate,aclr;
	reg [w-1:0] d;
	wire [w-1:0] q;
	integer i;

	parameterized_latch #(.w(w)) dut(d,aset,gate,aclr,q);
	
	initial begin
	$monitor ("gate=%b ,aclr=%b ,aset=%b , d=%b , q=%b ", gate ,aclr,aset,d,q);
	//d=0;
		gate<=0;
		d<=0;

		#100 aset<=1;
		#100 aclr<=0;

		#100 aset<=0;
		#100 aclr<=1;

		#100 aset<=0;
		#100 aclr<=0;

		for(i=0;i<50;i=i+1) begin
			#20 gate=~gate;
			#20 d=$random;
		end
		#100 aset<=1;
		#100 aclr<=1;
		#1 $stop;
	end
endmodule 