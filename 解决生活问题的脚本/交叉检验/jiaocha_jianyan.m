% 交叉检验，渡边笔记
% 提高数据的利用率
% 有效的避免过学习以及欠学习状态的发生,最后得到的结果也比较具有说服性
% 常用的 K 值有 3,6,10 等
clear,clc;close all;

% 导入数据
data = reshape(1:144,12,12);
% 每行的是这个样本属性的数据，最后一个数据是标签
[data_r, data_c] = size(data);
% 将数据样本随机分割为 n 部分，做 n 折交叉检验
n = 5;
indices = crossvalind('Kfold', data_r, n);
for i = 1 : n
    % 获取第i份测试数据的索引逻辑值
    test = (indices == i);
    % 取反，获取第i份训练数据的索引逻辑值
    train = ~test;
    % 测试用的数据
    test_data = data(test, 1 : data_c - 1);
    test_label = data(test, data_c);
    % 训练用的数据
    train_data = data(train, 1 : data_c - 1);
    train_label = data(train, data_c);
    % 下面放入检验数据的代码
    
end
