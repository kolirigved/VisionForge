`timescale 1ns/1ns
`include "CodeCraft.v"

module CodeCraft_tb;
    reg in;
    reg clk;
    wire out;
    always #10 clk = ~clk;
    CodeCraft uut(clk,in,out);
    initial begin
        $dumpfile("CodeCraft_tb.vcd");
        $dumpvars(0,CodeCraft_tb);
        clk=0;
        in=0;
        #45;
        in=1;
        #50;
        $display("Test Complete");
        $finish;
    end
endmodule