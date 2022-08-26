`include "dpi.sv"

module top();
    bit clk;
    bit rst_n;
    logic[543:0] rdat;
    logic[16:0] rdatk;
    logic[3:0] rdatv;
    logic[543:0] tdat;
    logic[16:0] tdatk;
    logic[3:0] tdatv;

    dpi #(
        .LANS(4),  
        .WIDTH('h044444)
    )dpi_u(
        .clk(clk),
        .rst_n(rst_n),
        .rdat(rdat),
        .rdatk(rdatk),
        .rdatv(rdatv),
        .tdat(tdat),
        .tdatk(tdatk),
        .tdatv(tdatv)
    );
    always #5 clk=~clk;
    initial begin
        clk<=0;
        rst_n<=0;

        rdat <= 1;
        rdatk <= 2;
        rdatv <= 3;
        tdat <= 4;
        tdatk <= 5;
        tdatv <= 6;

        #10;
        rst_n<=1;
        #100;
        $finish();
    end
    always @(posedge clk) begin
        rdat <= rdat + 1;
        rdatk <= rdatk + 1;
        rdatv <= rdatv + 1;
        tdat <= tdat + 1;
        tdatk <= tdatk + 1;
        tdatv <= tdatv + 1;
 
    end


endmodule