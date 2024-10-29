% 解方程组。渡边笔记
% 对于方程组
% x1+2x2=8
% 2x1+3x2=13
A = [1,2
    2,3]; % 输入左矩阵
b=[8
   13]; % 输入右矩阵
x = A \ b;
disp(['方程组的解为 : ', num2str(x')]);
% 解方程
syms x
fun = x*3 -41*x*2 + 100*x +100 ==0;
x = solve(fun,x)

% syms a b c y x
% [x,y]=solve([a*x^2+b*y+c==0,a*x+2*y==4],[x,y])