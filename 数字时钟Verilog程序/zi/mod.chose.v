module modchose(leg1,dis1,leg2,dis2,leg3,dis3,clk,modkey,lego,diso);//ѡ��ģʽ��������ʾģ��
input clk;
input [1:0]modkey;
input [7:0]leg1,dis1;
input [7:0]leg2,dis2;
input [7:0]leg3,dis3;

output [7:0]lego,diso;
reg	[7:0]lego,diso;


always @(posedge clk)
begin
	case(modkey)
	
 	2'b00://������ʱ��ʾ
	begin
			lego<=leg1;
			diso<=dis1;
		end
	2'b01://�ܱ���ʾ
	 	begin
			lego<=leg2;
			diso<=dis2;
		end
	2'b10://��ʱ��ʾ
	 	begin
			lego<=leg1;
			diso<=dis1;
		end
	2'b11://������ʾ
	 	begin
			lego<=leg3;
			diso<=dis3;
		end
	endcase
end
endmodule