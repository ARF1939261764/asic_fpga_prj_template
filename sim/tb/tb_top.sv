`timescale 1ns/1ps
module tb_top;


top top();

reg clk;
initial begin
  forever begin
    #5 clk = ~clk;
  end
end


initial begin
  $fsdbDumpfile("wave.fsdb");
  $fsdbDumpvars();
  $fsdbDumpMDA();
end

endmodule
// Local Variables:
// verilog-auto-tieoff-declaration:"assign"
// verilog-library-flags:("-y ./" "-y ../../design/")
// verilog-library-extensions:(".v" ".sv")
// End:

