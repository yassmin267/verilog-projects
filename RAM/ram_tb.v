module RAM_PROJECT_tb();
	reg [9:0]din;
	reg clk,rstn,rx_valid;
	wire [7:0]dout;
	wire tx_valid;
	
	//reg [7:0]mem[Addr_size-1:0];
	wire [9:0]wr_addr,rd_addr;
	RAM_PROJECT r1(din,clk,rstn,rx_valid,dout,tx_valid);

	initial begin
		clk=0;
		forever 
		#1 clk=~clk;
	end
	initial begin
		$readmemh("mem.dat",r1.mem);
		rstn=0;
		rx_valid=0;
		#10
		rstn=1;
		din=10'b0000000001;
		rx_valid=1;
		#10
		din=10'b0100000001;
		rx_valid=1;
		#10
		din=10'b1000000001;
		rx_valid=1;
		#10
		din=10'b1000000001;
		rx_valid=1;
		#10
		$stop;
	end
endmodule 
