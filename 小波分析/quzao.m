%%初始化程序
clear,clc
t1=clock;
 %% 载入噪声信号数据，数据为.mat格式，并且和程序放置在同一个文件夹下
x = 0:0.06:10;
YSJ  = sin(x)+0.2*rand(size(x));

plot(YSJ);
title('原始数据');
 %% 数据预处理，数据可能是存储在矩阵或者是EXCEL中的二维数据，衔接为一维的，如果数据是一维数据，此步骤也不会影响数据
[c,l]=size(YSJ);
Y=[];
for i=1:c
    Y=[Y,YSJ(i,:)];
end
[c1,l1]=size(Y);
X=[1:l1];
 %% 绘制噪声信号图像
figure(1);
plot(X,Y);
xlabel('横坐标');
ylabel('纵坐标');
title('原始信号');
 %% 硬阈值处理
lev=3;
xd=wden(Y,'heursure','h','one',lev,'db4');%硬阈值去噪处理后的信号序列
figure(2)
plot(X,xd)
xlabel('横坐标');
ylabel('纵坐标');
title('硬阈值去噪处理')
set(gcf,'Color',[1 1 1])
 %% 软阈值处理
lev=3;
xs=wden(Y,'heursure','s','one',lev,'db4');%软阈值去噪处理后的信号序列
figure(3)
plot(X,xs)
xlabel('横坐标');
ylabel('纵坐标');
title('软阈值去噪处理')
set(gcf,'Color',[1 1 1])
%% 固定阈值后的去噪处理
lev=3;
xz=wden(Y,'sqtwolog','s','sln',lev,'db4');%固定阈值去噪处理后的信号序列
figure(4)
plot(X,xz);
xlabel('横坐标');
ylabel('纵坐标');
title('固定阈值后的去噪处理')
set(gcf,'Color',[1 1 1])
%% 计算信噪比SNR
Psig=sum(Y*Y')/l1;
Pnoi1=sum((Y-xd)*(Y-xd)')/l1;
Pnoi2=sum((Y-xs)*(Y-xs)')/l1;
Pnoi3=sum((Y-xz)*(Y-xz)')/l1;
SNR1=10*log10(Psig/Pnoi1);
SNR2=10*log10(Psig/Pnoi2);
SNR3=10*log10(Psig/Pnoi3);
%% 计算均方根误差RMSE
RMSE1=sqrt(Pnoi1);
RMSE2=sqrt(Pnoi2);
RMSE3=sqrt(Pnoi3);
%% 输出结果
disp('-------------三种阈值设定方式的降噪处理结果---------------'); 
disp(['硬阈值去噪处理的SNR=',num2str(SNR1),'，RMSE=',num2str(RMSE1)]);
disp(['软阈值去噪处理的SNR=',num2str(SNR2),'，RMSE=',num2str(RMSE2)]);
disp(['固定阈值后的去噪处理SNR=',num2str(SNR3),'，RMSE=',num2str(RMSE3)]);
t2=clock;
tim=etime(t2,t1);
disp(['------------------运行耗时',num2str(tim),'秒-------------------'])
