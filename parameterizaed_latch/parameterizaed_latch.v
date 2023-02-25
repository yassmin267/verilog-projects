module parameterized_latch (d,aset,gate,aclr,q);
parameter w=4;
    input aset,gate,aclr;
    input [w-1:0] d;
    output reg [w-1:0] q;

    always @(gate or aclr or aset or d) begin
        if (aclr)   // to clear op =0
            q<=4'b0000;
        else if (aset) // to set op= 1
            q<=4'b1111;
        else if(gate)  //like clk to load data in output 
            q<=d;
    end

endmodule 