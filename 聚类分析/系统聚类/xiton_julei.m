clear;clc;close all;set(0,'defaultfigurecolor','w');
filename_1 = '..\数据\2015清华数据.xlsx'; % 文件的路径名称
[num_1, tex_1, raw_1] = xlsread(filename_1,'可用数据','V2:V24');
[num_2,~,~] = xlsread(filename_1,'可用数据','U2:U24'); % 公寓编号
%文件为二维的坐标，第一列为x轴坐标，第二列为y轴坐标
long=[1:size(num_1,1)]'; data=[long,num_1];
Y = pdist(num_1,'mahalanobis');
% 距离取值常参见https://blog.csdn.net/lin_angel/article/details/50726027
% % 系统距离法共包含四种具体聚类方法
% % 最短距离法
% Z1 = linkage(Y,'single');
% % subplot(2,2,1);
% [H,T,outperm] = dendrogram(Z1,0,'colorthreshold','default');
% set(H,'LineWidth',2);grid on;
% title('最短距离法聚类图');ylabel('das');

% 最长距离法
% Z2 = linkage(Y,'complete'); 
% subplot(2,2,2);
% [H,T] = dendrogram(Z2,0,'colorthreshold','default');
% set(H,'LineWidth',2);grid on;
% title('最长距离法聚类图');ylabel('das');

% 重心法
% Z2 = linkage(Y,'centroid');
% % subplot(2,2,3);
% [H,T] = dendrogram(Z2,0,'colorthreshold','default');
% set(H,'LineWidth',2);grid on;
% title('重心法聚类图')

% 离差平方和法/Ward法
Z2 = linkage(Y,'ward');
% % subplot(2,2,4);
% subplot(1,2,1);
[H,T] = dendrogram(Z2,0,'colorthreshold','default');
set(H,'LineWidth',2);grid on;
% title('Ward法聚类图');
xlabel('学生公寓编号','FontSize',16);ylabel('聚类分析的数据距离','FontSize',16);

% subplot(1,2,2);
% scatter_daxiao=40;
data_1=[1:12];plot(data_1,num_1(data_1),'^b','linewidth',4);hold on;
data_2=[13:19];plot(data_2,num_1(data_2),'dg','linewidth',4);grid on;box off;
data_2=[20:23];plot(data_2,num_1(data_2),'vr','linewidth',4);grid on;box off;
legend('{A_1}类公寓','{B_1}类公寓','{C_1}类公寓','fontsize',14,'Location','NorthWest');
xlim([1 23]); % 设置X轴上的区间，避免出现空白区域
set(gca,'xtick',1:23);% 设置坐标区
set(gca,'xticklabel',num_2); % 自定义坐标
set(gca,'fontsize',14)
xtickangle(45);% 旋转x轴
xlabel('公寓编号','FontSize',16);ylabel('人均用水定额/[{m^3}/(人\cdotd)]','FontSize',16);