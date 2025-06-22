module decoder1to2 (
    input X,
    output Y0,
    output Y1
);
    assign Y0 = ~X;
    assign Y1 = X;
endmodule