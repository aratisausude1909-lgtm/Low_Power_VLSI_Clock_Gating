module baseline (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

initial begin
    data_out = 8'b00000000;
end

always @(posedge clk) begin
    if (rst)
        data_out <= 8'b00000000;
    else
        data_out <= data_in;
end

endmodule