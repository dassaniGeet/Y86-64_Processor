`timescale 1ns / 1ps

module fetch(
  clk,PC,
  icode,ifun,rA,rB,valC,valP,instr_valid,imem_error,hlt
);
  output reg [3:0] rA, rB, ifun, icode; 
  output reg [63:0] valP, valC;
  output reg imem_error, hlt, instr_valid;
  input clk;
  input [63:0] PC;
  reg [0:79] instr;
  reg [7:0] instr_mem[0:1023];

  initial begin

    instr_mem[37]=8'h32;
    instr_mem[38]=8'h4;
    instr_mem[39]=8'h16;
    instr_mem[40]=8'h16;
    instr_mem[41]=8'h16;
    instr_mem[42]=8'h16;
    instr_mem[43]=8'h16;
    instr_mem[44]=8'h16;
    instr_mem[45]=8'h0;

  end  

  always@(posedge clk) 
  begin 

    imem_error=0;
    if(PC>1023)
    begin
      imem_error=1;
    end

    instr={
      instr_mem[PC],
      instr_mem[PC+1],
      instr_mem[PC+2],
      instr_mem[PC+3],
      instr_mem[PC+4],
      instr_mem[PC+5],
      instr_mem[PC+6],
      instr_mem[PC+7],
      instr_mem[PC+8],
      instr_mem[PC+9]
    };

    icode= instr[0:3];
    ifun= instr[4:7];

    instr_valid=1'b1;

    if(icode==4'b0000) //halt
    begin
      hlt=1;
      valP=PC+64'd1;
    end
    else if(icode==4'b0001) //nop
    begin
      valP=PC+64'd1;
    end
    else if(icode==4'b0010) //cmovxx
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valP=PC+64'd2;
    end
    else if(icode==4'b0011) //irmovq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valC=instr[16:79];
      valP=PC+64'd10;
    end
    else if(icode==4'b0100) //rmmovq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valC=instr[16:79];
      valP=PC+64'd10;
    end
    else if(icode==4'b0101) //mrmovq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valC=instr[16:79];
      valP=PC+64'd10;
    end
    else if(icode==4'b0110) //OPq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valP=PC+64'd2;
    end
    else if(icode==4'b0111) //jxx
    begin
      valC=instr[8:71];
      valP=PC+64'd9;
    end
    else if(icode==4'b1000) //call
    begin
      valC=instr[8:71];
      valP=PC+64'd9;
    end
    else if(icode==4'b1001) //ret
    begin
      valP=PC+64'd1;
    end
    else if(icode==4'b1010) //pushq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valP=PC+64'd2;
    end
    else if(icode==4'b1011) //popq
    begin
      rA=instr[8:11];
      rB=instr[12:15];
      valP=PC+64'd2;
    end
    else 
    begin
      instr_valid=1'b0;
    end
  end

endmodule
