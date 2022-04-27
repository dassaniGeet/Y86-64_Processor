`timescale 1ns / 1ps

module memory(
  clk,icode,valA,valB,valE,valP,valM,datamem
);

  input clk;
  
  input [3:0] icode;
  input [63:0] valP, valA, valE, valB;
  
  output reg [63:0] datamem, valM;

  reg [63:0] data_mem[0:1023];

  always@(posedge clk)
  begin
    if(icode==4'h4) //rmmovq
    begin
      data_mem[valE]=valA;end
    if(icode==4'h5) //mrmovq
    begin
      valM=data_mem[valE];end
    if(icode==4'h8) //call
    begin
      data_mem[valE]=valP;end
    if(icode==4'h9) //ret
    begin
      valM=data_mem[valA];end
    if(icode==4'h10) //pushq
    begin
      data_mem[valE]=valA;end
    if(icode==4'h11) //popq
    begin
      valM=data_mem[valE];end
    datamem=data_mem[valE];end
  
endmodule
