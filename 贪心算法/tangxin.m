% 渡边笔记
% 贪心算法是一种思想，即寻找当前最优解，至使结果最优解
% 贪心算法必须经过证明才可以使用
% 其证明围绕着：整个问题的最优解一定由在贪心策略中存在的子问题的最优解得来的
% 一旦贪心算法得以证明，它就是最快最优的算法
% 实际上，贪心算法适用的情况很少
% 判断一个问题是否适合用贪心法求解，目前还没有一个通用的方法，在竞赛中，需要凭个人的经验来判断
% 贪心算法毕竟是贪心算法，只能缓一时，而不是长久之计，
% 问题的模型、参数对贪心算法求解结果具有决定性作用，这在某种程度上是不能接受的
% 于是聪明的人类就发明了各种智能算法（也叫启发式算法）
% 但在我看来所谓的智能算法本质上就是贪心算法和随机化算法结合
% 例如传统遗传算法用的选择策略就是典型的贪心选择，正是这些贪心算法和随机算法的结合，我们才看到今天各种各样的智能算法
%% 例1 设有n个正整数，将它们连接成一排，组成一个最大的多位整数。
% n=3时，3个整数13，312，343，连成的最大整数为34331213。
% n=4时，4个整数7，13，4，246，连成的最大整数为7424613。
% 此题很容易想到使用贪心法，比如把整数按从大到小的顺序连接起来，例子符合，但测试结果不全对
% 反例：12，121应该组成12121而非12112
% 正确的标准是：先把整数转换成字符串，然后比较a+b和b+a，如果a+b>=b+a，就把a排在b的前面，反之则把a排在b的后面
%% 例2 最短路径问题
clear,clc;close all;
n=4; % 设置点数
x = zeros(1,n); % 产生一个行向量存储坐标
y = zeros(1,n);
luxian = 1:1:n; % 生成1到n的矩阵，存储路线
paixu = 1:1:n;

% 这一步是作出随机点的图
for i = 1 : n                             
    x(i) = randn * n ;                  %生成正态分布的随机坐标点  
    y(i) = randn * n ;
    hold on
    text(x(i)+0.3,y(i)+0.3,num2str(i))     %用text做好标记，
end

% 这一步是计算点与点之间的距离
d = zeros(n) ;  % 生成一个n*n的矩阵用来存储点与点之间的距离，可删去
for i = 1 : n 
    for j = 1 : n
        d(i,j) = sqrt( ( x(i) - x(j) ) ^ 2 + ( y(i) - y(j) ) ^ 2);   
    end
end

luxian(1) = 1;                             %设置起点，路线的起点是1
num = 1;
for a = 1:(n-2)                         %去除起点和终点需要n-2次判断 
paixu(:,1)=[];                       %删除上一个最优点          
dis = zeros(1,(n-a));                %用来存剩下各个点的距离
   for b = 1:(n-a)                     %用来获取剩下各个点的距离
        dis(b) = d (num, paixu(b));       
   end
num1 = find( dis == min(dis) );     %根据距离最小得到最优点位置
t = paixu(1);                      %通过中间变量互换位置
    paixu(1) = paixu(num1);       %最优点位置换到第一个
    paixu(num1) = t;           
    num = paixu(1);                    %获取下次进行操作的数
    luxian(a+1) = paixu(1);              %将最优点存入luxian数组（空出开头）
end
luxian(n) = paixu(2);  %补上最后一个点

plot(x(luxian),y(luxian),'--o') ; %标出点用虚线相连得到路径
grid on;title('贪心算法计算最优路径');