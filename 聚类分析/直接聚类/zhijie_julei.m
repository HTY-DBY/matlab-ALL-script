% 直接聚类，渡笔记
% 不管机理，不管距离，比较愚蠢但是有用且方便
clear; clc;
data =[36.6 	4.46	36.72	6.37	32.39	4.63	15.43
36.80 	12.46	47.21	18.66	9.22	1.69	10.76
67.88 	2.76	39.1	4.2	36.92	1.87	15.15
48.9 	2.85	36.85	7.23	38.29	3.51	11.27
60.5 	2.23	27.25	6.8	45	8.73	9.99
];
X=mapminmax(data,0,1); % 按列最小最大规范化到[0,1]

T1=clusterdata(X,0.2); % 如果0<cutoff<2，则当不一致系数大于cutoff时，分到不同类(簇)中
T2=clusterdata(X,3); % 如果cutoff是一个≥2的整数，则形成的不同类别数为cutoff
k1 = max(T1);
k2 = max(T2);
for i = 1:k1
    kong = find(T1 == i);
    fprintf('第 %d 类 :',i);
    disp(data(kong)')
end
disp('--------------------------------');
% for i = 1:k2
%     kong = find(T2 == i);
%     fprintf('第 %d 类 :',i);
%     disp(data(kong)')
% end