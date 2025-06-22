`timescale 1ns/1ns
`include "A2.v"

module A2_tb;
reg X;
wire Y0;
wire Y1;

decoder1to2 uut(X,Y0,Y1);

initial begin
    $dumpfile("A2_tb.vcd");
    $dumpvars(0,A2_tb);
    X=0;
    #20;
    X=1;
    #20;
    $display("Test Completed");

end
endmodule