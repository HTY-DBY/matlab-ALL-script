clc,clear;close all
global N L xRange yRange num
xRange=[-50, 50];
yRange=[-50 ,50];
num=2 ;       % 变量个数
N = 100;      % 种群上限
ger = 150;    % 迭代次数
L = 10;       % 单个变量的编码基因长度
pc = 0.8;     % 交叉概率
pm = 0.1;     % 变异概率
pt=0.2;       %自我复制概率
% 日常Fx.m修改函数

x=linspace(xRange(1), xRange(2), 50); y=linspace(yRange(1), yRange(2), 50); % 太疏密的话，可以更改这个 50
[xx, yy]=meshgrid(x, y); % 函数转置并重置
surfc( xx , yy , Fx(xx, yy) ) ;   % 做三维图
dna1 = randi([0, 9], [N, L]);     % 基因
dna2 = randi([0, 9], [N, L]);     % 基因

hold on
x = jieMa(dna1, xRange);  % 对初始种群解码
y = jieMa(dna2, yRange );
plot3(x, y, Fx(x, y), 'bo', 'linewidth',3) % 画出初始解的位置
dna=[dna1,dna2]; %合并两个变量的基因

for epoch = 1: ger               % 进化代数
    %交叉
    [x1,x2]=jiaoCha(dna, pc);
    % 变异操作
    x3=bianYi(dna, pm);
    %自我复制
    x4=copy(dna, pt);
    dna = [dna; x1; x2; x3;x4];               % 合并新旧基因
    dna1=dna(:, 1:L);
    dna2=dna(:, L+1:2*L);
    fi = zeros(N, 1);       % 初始化适应度，提速
    fi=Fx(jieMa(dna1,xRange) , jieMa(dna2 ,yRange)); %求最大值
    dna = [dna, fi];  %适应度放在最后一列
    %自然选择
    dna=choice(dna, fi);
    dna = dna(:, 1:num*L);  %去掉矩阵末尾的适应度，进入下一次迭代
end
%     gene=dna(1,:); %最优基因
x = jieMa( dna(:, 1:L) ,xRange);  % 对最终种群解码 (dco(1)-1)
y = jieMa( dna(:, L+1:num*L ) ,yRange);
plot3(x(1), y(1), Fx(x(1), y(1)) , 'ko', 'linewidth', 3)   % 画出最终解的位置
fprintf('最优解为 x = %.10f, y = %.10f\n', x(1),y(1) );
fprintf('最优值为 z = %.10f\n',fi(1));