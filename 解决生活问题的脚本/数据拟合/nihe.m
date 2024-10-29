clc,clear
% 产生数据
lamuda_0 = xlsread('shuju.xlsx','','B3:U23');
lamuda_test = xlsread('shuju.xlsx','','A3:A23');
lamuda_test = lamuda_test';
x = xlsread('shuju.xlsx','','V3:V23');
% 拟合
for j = 1:21
    lamuda = 355 - lamuda_test(j);
    p = fittype('x * exp( S*lamuda )');
    f = fit(x,lamuda_0(j,:)',p);
%     plot(f,x,lamuda_0(j,:)');
    S(j) = f.S;
end