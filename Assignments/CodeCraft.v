module CodeCraft(input clk, input in, output reg out);
    wire D;
    assign D = in^out;
    always @(posedge clk) begin
        out <= D;
    end 
endmodule