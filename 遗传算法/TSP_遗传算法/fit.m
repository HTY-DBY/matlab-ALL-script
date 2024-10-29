%适应度函数fit.m，每次迭代都要计算每个染色体在本种群内部的优先级别，类似归一化参数。越大约好！
function fitness=fit(len,m,maxlen,minlen)
fitness=len;
for i=1:length(len)
    fitness(i,1)=(1-(len(i,1)-minlen)/(maxlen-minlen+0.0001)).^m;
end