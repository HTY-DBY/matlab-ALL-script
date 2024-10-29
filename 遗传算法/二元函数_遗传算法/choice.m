%选择
function result=choice(gene, fi)
    % 自然选择--排名法
    global L N num
    dna = flipud(sortrows(gene, L*num + 1));    % 对适应度进行降序排名，
    while size(dna, 1) > N                 % 自然选择,只保留50条基因
        d = randi(size(dna, 1));           % 排名法
        %当d非常大时，则容易被淘汰
        if rand < (d - 1) / size(dna, 1)  %根据概率大小，淘汰排名靠后的小概率基因 
            dna(d,:) = [];
            fi(d, :) = [];
        end
    end
    result=dna ; 
end