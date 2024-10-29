% 渡边笔记 t检验
% 待检验的数据应该近服从正态分布
clc,clear;close all;
x = [1 2 2 3 3 3 3 4 4];
y = [1 2 2 3 3 3 4 4 4];
ALPHA = 0.05;
[H,P,CI,STATS]=ttest2(x,y, ALPHA);
% 其中，x，y均为行向量（维度必须相同），各表示一组数据
% ALPHA为可选参数，表示设置一个值作为t检验执行的显著性水平
% 在不设置ALPHA的情况下默认ALPHA为0.05，即计算x和y在5%的显著性水平下是否来自同一分布(假设是否被接受）
% H = 0，P > 0.05，表明零假设被接受，即x，y在统计上可看做来自同一分布的数据
% H = 1，P < 0.05，表明零假设被拒绝，即x，y在统计上认为是来自不同分布的数据，即有区分度
disp(['H = ',num2str(H)]);
disp(['P = ',num2str(P)]);
if H == 0
    disp('x，y在统计上可看做来自同一分布的数据')
else
    disp('x，y在统计上可看做来自不同分布的数据')
end