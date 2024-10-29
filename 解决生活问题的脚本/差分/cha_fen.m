% 数据差分，渡边笔记
% 差分就是后一个减去前一个，使得数据平稳化
% n 阶就是做 n 次差分，具体直接看例子就好
clc,clear;close all;
Y = [0 5 15 30 50 75 105];
disp(['未差分时为 : ',num2str(Y)])
Y_1= diff(Y, 1);
disp(['一阶差分结果为 : ',num2str(Y_1)])
Y_2 = diff(Y, 2);
disp(['二阶差分结果为 : ',num2str(Y_2)])
Y_3 = diff(Y, 3);
disp(['三阶差分结果为 : ',num2str(Y_3)])