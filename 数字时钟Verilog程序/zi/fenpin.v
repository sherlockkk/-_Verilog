module fenpin(clk,f1Hz,f100Hz,f);//��Ƶ������ܱ�ˢ��3��Ƶ��

input clk;
output f1Hz,f100Hz,f;//����ģ��֮�������,����Ϊwire�͵�
reg f1Hz,f100Hz,f;

integer i,j,k;

always @(posedge clk)
begin
	if(i==9999999)
		begin
			f1Hz=~f1Hz;//���Ƶ��1Hz
			i=0;
		end
	else
		i=i+1;	
end 
always @(posedge clk)
begin
	if(j==99999)
		begin
			f100Hz=~f100Hz;//�ܱ�Ƶ��100Hz
			j=0;
		end
	else
		j=j+1;	
end 
always @(posedge clk)
begin
	if(k==9999)
		begin
			f=~f;//ˢ��Ƶ��1kHz
			k=0;
		end
	else
		k=k+1;	
end 
endmodule