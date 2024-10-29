%交叉函数，一条dna，产生两条交叉后的dna
function [x1,x2]=jiaoCha(gene, pc)
    global N L num
    x1 = zeros(N, num*L);                % 初始化子代基因，提速用
    x2 = x1;                         % 同上
    for i = 1: N                 % 交叉操作
        if rand < pc
           d = randi(N);            
           m = gene(d,:);            % 随机抽选一个交叉的个体
           d = randi(num*L-1);          % 确定交叉断点
           x1(i,:) = [gene(i,1:d), m(d+1: num*L)];  % 新个体 1        
           x2(i,:) = [m(1:d), gene(i, d+1: num*L)];  % 新个体 2
        end
    end
end