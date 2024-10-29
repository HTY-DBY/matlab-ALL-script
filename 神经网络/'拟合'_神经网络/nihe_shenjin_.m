% L-M 优化算法（trainlm）和贝叶斯正则化算法（trainbr），用以训练 BP 网络
% 使其能够拟合某一附加有白噪声的正弦样本数据，渡边笔记
% 神经网络的初始和常数设置，请在shenjin.m修改
clc,clear;close all;

% 0.全选，如果数据不多时可以操作
% 1.L-M 优化算法 TRAINLM
% 2.贝叶斯正则化算法 TRAINBR
% 3.动量梯度下降算法 TRAINGDM
% trainbfg---BFGS算法（拟牛顿反向传播算法）训练函数；
% trainbr---贝叶斯归一化法训练函数；
% traincgb---Powell-Beale共轭梯度反向传播算法训练函数；
% traincgp---Polak-Ribiere变梯度反向传播算法训练函数；
% traingd---梯度下降反向传播算法训练函数；
% traingda---自适应调整学习率的梯度下降反向传播算法训练函数；
% traingdm---附加动量因子的梯度下降反向传播算法训练函数；
% traingdx---自适应调整学习率并附加动量因子的梯度下降反向传播算法训练函数；
% trainlm---Levenberg-Marquardt反向传播算法训练函数；
% trainoss---OSS（one step secant）反向传播算法训练函数；
% trainrp---RPROP（弹性BP算法）反向传播算法训练函数；
% trainscg---SCG（scaled conjugate gradient）反向传播算法训练函数；
% trainb---以权值/阈值的学习规则采用批处理的方式进行训练的函数；
% trainc---以学习函数依次对输入样本进行训练的函数；
% trainr---以学习函数随机对输入样本进行训练的函数。
% 当调用train函数时，上述训练函数被用于训练网络
L = 3; %共有三种方法,我觉得够用了
choice = 0;

% P 为输入矢量
P = [1 2 3 4 5];
% T 为目标矢量
T = [1 2 3 4 5];

%  绘制样本数据点
% 3种全选，比较谁更合适
% choice = 0
if choice == 0
    for i = 1:L
        % 神经网络
        [net,tr] = shenjin(i,P,T);
        %  对 BP 网络进行仿真
        A = sim(net,P);

        title(['神经网络 方法',num2str(i),' 计算结果']);
        %  计算仿真误差
        E = T - A;
        MSE(i) = mse(E); % mse 函数用于计算均方误差
        % 均方误差（mean-square error, MSE）是反映估计量与被估计量之间差异程度的一种度量
    end
    for i = 1:L
        disp(['神经网络 方法',num2str(i),' 的_均方误差_为 : ',num2str(MSE(i))])
    end
    [~,Min] = min(MSE);
    disp(['神经网络 方法',num2str(Min),' 比较优'])
else
    subplot(1,2,1)
    plot(P,T,'+');
    title('原始数据点');
    % 神经网络
    [net,tr] = shenjin(i,P,T);
    % 对 BP 网络进行仿真
    A = sim(net,P);

    title(['神经网络 方法',num2str(choice),' 计算结果']);
    %  计算仿真误差
    E = T - A;
    MSE = mse(E); % mse 函数用于计算均方误差
    % 均方误差（mean-square error, MSE）是反映估计量与被估计量之间差异程度的一种度量
    disp(['神经网络 方法',num2str(choice),' 的_均方误差_为 : ',num2str(MSE)])
end

% 这个用于分析是否可以很好的进行线性回归
% [m,b,r] = postreg(A, P);
% 神经网络的简单使用方法
% P = [1 2 3];
% [Y] = sim(net,P);
% 输入即可输出，维度应与元数据保存一致