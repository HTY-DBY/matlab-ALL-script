function [net,tr] = shenjin(choice,P,T)
net=newff(minmax(P),[20,1],... % 隐单元的神经元数 20，输出 1，可调
{'tansig','purelin'});
if(choice==1)
    %  采用 L-M 优化算法 TRAINLM
    net.trainFcn='trainlm';
    %  设置训练参数
    net.trainParam.epochs = 500;
    net.trainParam.goal = 1e-6;
    net=init(net);
    %  重新初始化
elseif(choice==2)
    %  采用贝叶斯正则化算法 TRAINBR
    net.trainFcn='trainbr';
    %  设置训练参数
    net.trainParam.epochs = 500;
    randn('seed',192736547);
    net = init(net);
    %  重新初始化
elseif(choice==3)
    %  采用动量梯度下降算法 TRAINGDM
    %  当前输入层权值和阈值
    inputWeights=net.IW{1,1};
    inputbias=net.b{1};
    %  当前网络层权值和阈值
    layerWeights=net.LW{2,1};
    layerbias=net.b{2};
    %  设置训练参数
    net.trainParam.show = 50;
    net.trainParam.lr = 0.05;
    net.trainParam.mc = 0.9;
    net.trainParam.epochs = 1000;
    net.trainParam.goal = 1e-3;
end
%  调用相应算法训练 BP 网络
[net,tr]=train(net,P,T);
end