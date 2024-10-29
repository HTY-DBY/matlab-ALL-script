% 渡边自己手打的
% 模拟退火解二元函数
clc,clear;close all;

% 设置区间
xx = -10:1:10;
yy = -10:1:10;
[x, y]=meshgrid(xx, yy);

f_xy = @(x,y)(...
x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y) + 20 ...    % 定义函数，求最小值
);
fun = x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y) + 20; % 再定义一次
f = @(x)f_xy(x(1),x(2));
x0 = rand(1,2);   % 退火开始点
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
fprintf('最优解为 x = %.10f, y = %.10f\n', jie(1),jie(2) );
fprintf('最优值为 z = %.10f\n',fval);
figure;
surf(x,y,fun);
hold on;
plot3(jie(1),jie(2),fval,'ko', 'linewidth', 3);