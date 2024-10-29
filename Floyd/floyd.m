% 这是floyd算法，以下注释为渡边所加
% floyd不能解决多条最短路径和负权回路的问题
% 解稠密图效果最佳，边权可正可负，是双源解法
% 对于稠密图，效率要高于执行|V|次Dijkstra算法，也要高于执行|V|次SPFA算法。
% 缺点：时间复杂度比较高，不适合计算大量数据，注意
% 输入示例
% W=[0 50 inf 40 25 10; 50 0 15 20 inf 25; inf 15 0 10 20 inf; 40 20 10 0 10 25;25 inf 20 10 0 55; 10 25 inf 25 55 0];
% [D, P, dis, path] = floyd(W, 1, 4)
function [D, P, dis, path] = floyd(W, start, stop) %start为指定起始结点，stop为指定终止结点
D = W; %最短距离矩阵赋初值
n = length(D); %n为结点个数
P = zeros(n,n); %路由矩阵赋初值

for i = 1:n
    for j = 1:n
        P(i,j) = j;
    end
end

for k = 1:n
    for i = 1:n
        for j = 1:n
            if D(i,k) + D(k,j) < D(i,j)
                D(i,j) = D(i,k) + D(k,j);   %核心代码
                P(i,j) = P(i,k);
            end
        end
    end
end
                  
if nargin ~= 3
    errordlg('参数个数输入有误！', 'Warning!')
else
    dis = D(start, stop); %指定两结点间的最短距离
    m(1) = start;
    i = 1;

    while P(m(i),stop) ~= stop
        k = i + 1;
        m(k) = P(m(i),stop);
        i = i + 1;
    end
    m(i+1) = stop;
    path = m; %指定两结点之间的最短路径
end