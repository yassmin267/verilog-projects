module Parameterized_Shift_register(sclr,sset,load,en,aclr,aset,clk,SI,SO,data,q);
	parameter load_Avalue=5;
	parameter load_Svalue=2;
	parameter shift_direction="left"; //defult shift left 
	parameter w=4;
	input sclr,sset,load,en,aclr,aset,clk,SI;
	input [w-1:0] data;
	output reg SO;
	output [w-1:0] q;
	reg [w-1:0] tmp;

	always @(posedge clk or posedge aclr or posedge aset) begin
		if(aclr) tmp<= 4'b0000;
		else if(aset) tmp<=load_Avalue ;
		else if(sclr) tmp<= 4'b0000;
		else if(sset) tmp<=load_Svalue;
		else if(en) begin
			if(load)begin
				tmp<=data;
			end
			else if(shift_direction=="left")begin
				tmp<={data[w-2:0],SI};
				SO<=data[w-1];
			end 
			else if(shift_direction=="right") begin
				tmp<={SI,data[w-1:1]};
				SO<=data[0];
			end	
		end
	end
	assign q=tmp;
endmodule 