% 渡边笔记
% 多种群遗传算法解决 TSP 问题
% TSP问题即旅行商问题
% 经典的TSP可以描述为
% 一个商品推销员要去若干个城市推销商品，该推销员从一个城市出发，需要经过所有城市后，回到出发地
% 应如何选择行进路线，以使总的行程最短。从图论的角度来看，该问题实质是在一个带权完全无向图中，找一个权值最小的哈密尔顿回路

clear,clc;close all;
% 输入参数
M=100;               %种群的个数                    
ITER=200;            %迭代次数   
m=2;                 %适应值归一化淘汰加速指数
Pc=0.8;              %交叉概率
Pmutation=0.05;      %变异概率
% 城市坐标    
pos=[0 0
    1 1
    -1 -1
    2 3] ;

%生成城市之间距离矩阵
[N,~] = size(pos); %%城市的个数     
D=zeros(N,N);
for i=1:N
    for j=i+1:N
        dis=(pos(i,1)-pos(j,1)).^2+(pos(i,2)-pos(j,2)).^2;
        D(i,j)=dis^(0.5);
        D(j,i)=D(i,j);
    end
end

%生成初始群体
popm=zeros(M,N);
for i=1:M
    popm(i,:)=randperm(N);%随机排列，比如[2 4 5 6 1 3]
end
%随机选择一个种群
R=popm(1,:);

%初始化种群及其适应函数
fitness = zeros(M,1);
len = zeros(M,1);
for i=1:M   % 计算每个染色体对应的总长度
    len(i,1)=myLength(D,popm(i,:));
end
maxlen=max(len);%最大回路
minlen=min(len);%最小回路
fitness=fit(len,m,maxlen,minlen);
rr=find(len==minlen);%找到最小值的下标，赋值为rr
R=popm(rr(1,1),:);%提取该染色体，赋值为R

fitness=fitness/sum(fitness);
distance_min=zeros(ITER+1,1);  %%各次迭代的最小的种群的路径总长
nn=M;
iter=0;
while iter<=ITER
    %选择操作
    p=fitness./sum(fitness);
    q=cumsum(p);%累加
    for i=1:(M-1)
        len_1(i,1)=myLength(D,popm(i,:));
        r=rand;
        tmp=find(r<=q);
        popm_sel(i,:)=popm(tmp(1),:);
    end 
    [fmax,indmax]=max(fitness);%求当代最佳个体
    popm_sel(M,:)=popm(indmax,:);
    %交叉操作
    nnper=randperm(M);
%    A=popm_sel(nnper(1),:);
%    B=popm_sel(nnper(2),:);
    for i=1:M*Pc*0.5
        A=popm_sel(nnper(i),:);
        B=popm_sel(nnper(i+1),:);
        [A,B]=cross(A,B);
%      popm_sel(nnper(1),:)=A;
%      popm_sel(nnper(2),:)=B; 
         popm_sel(nnper(i),:)=A;
         popm_sel(nnper(i+1),:)=B;
    end
%变异操作
    for i=1:M
        pick=rand;
        while pick==0
             pick=rand;
        end
        if pick<=Pmutation
           popm_sel(i,:)=Mutation(popm_sel(i,:));
        end
    end
    %%求适应度函数
    NN=size(popm_sel,1);
    len=zeros(NN,1);
    for i=1:NN
        len(i,1)=myLength(D,popm_sel(i,:));
    end
    maxlen=max(len);
    minlen=min(len);
    distance_min(iter+1,1)=minlen;
    fitness=fit(len,m,maxlen,minlen);
    rr=find(len==minlen);

    R=popm_sel(rr(1,1),:);
%    for i=1:N
%        fprintf('%d ',R(i));
%   end
%    fprintf('\n');
    popm=[];
    popm=popm_sel;
    iter=iter+1;
    %pause(1);
end

%画出所有城市坐标 
subplot(1,3,1);
scatter(pos(:,1),pos(:,2),'rx');

fprintf('最短路程是 ');
for i=1:N
    fprintf('%d ',R(i));%把R顺序打印出来
end
fprintf('\n最短距离是 %d\n',minlen);
title('点图');
subplot(1,3,2); plot_route(pos,R);  % 路程图
title('路程图');
subplot(1,3,3); plot(distance_min); % 最短距离随迭代次数的变化
title('最短距离的变化');