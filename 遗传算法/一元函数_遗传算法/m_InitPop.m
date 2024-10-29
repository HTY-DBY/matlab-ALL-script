function pop=m_InitPop(Num_pop,Begin,End)
%% 初始化种群
%  输入：numpop--种群大小；
%       [irange_l,irange_r]--初始种群所在的区间
pop = [];
for i = 1:Num_pop
    pop(:,i)=Begin + (End - Begin) * rand;
end
end
    