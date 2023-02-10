module project(clk,OUT,Carry,Sign,Zero,Code,A,B);
input clk;
output reg[3:0]OUT;
output reg Carry,Sign,Zero;
reg [4:0]result;
input [2:0] Code;
input [3:0]A,B;
always @(*)
begin
Carry = 0;
Sign = 0;
case (Code)
3'b001: result = A ^ B;
3'b010:
begin
result = A + B;
Carry = result[4];
end
3'b011: result = A & B;
3'b100:
begin
if (B > A)
begin
result = B - A;
Sign = 1;
end
else
result = A - B;
end
endcase
OUT[3:0] = result[3:0];
if (result == 0)
Zero = 1;
else
Zero = 0;
end
endmodule
