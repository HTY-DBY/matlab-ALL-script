function fitness=Shi_ying_dus(pop)
% º∆À„  ”¶∂»
for i = 1:size(pop,2)
    fitness(i)=m_Fx(pop(:,i));
end
Min = min(fitness);
fitness = fitness + abs(Min);
end
