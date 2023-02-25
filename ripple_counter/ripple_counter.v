module DFF(d,rstn,clk,q,q_bar);
	input d,rstn, clk;
	output reg q;
	output q_bar;
	always @(posedge clk, negedge rstn)begin
		if(~rstn)
			q<=0;
		else 
			q<=d;
	end
	assign q_bar=~q;
endmodule 

module ripple_counter (clk,rstn,out);
	input clk,rstn;
	output [3:0]out;
	
	wire q0,qn0,q1,qn1,q2,qn2,q3,qn3;

	DFF D0(.d(qn0),.rstn(rstn),.clk(clk),.q(q0),.q_bar(qn0));
	DFF D1(.d(qn1),.rstn(rstn),.clk(q0),.q(q1),.q_bar(qn1));
	DFF D2(.d(qn2),.rstn(rstn),.clk(q1),.q(q2),.q_bar(qn2));
	DFF D3(.d(qn3),.rstn(rstn),.clk(q2),.q(q3),.q_bar(qn3));

	assign out ={qn3,qn2,qn1,qn0};

endmodule 
