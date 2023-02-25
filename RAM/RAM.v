module RAM(din,clk,rstn,rx_valid,dout,tx_valid);

	//inputs
	input [9:0]din;
	input clk,rstn,rx_valid;

	//output
	output reg [7:0]dout;
	output reg tx_valid;

    //Parameter 
	parameter Addr_size=8;
	parameter mem_depth=256;

	//internal signal 
	reg [7:0]mem[mem_depth-1:0];
	reg [Addr_size-1:0]wr_addr,rd_addr;

	always @(posedge clk or negedge rstn) begin 
		if(~rstn) begin
			dout <= 0;
			tx_valid<=0;
		end	
		else if(rx_valid) begin
			if(din[9:8]==2'b00) begin
				wr_addr<=din[7:0];
			    tx_valid<=0;
			end
			else if(din[9:8]==2'b01) begin
				mem[wr_addr]<=din[7:0];
				tx_valid<=0;
			end	
			else if(din[9:8]==2'b10) begin
				rd_addr<=din[7:0];
				tx_valid<=0;
			end
				
			else if(din[9:8]==2'b11) begin
				dout<=mem[rd_addr];
				tx_valid<=1;
			end				
		end			
	end
endmodule