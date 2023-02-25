module tesla_car_tb();
	reg clk,rst;
	reg [7:0] speed_limit;
	reg [7:0] car_speed;
	reg [6:0] leading_distance;
	wire unlock_door, accelerate_car;

	tesla_car t(speed_limit,car_speed,leading_distance,clk,rst,unlock_door,accelerate_car);

	initial begin
		clk=0;
		forever
		#1 clk=~clk;
	end

	initial begin
		rst=1;
		speed_limit=0;
		car_speed=0;
		leading_distance=0;
		#100
		rst=0;
		#100
		//test if leading_distance<min_distane 40 only "test stop"
		//go to stop so unlock_door=1
		speed_limit=0;
		car_speed=0;
		leading_distance=30;
		#100
		speed_limit=0;
		car_speed=0;
		leading_distance=50;
		#100
		speed_limit=30;
		car_speed=10;
		leading_distance=50;
		#100
		speed_limit=30;
		car_speed=10;
		leading_distance=20;
		#100
		$stop;
	end
	initial begin
		$monitor("speed_limit=%d,car_speed=%d,leading_distance=%d,clk=%b,rst=%b,unlock_door=%d,accelerate_car=%d",speed_limit,car_speed,leading_distance,clk,rst,unlock_door,accelerate_car);	
	end
endmodule 