module alu_32bit_case(y,a,b,f);
input [31:0]a;
input [31:0]b;
input [2:0]f; 
output reg [31:0]y; 
always@(*)
begin 
case(f)
3'b000:y=a&b; //AND Operation 
3'b001:y=a|b; //OR Operation 
3'b010:y=~(a&b); //NAND Operation
3'b011:y=~(a|b); //NOR Operation
3'b010:y=a+b; //Addition
3'b011:y=a-b; //Subtraction
3'b100:y=a*b; //Multiply 
default:y=32'bx;
endcase 
end 
endmodule

Test Bench:
module alu_32bit_tb_case;
reg [31:0]a;
reg [31:0]b;
reg [2:0]f;
wire [31:0]y;
alu_32bit_case test2(.y(y),.a(a),.b(b),.f(f)); 
initial begin 
a=32'h00000000; b=32'hFFFFFFFF;
#10 f=3'b000;
#10 f=3'b001;
#10 f=3'b010;
#10 f=3'b100;
end
initial 
#50 $finish; 
endmodule
