module Parameterized_Shift_register_tb();
	parameter w=4;
	reg sclr,sset,load,en,aclr,aset,clk,SI;
	reg [w-1:0] data=4'b1101;
	wire SO;
	wire [w-1:0] q;
	wire [w-1:0] tmp;
	parameter shift_direction="left";

	Parameterized_Shift_register #(.w(w)) dut(sclr,sset,load,en,aclr,aset,clk,SI,SO,data,q);

	initial begin
		clk=0;
		forever
		#1 clk=~clk;
	end 

	initial begin
		$monitor("sclr=%b ,sset=%b ,load=%b ,en=%b aclr=%b ,aset=%b ,clk=%b ,SI=%b ,SO=%b ,data=%b ,q=%b",sclr,sset,load,en,aclr,aset,clk,SI,SO,data,q);
		//data=4'b1101;
		//check sset
		
		#2 sclr=0; sset=1; load=0; en=0; aclr=0; aset=0; SI=0; //clk=0;
		#2 sclr=0; sset=1; load=0; en=0; aclr=0; aset=0; SI=0; //clk=1;
		//check sclr
		#2 sclr=1; sset=0; load=0; en=0; aclr=0; aset=0; SI=0; //clk=0;
		#2 sclr=1; sset=0; load=0; en=0; aclr=0; aset=0; SI=0; //clk=1;
		//check aset,aclr
		#2 sclr=0; sset=0; load=0; en=0; aclr=0; aset=1; SI=0; //clk=0;
		#2 sclr=0; sset=0; load=0; en=0; aclr=1; aset=0; SI=0; //clk=0;

		#2 sclr=0; sset=0; load=1; en=1; aclr=0; aset=1; SI=0; //clk=1;
		#2 sclr=0; sset=0; load=0; en=0; aclr=1; aset=0; SI=0; //clk=0;
		//check load
		#2 sclr=0; sset=0; load=1; en=1; aclr=0; aset=0; SI=0; //clk=1;
		//check shift

		#2 sclr=0; sset=0; load=0; en=1; aclr=0; aset=0; SI=0;//clk=1; 
		#2 sclr=0; sset=0; load=0; en=1; aclr=0; aset=0; SI=1; //clk=1; 
		//#100 sclr=0; sset=0; load=0; en=1; aclr=0; aset=0; SI=0; clk=1;
		#2 $stop;
	end 

endmodule 
