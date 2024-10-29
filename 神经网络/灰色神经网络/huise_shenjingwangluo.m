clc,clear,close all;
% 渡边笔记 灰色神经网络

filename_1 = 'first_shuju.xlsx';
sheet_1 = '';
range_3 = 'G3:G18';
for j = 1:16
    years(j) = j+3;
end
[num_3, ~,~] = xlsread(filename_1,sheet_1,range_3);
[m,~] = size(num_3);
IN=1:m;
for i = 1:m
    sr(i) = num_3(i);
end
OUT=sr;
[X,minx,maxx,T,mint,maxt]=premnmx(IN,OUT);
q=50;
q1=0;
q0=70;
while(q1<q)
    q=q0;
    [M,N]=size(X);
    [L,N]=size(T);
    net=newff(minmax(X),[q,L],{'tansig','purelin'},'trainlm');
    net.trainParam.lr=0.05;
    net.trainParam.epochs=10000;
    net.trainParam.goal=1e-6;
    [net,tr]=train(net,X,T);
    Y=sim(net,X);
    Y=postmnmx(Y,mint,maxt);
    
    
    
    %灰色关联分析，调整网络隐层节点
    p=0.5;
    e=0.5;
    %此两个系数的设定是根据一些论文，已经实验的尝试得出的
    an=repmat(net.b{1},1,N);
    op=tansig(net.iw{1,1}*X+an);
    op1=op';
    T0=T';
    T1=repmat(T0,1,q);
    DIF=abs(T1-op1);
    MIN=min(min(DIF));
    MAX=max(max(DIF));
    Si=(MIN+p*MAX)./(DIF+p*MAX);
    ri=sum(Si)/N;
    D=find(ri>=e);
    [q0,q1]=size(D);
    q0=q1;
end
q0;
ri;
D;
q=q1;

%进行测试
PRD=1:m;
PRD=PRD';
P=tramnmx(PRD,minx,maxx);
TNEW=sim(net,P');
TNEW=postmnmx(TNEW,mint,maxt);

YY=OUT;
YC=TNEW;
figure
plot(years,YY,'b+-',years,YC,'r')
legend('灰色神经网络','生态用水量');
xlabel('年份');
RES0=YC-YY;
res0=RES0./YY;
figure
bar(years,res0);
xlabel('训练次数');
ylabel('训练误差');