`timescale 1ns / 1ps
module pc_update(
  clk,PC,cnd,icode,valC,valM,valP,
  updated_pc
);
  input clk, cnd;
  input [3:0] icode;
  input [63:0] PC, valM, valP, valC;
  output reg [63:0] updated_pc;

  always@(posedge clk)
  begin
    if(icode==4'h9)
    begin
      updated_pc=valM;end
      else if(icode==4'h7)
    begin
      if(cnd==1'h)
      begin
        updated_pc=valC;end
      begin
        updated_pc=valP;end
    end
    else 
    else if(icode==4'h8)
    begin
      updated_pc=valC;end
    else
    begin
      updated_pc=valP;end
  end

endmodule
