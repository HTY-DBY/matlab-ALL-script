% 渡辺笔记，BP 神经网络
clc,clear,close all;
%输入数据矩阵,每行为对应的属性
p = [1 1 1
    2 2 2 
    3 3 3];
%目标（输出）数据矩阵
t = [6 6 6];

%对训练集中的输入数据矩阵和目标数据矩阵进行归一化处理
[pn, inputStr] = mapminmax(p);
[tn, outputStr] = mapminmax(t);

%建立BP神经网络
net = newff(pn, tn, [3 7 2], {'purelin', 'logsig', 'purelin'});
%每10轮回显示一次结果
net.trainParam.show = 10;
%最大训练次数
net.trainParam.epochs = 5000;
%网络的学习速率
net.trainParam.lr = 0.05;
%训练网络所要达到的目标误差
net.trainParam.goal = 0.65 * 10^(-3);
%网络误差如果连续6次迭代都没变化，则matlab会默认终止训练。为了让程序继续运行，用以下命令取消这条设置
net.divideFcn = '';
%开始训练网络
net = train(net, pn, tn);
%使用训练好的网络，基于训练集的数据对BP网络进行仿真得到网络输出结果
%(因为输入样本（训练集）容量较少，否则一般必须用新鲜数据进行仿真测试)
answer = sim(net, pn);
%反归一化
answer1 = mapminmax('reverse', answer, outputStr);