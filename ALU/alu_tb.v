module tb_alu;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] op;
    wire [3:0] out;

    alu uut ( 
        .a(A), 
        .b(B), 
        .op(op), 
        .out(out));
    
    initial begin
        A = 4'b1010;  //10
        B = 4'b0011; //3
        op = 2'b00; #100; //out= 13
        op = 2'b01; #100; //out= 7
        op = 2'b10; #100; // out= 1011 = 11
        op = 2'b11; #100; // out=1001  = 9
    end
    initial begin
    $monitor("A=%d ,B=%d : Result=%d ",A,B,out); 
    end        
endmodule