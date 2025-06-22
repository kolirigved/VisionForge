`timescale 1ns/1ns
`include "CryptoLock.v"
module CryptoLock_tb;
    reg j;
    reg k;
    reg clk;
    wire Q;

    always #10 clk = ~clk;

    JKff uut(clk,j,k,Q);

    initial begin
        $dumpfile("CryptoLock_tb.vcd");
        $dumpvars(0,CryptoLock_tb);
        clk=0;
        j=0;k=0;
        #5;
        j=1;k=0;
        #40;
        j=0;k=1;
        #40;
        j=1;k=1;
        #45;
        j=1;k=0;
        #20;
        $display("Test Completed");
        $finish;
    end
endmodule