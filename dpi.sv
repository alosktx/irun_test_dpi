import "DPI-C" function void Write(input bit[63:0] sim_time, input int type_h, input bit[127:0] data);

module dpi #(
    parameter LANS=4,
    parameter WIDTH='h044444
)(
    input clk,
    input rst_n,
    input [LANS*(WIDTH>>16)*8-1:0] rdat,
    input [LANS*(WIDTH>>16)-1:0] rdatk,
    input [LANS-1:0] rdatv,
    input [LANS*(WIDTH>>16)*8-1:0] tdat,
    input [LANS*(WIDTH>>16)-1:0] tdatk,
    input [LANS-1:0] tdatv
);
reg [63:0] counter;
always @(posedge clk) begin
    if(!rst_n) begin
        counter<=0;
    end else begin
        counter<=counter+1;
        Write(counter, 6'h0, rdat);
        Write(counter, 6'h1, rdatk);
        Write(counter, 6'h2, rdatv);
        Write(counter, 6'h3, tdat);
        Write(counter, 6'h4, tdatk);
        Write(counter, 6'h5, tdatv);
    end
end
    
endmodule