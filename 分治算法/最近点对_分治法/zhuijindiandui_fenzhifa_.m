% 分治法求最近点，渡边笔记
clear;clc
n = 20;
% 随机生成20个点
A=rand(n,2)*10; 
% 将20个点按横坐标升序排列
A = sortrows(A,1);
% 分治法求随机点的最近点对
[mindist1,y1,y2] = cloest(A,1,n);
% 使用红色的点标记随机点
x=A(:,1); 
y=A(:,2);
for i = 1:n
    plot(x,y,'r.'); hold on
    text(A(i,1),A(i,2),num2str(i));hold on
end
%使用绿色十字标记分治法的最近点对
plot(y1(1),y1(2),'go', 'linewidth', 2);hold on
plot(y2(1),y2(2),'go', 'linewidth', 2);hold on
