module zi(clk,modkey,key1,key2,dis,leg,line,row);
input clk;//�����Ƶ��20MHz
input modkey,key1,key2;//�������������
output [7:0]dis,leg;//��ӡ���
output [7:0]line,row;//������Ӧ���

wire f1;//1Hz��Ƶ��
wire f100;//0.01Hz��Ƶ��
wire fs;//ˢ��Ƶ��1kHz

wire [1:0]mkoo;//״̬����������״̬
			   //1.������ʱ��00��
			   //2.�ܱ�01��
			   //3.��ʱ��10��
			   //4.���ӣ�11��
wire [3:0]a,b,c,d,e,f;  //������ʱ�������.��.ʱ
						//a����ĵ�λ
						//b����ĸ�λ
						//c���ֵĵ�λ
						//d���ֵĸ�λ
						//e��ʱ�ĵ�λ
						//f��ʱ�ĵ�λ
wire [3:0]a2,b2,c2,d2,e2,f2;
						//�ܱ�������.��.ʱ
						//a2����ĵ�λ
						//b2����ĸ�λ
						//c2���ֵĵ�λ
						//d2���ֵĸ�λ
						//e2��ʱ�ĵ�λ
						//f2��ʱ�ĵ�λ

wire [3:0]cc,dd,ee,ff;//���ӵ������.ʱ
					  //cc���ֵĵ�λ
					  //dd���ֵĸ�λ
					  //ee��ʱ�ĵ�λ
					  //ff��ʱ�ĵ�λ

wire [7:0]leg1,dis1;//������ʱ�Ĵ�ӡ���
wire [7:0]leg2,dis2;//�ܱ�Ĵ�ӡ���
wire [7:0]leg3,dis3; //���ӵĴ�ӡ�����LED��ʾ��

wire [1:0]k1;//��ʱʱ������˸״̬
wire [1:0]kk1;//������ʱ������˸״̬

wire linerow;// ���ӵĴ�ӡ�����������ʾ��

zhuangtai(modkey,fs,mkoo);//�жϼ���״̬ģ�飨mkoo4��ģʽ��������ʱ.�ܱ�.��ʱ������
					
modchose mc(leg1,dis1,leg2,dis2,leg3,dis3,fs,mkoo,leg,dis);//ѡ��ģʽ���ģ��

fenpin fen(clk,f1,f100,fs);				//��Ƶ������ܱ�ˢ��3��Ƶ�ʡ�

jishi ji(mkoo,key1,key2,f1,fs,a,b,c,d,e,f,kk1);				//��һ��ģʽ������ʱ
print1 p1(mkoo,kk1,fs,a,b,c,d,e,f,leg1,dis1);		//��ʱ�Ĵ�ӡ

paobiao pao(f100,fs,mkoo,key1,key2,a2,b2,c2,d2,e2,f2);//�ܱ�ģ��
print2 p2(fs,a2,b2,c2,d2,e2,f2,leg2,dis2);	//�ܱ�Ĵ�ӡ

naozhong nao(mkoo,key1,key2,f1,c,d,e,f,cc,dd,ee,ff,k1,linerow);//����ģ��
print3 p3(mkoo,k1,fs,cc,dd,ee,ff,leg3,dis3);//��ʱ�Ĵ�ӡģ��
print4 p4(fs,linerow,line,row);//������Ӧʱ�������ӡģ��
endmodule