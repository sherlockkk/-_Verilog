//(2)  ѡ��ģʽ����״̬��
module zhuangtai(mk,clkfs,mkoo);//��mkoo4��ģʽ��������ʱ.�ܱ�.��ʱ������
input clkfs;
input mk;

output [1:0]mkoo;//����ģ��֮�������
reg [1:0]mkoo;//�洢ģʽѡ��


always @(posedge clkfs)
begin
	if(mk==0)
		begin
			mkoo=mkoo+2'b01;
		end
end
endmodule