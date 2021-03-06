//闹钟响应时的准备显示模块：
module  print4(fs,linerow,line,row);//闹钟响应时矩阵的显示模块（显示时间1s）
input fs;
input linerow;
output [7:0]line,row;
reg 	[7:0]line,row;
reg  [3:0]r; 
always @(posedge fs)
begin
	case(linerow)
	1'b1:begin 
		case(r)
			4'b0000:begin line<=8'b00000001;row<=8'b10000001;end
			4'b0001:begin line<=8'b00000010;row<=8'b01111110;end
			4'b0010:begin line<=8'b00000100;row<=8'b01001010;end
			4'b0011:begin line<=8'b00001000;row<=8'b00111110;end
			4'b0100:begin line<=8'b00010000;row<=8'b00111110;end
			4'b0101:begin line<=8'b00100000;row<=8'b01001010;end
			4'b0110:begin line<=8'b01000000;row<=8'b01111110;end
			4'b0111:begin line<=8'b10000000;row<=8'b10000001;end
				default:;
				endcase
				r<=r+4'b0001;
			if(r==4'b0111)r<=4'b0000;
		end 
	default:begin line<=8'b00000000;row<=8'b00000000;end
	endcase
end
endmodule