% Shi_ying--适应度矩阵
% pop--初始种群
% Xuan_ze_lv--选择率
% Sheng_chun_pop--生存下来的种群
function Sheng_chun_pop=Xuan_ze(Shi_ying,pop,Xuan_ze_lv)

sumFitness = sum(Shi_ying(:)); % 计算所有种群的适应度
Lei_ji_gai_lv = cumsum(Shi_ying/sumFitness); % 计算累积概率

% 轮盘赌选择算法
for n = 1:round(Xuan_ze_lv * size(pop,2))
    matrix = find(Lei_ji_gai_lv > rand); %找到比随机数大的累积概率
    if isempty(matrix)
        continue
    end
    Sheng_chun_pop(:,n) = pop(:,matrix(1));%将首个比随机数大的累积概率的位置的个体遗传下去
end
end