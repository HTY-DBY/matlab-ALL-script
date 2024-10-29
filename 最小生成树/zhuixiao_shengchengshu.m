clc,clear,close all;
% 使用 Kruskal 的算法来计算 无向图的最小生成树
s = [1 1 1 2 5 3 6 4 7 8 8 8];
t = [2 3 4 5 3 6 4 7 2 6 7 5];

% 使用加权边创建并绘制一个立方体图
weights = [100 10 10 10 10 20 10 30 50 10 70 10];
G = graph(s,t,weights);
% figure;
p = plot(G,'EdgeLabel',G.Edges.Weight);

% 计算并在图上方绘制图的最小生成树。T 包含的节点与 G 相同，但包含的边仅为后者的子集
% figure;
[T,pred] = minspantree(G);
% p = plot(G,'EdgeLabel',G.Edges.Weight);
highlight(p,T) % 高亮显示