`include "dpi.sv"

module top ();
  bit clk;
  bit rst_n;
  logic [127:0] rdat;
  logic [15:0] rdatk;
  logic [3:0] rdatv;
  logic [127:0] tdat;
  logic [15:0] tdatk;
  logic [3:0] tdatv;

  dpi #(
      .LANS (4),
      .WIDTH(279620)
  ) dpi_u (
      .clk  (clk),
      .rst_n(rst_n),
      .rdat (rdat),
      .rdatk(rdatk),
      .rdatv(rdatv),
      .tdat (tdat),
      .tdatk(tdatk),
      .tdatv(tdatv)
  );
  always #5 clk = ~clk;
  initial begin
    clk   <= 0;
    rst_n <= 0;

    rdat  <= 128'h11111111111111111111111111111111;
    rdatk <= 16'h1111;
    rdatv <= 4'h1;
    tdat  <= 128'h22222222222222222222222222222222;
    tdatk <= 16'h2222;
    tdatv <= 4'h2;

    #5;
    rst_n <= 1;
    #100;
    $finish();
  end
  always @(posedge clk) begin
    rdat  <= rdat + 1;
    rdatk <= rdatk + 1;
    rdatv <= rdatv + 1;
    tdat  <= tdat + 1;
    tdatk <= tdatk + 1;
    tdatv <= tdatv + 1;

  end


endmodule
