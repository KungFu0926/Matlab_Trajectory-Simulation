function [Ax,Ay,Maxcolumn,Maxrow]=DrawTrack(HorizonDis,height)
Maxcolumn=min(size(height));%%size會得到column和row, min取最小值也就是column
Maxrow=max(size(height));%%size會得到column和row, min取最小值也就是column
Ax=zeros(Maxcolumn,Maxrow);
Ay=zeros(Maxcolumn,Maxrow);

%疊代軌跡
for i=1:1:Maxcolumn
    for j=1:1:Maxrow
        if height(i,j)<=0 && HorizonDis(i,j)>0
            Ax(i,j)=HorizonDis(i,j-1);
            Ay(i,j)=height(i,j-1);
            break;
        else
            Ax(i,j)=HorizonDis(i,j);
            Ay(i,j)=height(i,j);
        end
    end
end

%繪圖
hold on
for i=1:1:Maxcolumn
    line=plot(Ax(i,:),Ay(i,:));
    set(line,'linewidth',2);
end
for i=1:1:Maxcolumn
        for j=1:1:Maxrow-1
            if Ay(i,j)>1.50 & Ay(i,j)<1.60
                LimPoint=plot(Ax(i,j),Ay(i,j),'r.');
                set(LimPoint,'MarkerSize',10);
            end
        end
end
%legend("殺球","平抽球","低位高遠球","高位高遠球","近網吊球","軌道最高點")
legend("Y1","Y2","Y3","高度1.50~1.60")
xlabel("水平距離");
ylabel("垂直高度");
hold off
end



% MaxDis=zeros(1,Maxcolumn);
% MaxHeight=zeros(1,Maxcolumn);
% tem=zeros(1,Maxcolumn);%最高點發生的位置
% 找出最高點
% for i=1:1:Maxcolumn
%     for j=1:1:Maxrow-1
%         if Ay(i,j)<Ay(i,j+1)
%             MaxHeight(1,i)=Ay(i,j+1);
%             MaxDis(1,i)=Ax(i,j+1);
%             tem(1,i)=j+1;
%         else
%             MaxHeight(1,i)=Ay(i,j);
%             MaxDis(1,i)=Ax(i,j);
%             break;
%         end
% 
%     end
% end
%plot(MaxDis(1,:),MaxHeight(1,:),'*b')