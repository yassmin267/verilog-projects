module segment_tb;
	// Inputs
	reg [3:0] x;
	// Outputs
	wire [6:0] z;
	// Instantiate the Unit Under Test (UUT)
	hexto7segment uut (
		.op(x), 
		.z(z)
	);
 
	initial begin
		// Initialize Inputs
		x = 0;
	#100 x = 1;
	#100 x = 2;
	#100 x = 3;	
	#100 x = 4;	
	#100 x = 5;
	#100 x = 6;
	#100 x = 7;	
	#100 x = 8;	
	#100 x = 9;
	#100 x = 10;
	#100 x = 11;	
	#100 x = 12;	
	#100 x = 13;
	#100 x = 14;
	#100 x = 15;	
	#40;
    end  
 
		initial begin
		 $monitor("x=%h,z=%7b",x,z);
		 end
 
endmodule