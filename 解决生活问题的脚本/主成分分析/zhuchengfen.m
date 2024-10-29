% 渡边笔记 主成分分析
% 当研究的问题涉及多个变量，并且变量间相关性明显，即包含的信息有所重叠时
% 可以考虑用主成分分析的方法，这样更容易抓住事物的主要矛盾，使问题简化
clc,clear;close all;
% 与主成分分析相关的 MATLAB 函数有pcacov、princomp函数

% pcacov函数用来根据 协方差矩阵  或 相关系数矩阵 进行主成分分析
% [COEFF,latent,explained]=pcacov（V）
% V 是总体或样本的协方差矩阵或相关系数矩阵，对于p维总体，V是pxp的矩阵
% 输出参数 COEFF 是p个主成分的系数矩阵，它是pxp的矩阵，它的第i列是第i个主成分的系数向量
% 输出参数 latent 是p个主成分的方差构成的向量，即V的p个特征值的大小(从大到小)构成的向量
% 输出参数 explained 是p个主成分的贡献率向量，已经转化为百分比
V = [1     0.79    0.36    0.76    0.25    0.51
    0.79  1       0.31    0.55    0.17    0.35
    0.36  0.31    1       0.35    0.64    0.58
    0.76  0.55    0.35    1       0.16    0.38
    0.25  0.17    0.64    0.16    1       0.63
    0.51  0.35    0.58    0.38    0.63    1 ];
[a,~] = size(V);
[COEFF_1,latent,explained] = pcacov(V);
result_1(1,:) = {'特征值', '差值', '贡献率', '累积贡献率'};
result_1(2: a+1 ,1) = num2cell(latent);
% diff函数式用于求导数和差分的.
result_1(2: a ,2) = num2cell(-diff(latent));
% cumsum函数通常用于计算一个数组各行的累加值。
result_1(2: a+1 ,3:4) = num2cell([explained, cumsum(explained)]);
% disp(result_1);

% princomp函数用来根据样本观测值矩阵进行主成分分析，其调用格式如下：
% [COEFF,SCORE,latent,tsquare] = princomp(X,'econ')
% 根据样本观测值矩阵X进行主成分分析。输入参数X是n行p列的矩阵，每一行对应一个观测(样品)，每一列对应一个变量
% 输出参数COEFF是p个主成分析的系数矩阵，是pxp的矩阵，它的第i列对应第i个主成分的系数向量
% 输出参数SCORE是n个样品的p个主成分得分矩阵，它是n行p列的矩阵
% 每一行对应一个观测，每一列对应一个主成分，第i行第j列元素表示第i个样品的第j个主成分得分
% SCORE与X是一一对应的关系，是X在新坐标系中的数据，可以通过X*系数矩阵得到
% 返回样本协方差矩阵的特征值向量latent，它是由p个特征值构成的列向量，其中特征值按降序排列。
% 返回一个包含n个元素的列向量tsquare，它的第i个元素的第i个观测对应的霍特林T^2统计量
% 表述了第i个观测与数据集(样本观测矩阵)的中心之间的距离，可用来寻找远离中心的极端数据
% 通过设置参数‘econ’参数，使得当 n <= p 时
% 只返回latent中的前n-1个元素(去掉不必要的0元素)及COEFF和SCORE矩阵中相应的列
X = [2000 1000 3000 900 95
    1900  990  3000 700 66
    2000   900  3400 800 56];
% 行为样本，列为特征量
XZ = zscore(X); % 数据标准化
[COEFF_2,SCORE,latent,tsquare] = pca(XZ);
[m, n] = size(X); % 求X的行数和列数
result_2 = cell(m, 4); % 定义一个n+1行，4列的元胞数组
result_2(1,:) = {'特征值', '差值', '贡献率', '累积贡献率'};
explained = 100*latent/sum(latent);% 计算贡献率
%result_2中第1列的第2行到最后一行存放的数据(latent)特征值
result_2(2:end,1) = num2cell(latent);
%result1中第2列的第2行到倒数第2行存放的数据(latent的方差，特征值的方差)
result_2(2:end-1,2) = num2cell(-diff(latent));
%result1中第3列和第4列的第2行到最后一行分别存放主成分的贡献率和累积贡献率
result_2(2:end,3:4) = num2cell([explained, cumsum(explained)]);
disp(result_2);
[b_1,b_2] = size(X);
[b_3,b_4] = size(SCORE);
disp(SCORE);