module baseline_tb;

reg clk;
reg rst;
reg [7:0] data_in;
wire [7:0] data_out;

baseline uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("baseline.vcd");
    $dumpvars(0, baseline_tb);

    clk = 0;
    rst = 1;
    data_in = 0;

    #10;
    rst = 0;

    data_in = 15;
    #10;
    data_in = 240;
    #10;
    data_in = 170;
    #10;
    data_in = 85;
    #10;
    data_in = 255;
    #10;

    $finish;

end

endmodule