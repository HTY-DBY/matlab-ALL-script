% function 函数解多元方程 最小值
% function 基本语法
% [x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
% x的返回值是决策向量x的取值，fval的返回值是目标函数f(x)的取值
% fun是用 M 文件定义的函数f(x),代表了(非)线性目标函数
% x0是x的初始值
% A,b,Aeq,beq 定义了线性约束 ,如果没有线性约束，则A=[],b=[],Aeq=[],beq=[]
% lb和ub是变量x的下界和上界，如果下界和上界没有约束，则lb=[],ub=[],也可以写成lb的各分量都为 -inf,ub的各分量都为inf
% nonlcon是用 M 文件定义的非线性向量函数约束
% options 定义了优化参数，不填写表示使用 Matla b默认的参数设置
clc,clear;close all;
options = optimset('Algorithm','active-set'); % 可以不设置
[X,Y,EXITFLAG] = fmincon(@(x)(   x(1)^3 +  x(2)^3 + x(3)^3 +x(4)^3  ),...
[0 0 0 0],[],[],[],[],...
[-2 -2 -2 -2],[-1 -1 -1 -1]... % 设置范围
,[],options);
disp(['函数的满足最小值的 X 解为 : ',num2str(X)]);
disp(['函数的最小值的 Y 解为 : ',num2str(Y)]);