% 渡边自己手打的
% 模拟退火解一元函数
clc,clear;close all;

% 设置区间
x = -10:1:10;

f = @(x)(...
x.^4 ...    % 定义函数，求最小值
);

% f = @(x)f_xy(x(1),x(2));
x0 = rand(1,1);   % 退火开始点
lb = []; 
ub = []; % 退火实施范围，可以不设置
% 实时观测
options = saoptimset('MaxIter',20,... % 迭代次数
'StallIterLim',300,... % 最高温度
'TolFun',1e-100,... % 最低温度
'AnnealingFcn',@annealingfast,'InitialTemperature',...
100,'TemperatureFcn',@temperatureexp,'ReannealInterval',500,'PlotFcns',...
{@saplotbestx, @saplotbestf, @saplotx, @saplotf,@saplottemperature});

[jie,fval] = simulannealbnd(f,x0,lb,ub,options);
fprintf('最优解为 x = %.10f, y = %.10f\n', jie, fval );
figure;
fun = x.^2 + 2*x; % 再定义一次
plot(x,fun);
hold on;
plot(jie,fval,'ko', 'linewidth', 2);
