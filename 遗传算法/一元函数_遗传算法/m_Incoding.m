function pop=m_Incoding(Ran_se_ti,Begin)
% 解码
popNum = 1;%染色体包含的参数数量
for n=1:size(Ran_se_ti,2)
    Matrix = Ran_se_ti{1,n};
    for num=1:popNum
        pop(num,n) = bin2dec(Matrix);
    end
end
pop = pop./10^6+Begin;
