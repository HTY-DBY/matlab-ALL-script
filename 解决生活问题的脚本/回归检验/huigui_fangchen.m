clc,clear;close all;
% 回归检验；渡边笔记
x_1 = [0 1 2 3 4]';
x_2 = [0 1 5 3 4]';

Y = [1 1 4 10 16]';

X = [ones(size(Y)), x_1, x_2]; % 定义回归方程

[B,BINT,R,RINT,STATS] = regress(Y,X); % 回归
% [B,BINT,R,RINT,STATS] = REGRESS(Y,X,alpha)
% B 为回归系数向量
% BINT 回归系数的估计区间
% R 残差
% RINT 置信区间
% STATS 用于检验回归模型的统计量。有4个数值：判定系数r2，F统计量观测值，检验的p的值，误差方差的估计
% r2越接近1，回归方程越显著；F>F1−α(k,n−k−1)时拒绝H0，F越大，回归方程越显著；p<α时拒绝H0
% ALPHA 显著性水平（缺少时默认0.05）
y2 = B(2).* x_1 + B(3).* x_2 + B(1);   %预测值
plot([1:size(Y,1)], Y' ,'+', [1:size(Y,1)], y2);     %回归效果图
disp('回归分析统计量为');
disp([ 'R^2 : ',num2str(STATS(1))]); % 模型由 这么多原始数据 解释，最优为 1
disp([ 'F : ',num2str(STATS(2))]);
disp([ '检验 p : ',num2str(STATS(3))]); % 日常小于 0.05 最好
disp([ '误差方差 : ',num2str(STATS(4))]); % 越小越好