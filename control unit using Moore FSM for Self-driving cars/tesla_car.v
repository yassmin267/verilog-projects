module tesla_car(speed_limit,car_speed,leading_distance,clk,rst,unlock_door,accelerate_car);
	input clk,rst;
	input [7:0] speed_limit;
	input [7:0] car_speed;
	input [6:0] leading_distance;
	output unlock_door, accelerate_car;
	parameter [1:0] stop=2'b00;
	parameter [1:0] accelerate =2'b01;
	parameter [1:0] declerate =2'b10;
	parameter [6:0] min_distane=40;

	reg [1:0] ns,cs;

	//state memory 
	always @(posedge clk or posedge rst) begin 
	if(rst) cs <= stop;
	else cs <=ns ;
	end

	//next state 
	always @(*) begin
		case(cs)
			stop:
			if(leading_distance<min_distane)
				ns=stop;
			else
				ns=accelerate;

			accelerate:
			if((leading_distance<min_distane)||(car_speed>speed_limit))
				ns=declerate;
			else if ((leading_distance>=min_distane)&&(car_speed<speed_limit))
				ns=accelerate;

			declerate:
			if (car_speed==0)
				ns=stop;
			else if((leading_distance<min_distane)||(car_speed>speed_limit))
				ns=declerate;
			else if ((leading_distance>=min_distane)&&(car_speed<speed_limit))
				ns=accelerate;
			endcase // cs
	end

	//outputs
	assign unlock_door=((leading_distance<min_distane)&&(cs==stop))?1'b1:1'b0;
	assign accelerate_car=(((leading_distance>=min_distane)&&(car_speed<speed_limit))&&(cs==accelerate))?1'b1:1'b0;

endmodule 