% 带利润的马氏链模型，渡边笔记
clc,clear;close all;

a=[5 5
    4 6 ]; % 输入统计矩阵
R = [9 3
    3 -7];  % 输入利润矩阵

% 对统计矩阵，求状态转移矩阵
[m,~] = size(a);
ni=sum(a,2);  %计算矩阵f的行和
for i = 1:m
    for j = 1:m
        ZT(i,j) = a(i,j)./ni(i);   %求状态转移的频率
    end
end
disp('转移矩阵为 : ');
disp(ZT)
fprintf('%c', 8); % 删掉换行符

% 求 n 期利润
n = 3;

% n = 1 时
for i = 1:m
    for j = 1:m
        v(i,j) = R(i,j) * ZT(i,j);
    end
    Sum = sum(v,2);
end
% n = n 时

for i = 1:m
    for j = 1:m
        V(i,j) = Sum(j).^(n-1) * ZT(i,j);
    end
    V_Sum = sum(V,2);
    V_Sum = V_Sum + Sum;
    if n > 1 % 边界条件
        disp(['处于状态 ',num2str(i),' 的 ',num2str(n),' 期利润为 ',num2str(V_Sum(i,:))])
    else
        disp(['处于状态 ',num2str(i),' 的 ',num2str(n),' 期利润为 ',num2str(Sum(i,:))])
    end
end

% 带利润的马氏链一般不存在平衡
% 因为钱是赚不完的