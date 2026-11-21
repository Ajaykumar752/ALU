`timescale 1ns / 1ps
module alu(a,b,alu_sel,x,y);
input[3:0]a,b;
input[3:0]alu_sel;
output reg[3:0]x,y;
always@(a,b,alu_sel)
begin

    x=4'b0000;
    y=4'b0000;

case(alu_sel)
    4'b0000: x=a+b;
    4'b0001: x=a-b;
    4'b0010: x=a*b;
    4'b0011: x=a/b;
    4'b0100: x=~a;
    4'b0101: x=a|b;
    4'b0110: x=a&b;
    4'b0111: x=a^b;

    4'b1000: x={3'b000,|a};
    4'b1001: x={3'b000,&a};
    4'b1010: x={3'b000,^a};
    4'b1011: x={3'b000,!a};
    4'b1100: x={3'b000,(a==b)};

    4'b1101:{y,x} = a*b;
    4'b1110:{y,x} = a<<b;
    4'b1111:{y,x} = a>>b;
    
   default:begin

    x=4'b0000;
    y=4'b0000;

   end

  endcase

 end
endmodule
