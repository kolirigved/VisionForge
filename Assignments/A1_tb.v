`timescale 1ns/1ns
`include "A1.v"

module A1_tb;
reg A, B;
wire sum, carry;
HalfAdder uut(A,B,sum,carry);
initial begin
    $dumpfile("A1_tb.vcd");
    $dumpvars(0,A1_tb);
    A=0;B=0;#20;
    A=0;B=1;#20;
    A=1;B=0;#20;
    A=1;B=1;#20;
end
endmodule