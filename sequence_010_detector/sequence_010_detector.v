module sequence_010_detector(x,clk,rst,y,count);
	input x,clk,rst;
	output reg y;
	output reg[9:0]count=0;
	parameter A=2'b00; //reset state
	parameter B=2'b01;
	parameter C=2'b10;
	parameter D=2'b11;
	reg [1:0]cs,ns;

	//state memory 
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			cs<=A;
		end else begin
			cs<=ns ;
		end
	end

	//next state 
	always @(cs,x) begin
		case (cs)
			A:  
			if(x)
				ns=A;
			else ns=B;

			B: //0
			if(x)
				ns=C;
			else ns=B;

			C: //01
			if(x)
				ns=A;
			else ns=D;

			D: //010
			if(x)
				ns=A;
			else ns=B;

			default : ns=A;
		endcase
	end

	//output logic 
	always @(cs) begin
		case (cs)
			A: y=1'b0;
			B: y=1'b0;
			C: y=1'b0;
			D: 
			begin
				y=1'b1;
				count=count+1;
			end 
		endcase
	end
endmodule