%复制
function result=copy(gene, pt)
    global N L num
    x= zeros(N, num*L);                % 初始化子代基因，提速用
   
    for i = 1: N                 % 交叉操作
        if rand < pt
           d = randi(N);                 
           x(i,:)=gene(d,:);% 随机抽选一个自我复制的个体
        end
    end
    result=x;
end