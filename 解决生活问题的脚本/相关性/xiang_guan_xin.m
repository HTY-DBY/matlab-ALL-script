clc,clear,close all
% 相关性分析，渡边笔记
% 列为指标，行为数据
 data = [1 2 
     2 9 
     3 4 ];
% Pearson相关系数
r1 = corr(data,'type','Pearson');
disp(r1);
% Kendall相关系数
r2 = corr(data,'type','Kendall');
disp(r2);
% Spearman相关系数
r3 = corr(data,'type','Spearman');
disp(r3);