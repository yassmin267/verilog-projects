module SLE(D,clk,En,ALn,ADn,SLn,SD,LAT,Q);
	input D,clk,En,ALn,ADn,SLn,SD,LAT;
	output reg Q;

	always @(*) begin 
		if (LAT) begin
			if(~ALn) begin
				Q<= !ADn;
			end 
			else if (En) begin
				if (~SLn) begin
					Q<=SD;
				end
				else begin
					Q<=D;
				end
			end
		end
	end

	always @(posedge clk or negedge ALn) begin
		if (~LAT) begin
			if(~ALn) begin
				Q<= !ADn;
			end 
			else if (En) begin
				if (~SLn) begin
					Q<=SD;
				end
				else begin
					Q<=D;
				end
			end
		end
	end

	
endmodule 