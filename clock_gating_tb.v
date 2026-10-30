
`timescale 1ns/1ps

module clock_gating_tb;

reg clk;
reg rst;
reg enable;
reg [7:0] data_in;
wire [7:0] data_out;

clock_gating uut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("clock_gating.vcd");
    $dumpvars(0, clock_gating_tb);

    clk = 0;
    rst = 1;
    enable = 0;
    data_in = 0;

    #10;
    rst = 0;

    enable = 1;
    data_in = 15;
    #10;

    data_in = 240;
    #10;

    enable = 0;
    data_in = 170;
    #10;

    data_in = 85;
    #10;

    enable = 1;
    data_in = 255;
    #10;

    $finish;
end

endmodule
