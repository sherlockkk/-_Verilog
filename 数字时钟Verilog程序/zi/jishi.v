//��4��������ʱģ�飺
module jishi(mk,key1,key2,f1Hz,clk,a,b,c,d,e,f,k1);//��һ��ģʽ������ʱ
input f1Hz,clk;
input [1:0]mk;
input key1,key2;
output [3:0]a,b,c,d,e,f;
output [1:0]k1;
reg		[1:0]k1;
reg    k2;
reg  [3:0]a,b,c,d,e,f;
reg  [3:0]cc,ee,ff;

reg k1k,k2k;
always @(posedge clk)//��ʱʱ�İ���״̬
begin
	if(mk==2'b10)
begin	
	if(key1==0)
		begin
			if(k1k==0)
				begin
					 k1=k1+2'b01;
				end 
					k1k=1;
		end		
			else
				k1k=0;
			
	if(key2==0)
		begin
			if(k2k==0)
				begin
					k2=1'b1;
				end 
						k2k=1;
		end 
			else
				begin
				k2k=0;
				k2=1'b0;
				end
	end
	cc=c;
	ee=e;
	ff=f;
	if(mk==2'b10&&k1==2'b00||mk==2'b10&&k1==2'b10)//��ʱ������
		if(k2)
			begin
				cc=cc+4'b0001;
			if(cc==4'b1010)cc=4'b0000;
			
			end
	if(mk==2'b10&&k1==2'b01||mk==2'b10&&k1==2'b11)//��ʱ����ʱ
		if(k2)
			begin
				ee=ee+4'b0001;
				if(ee==4'b1010||f==4'b0010&&ee==4'b0100)begin ee=4'b0000;ff=4'b0000;end
			end


end
always @(posedge f1Hz)//������ʱ
begin
	c<=cc;
	e<=ee;
	f<=ff;
	a<=a+4'b0001;//���λ
	if(a==4'b1001)
		begin
			a<=4'b0000;
			b<=b+4'b0001;
		end
	if(b==4'b0101&&a==4'b1001)//���λ
		begin
			b<=4'b0000;
			c<=c+4'b0001;
		end
	if(c==4'b1001)//�ֵ�λ
		begin
			c<=4'b0000;
			d<=d+4'b0001;
		end
	if(d==4'b0101&&c==4'b1001)//�ָ�λ
		begin
			d<=4'b0000;
			e<=e+4'b0001;
		end
	if(e==4'b1001)//ʱ��λ
		begin
			e<=4'b0000;
			f<=f+4'b0001;
		end
	if(f==4'b0010&&e==4'b0100)//ʱ��λ
		begin
			e<=4'b0000;
			f<=4'b0000;
		end
end
endmodule