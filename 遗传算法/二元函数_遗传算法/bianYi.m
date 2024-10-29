%变异
function result=bianYi(gene, pm)
    global N L num
    for i = 1: N                           % 变异操作
        if rand < pm
            gene(i,randi(num*L)) = randi([0, 9]);
        end
    end
    result=gene;

end