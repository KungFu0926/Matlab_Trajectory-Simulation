function [HorizonDis,height]=trackcal(Vi,deg,InitialPos)
%[HorizonDis,height]=trackcal([80;50;50;60;30],[-10;0;50;40;8],[2;1.6;0.9;1.7;1.2])要用分號不能用逗號
%殺球,平球,低位高遠球,高位高遠球,近網吊球
%[HorizonDis,height]=trackcal([30;56;56],[30;30;60],[0;0;0])
%legend("Y1","Y2","Y3","高度1.50~1.60")

m=5.19;
G=9.8;
n=2;
b=1.23;
sita=deg*pi/180;
t=0:0.001:10;%由這個參數控制Maxrow和Maxcolumn的大小，這裡10001

Vt=(m.*G./b).^(1./n);
Vxi=cos(sita).*Vi;
Vyi=sin(sita).*Vi;

k1=Vt.^2;
k2=(Vxi.* G.*t+k1)./k1;
HorizonDis=(k1./G).*log(k2);
s1=atan(Vt./Vyi);
s2=(G.*t./Vt)+s1;
height=(Vt.^2./G).*log(abs(sin(s2)./sin(s1)))+InitialPos;
end




