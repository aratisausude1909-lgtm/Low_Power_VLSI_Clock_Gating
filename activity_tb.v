
`timescale 1ns/1ps

module activity_tb;

reg clk, rst, enable;
reg [7:0] data_in;

wire [7:0] baseline_out;
wire [7:0] gated_out;

integer baseline_transitions = 0;
integer gated_transitions = 0;

reg [7:0] prev_baseline;
reg [7:0] prev_gated;

baseline b1 (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(baseline_out)
);

clock_gating g1 (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .data_in(data_in),
    .data_out(gated_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("activity.vcd");
    $dumpvars(0, activity_tb);

    clk = 0;
    rst = 1;
    enable = 0;
    data_in = 0;

    prev_baseline = 0;
    prev_gated = 0;

    #10;
    rst = 0;

    enable = 1;
    data_in = 8'h0F;
    #10;

    data_in = 8'hF0;
    #10;

    enable = 0;
    data_in = 8'hAA;
    #10;

    data_in = 8'h55;
    #10;

    enable = 1;
    data_in = 8'hFF;
    #10;

    $display("Simulation completed.");
    $display("Baseline output transitions: %0d",
             baseline_transitions);
    $display("Clock-enable output transitions: %0d",
             gated_transitions);

    $finish;
end

always @(baseline_out) begin
    if (!$isunknown(baseline_out) &&
        !$isunknown(prev_baseline)) begin
        if (baseline_out != prev_baseline)
            baseline_transitions =
                baseline_transitions + 1;
    end
    prev_baseline = baseline_out;
end

always @(gated_out) begin
    if (!$isunknown(gated_out) &&
        !$isunknown(prev_gated)) begin
        if (gated_out != prev_gated)
            gated_transitions =
                gated_transitions + 1;
    end
    prev_gated = gated_out;
end

endmodule

