%交叉操作函数  cross.m
function [A,B]=cross(A,B)
L=length(A);
if L<10
    W=L;
elseif ((L/10)-floor(L/10))>=rand&&L>10
    W=ceil(L/10)+8;
else
    W=floor(L/10)+8;
end
%%W为需要交叉的位数
p=(L-W+1);%随机产生一个交叉位置
%fprintf('p=%d ',p);%交叉位置
for i=1:W
    x=find(A==B(1,p+i-1));
    y=find(B==A(1,p+i-1));
    [A(1,p+i-1),B(1,p+i-1)]=exchange(A(1,p+i-1),B(1,p+i-1));
    [A(1,x),B(1,y)]=exchange(A(1,x),B(1,y));
end

end