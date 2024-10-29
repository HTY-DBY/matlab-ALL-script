clc,clear;close all
y =  [0.6
1.1
1.6
2.7
3.2
3.63
3.970144878
4.468
5.6739
5.9
7.2
10.4
11.1
12.6
13.4
16
17.4
]
yuceshu = 3;
% 本程序主要用来计算根据灰色理论建立的模型的预测值
% 应用的数学模型是 GM(1,1)
% 原始数据的处理方法是一次累加
% 渡辺曜改进了这个代码,通常GM预测第一个数是不够优秀的
% y 是应该输入的数组，yuceshu是你想预测的后几个数据 我们一般就预测两个
% 示例 huiseyuce([1,2,3],2)
n=length(y);
yy=ones(n,1);
yy(1)=y(1);
for i=2:n
    yy(i)=yy(i-1)+y(i);
end
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(yy(i)+yy(i+1))/2;
    B(i,2)=1;
end
BT=B';
for j=1:n-1
    YN(j)=y(j+1);
end
YN=YN';
A=inv(BT*B)*BT*YN;
a=A(1);
u=A(2);
t=u/a;
i=1:n+yuceshu;
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
for j=n+yuceshu:-1:2
    ys(j)=yys(j)-yys(j-1);
end
x=1:n;
% 把这里修改就可以看到GM拟合的第一个数据
xs=2:n+yuceshu;
yn=ys(2:n+yuceshu);
plot(x,y,'^r',xs,yn,'*-b');
det=0;

sum1=0;
sumpe=0;
for i=1:n
    sumpe=sumpe+y(i);
end
pe=sumpe/n;
for i=1:n
    sum1=sum1+(y(i)-pe).^2;
end
s1=sqrt(sum1/n);
sumce=0;
for i=2:n
    sumce=sumce+(y(i)-yn(i));
end
ce=sumce/(n-1);
sum2=0;
for i=2:n
    sum2=sum2+(y(i)-yn(i)-ce).^2;
end
s2=sqrt(sum2/(n-1));
c=(s2)/(s1);
disp(['后验差比值为：',num2str(c)]);
if c<0.35
    disp('系统预测精度好')
else if c<0.5
        disp('系统预测精度合格')
    else if c<0.65
            disp('系统预测精度勉强')
        else
            disp('系统预测精度不合格')
        end
    end
end
    disp(['下个拟合值为 ',num2str(ys(n+1))]);
for i=2:yuceshu
    disp(['再下个拟合值为',num2str(ys(n+i))]);
end
