`timescale 1ns / 1ps

module decode_wb(
  clk,icode,rA,rB,cnd,
  valA,valB,
  valE,valM,
  reg_mem0,reg_mem1,reg_mem2,reg_mem3,reg_mem4,reg_mem5,
  reg_mem6,reg_mem7,reg_mem8,reg_mem9,reg_mem10,reg_mem11,
  reg_mem12,reg_mem13,reg_mem14
);

  input cnd, clk;
  input [3:0] rA, rB, icode;
  input [63:0] valE;
  input [63:0] valM;
  output reg [63:0] valA, valB;

  output reg [63:0] reg_mem14, reg_mem13, reg_mem12, reg_mem11, reg_mem10, reg_mem9, reg_mem8, reg_mem7, reg_mem6, reg_mem5, reg_mem4, reg_mem3, reg_mem2, reg_mem1, reg_mem0;
  reg [63:0] reg_mem[0:14];

  initial begin
    reg_mem[0]=64'd0;
    reg_mem[1]=64'd1;
    reg_mem[2]=64'd2;
    reg_mem[3]=64'd3;
    reg_mem[4]=64'd4;
    reg_mem[5]=64'd5;
    reg_mem[6]=64'd6;
    reg_mem[7]=64'd7;
    reg_mem[8]=64'd8;
    reg_mem[9]=64'd9;
    reg_mem[10]=64'd10;
    reg_mem[11]=64'd11;
    reg_mem[12]=64'd12;
    reg_mem[13]=64'd13;
    reg_mem[14]=64'd14;
  end
  always@(posedge clk)
  begin
    if(icode==4'h2)
    begin
      valA=reg_mem[rA];
    end
    else if(icode==4'h4)
    begin
      valA=reg_mem[rA];
      valB=reg_mem[rB];
    end
    else if(icode==4'h5)
    begin
      valB=reg_mem[rB];
    end
    else if(icode==4'h6)
    begin
      valA=reg_mem[rA];
      valB=reg_mem[rB];
    end
    else if(icode==4'h8)
    begin
      valB=reg_mem[4];
    end
    else if(icode==4'h9)
    begin
      valA=reg_mem[4];
      valB=reg_mem[4];
    end
    else if(icode==4'h10)
    begin
      valA=reg_mem[rA];
      valB=reg_mem[4];
    end
    else if(icode==4'h11)
    begin
      valA=reg_mem[4];
      valB=reg_mem[4];
    end
    reg_mem7=reg_mem[7];
    reg_mem8=reg_mem[8];
    reg_mem9=reg_mem[9];
    reg_mem10=reg_mem[10];
    reg_mem11=reg_mem[11];
    reg_mem12=reg_mem[12];
    reg_mem13=reg_mem[13];
    reg_mem14=reg_mem[14];
    reg_mem0=reg_mem[0];
    reg_mem1=reg_mem[1];
    reg_mem2=reg_mem[2];
    reg_mem3=reg_mem[3];
    reg_mem4=reg_mem[4];
    reg_mem5=reg_mem[5];
    reg_mem6=reg_mem[6];
  end

  always@(negedge clk)
  begin
    if(icode==4'h2)
    begin
      if(cnd==1'h1)
      begin
        reg_mem[rB]=valE;
      end
    end
    else if(icode==4'h3)
    begin
      reg_mem[rB]=valE;
    end
    else if(icode==4'h5)
    begin
      reg_mem[rA]=valM;
    end
    else if(icode==4'h6)
    begin
      reg_mem[rB]=valE;
    end
    else if(icode==4'h8)
    begin
      reg_mem[4]=valE;
    end
    else if(icode==4'h9)
    begin
      reg_mem[4]=valE;
    end
    else if(icode==4'h10)
    begin
      reg_mem[4]=valE;
    end
    else if(icode==4'h11)
    begin
      reg_mem[4]=valE;
      reg_mem[rA]=valM;
    end
    reg_mem8=reg_mem[8];
    reg_mem9=reg_mem[9];
    reg_mem10=reg_mem[10];
    reg_mem11=reg_mem[11];
    reg_mem12=reg_mem[12];
    reg_mem13=reg_mem[13];
    reg_mem14=reg_mem[14];
    reg_mem0=reg_mem[0];
    reg_mem1=reg_mem[1];
    reg_mem2=reg_mem[2];
    reg_mem3=reg_mem[3];
    reg_mem4=reg_mem[4];
    reg_mem5=reg_mem[5];
    reg_mem6=reg_mem[6];
    reg_mem7=reg_mem[7];
  end

endmodule
