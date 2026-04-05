module uart_monitor (
  input logic      clk,
  input logic      rst_n,
  input logic      io_in_valid,
  input logic[7:0] io_in_bits
);

always @(posedge clk) begin
  if(io_in_valid) begin
    if(io_in_bits == 0) begin
      #1us;
      $finish;
    end
    else begin
      $write("%c",io_in_bits);
    end
  end
end

endmodule
