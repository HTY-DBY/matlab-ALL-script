% k_mean 算法，渡边笔记
% 对处理大型数据集，该算法保持可收缩性，高效性；
% 当簇接近正态分布时，效果最好；
% 若簇中含有异常点，将导致均值偏离严重；（即对噪声、孤立点敏感）；
% 不适用于发现非凸形状的簇，或大小差别大的簇
% 中k是事先给定的，这个k值难以估计，很多时候并不知道数据集应该分成多少个类别最合适
clear; clc;

data = [11 2 0
    2 2 2
    4 3 3]; % 输入数据
k = 3; % 分类数

X = mapminmax(data',0,1)'; % 按列最小最大规范化到[0,1]
T = kmeans(X,k); % 直接调用kmeans函数
for i = 1:k
    kong = find(T == i);
    fprintf('第 %d 类 :',i);
    disp(data(kong)')
end