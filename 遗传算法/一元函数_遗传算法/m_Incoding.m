function pop=m_Incoding(Ran_se_ti,Begin)
% ����
popNum = 1;%Ⱦɫ������Ĳ�������
for n=1:size(Ran_se_ti,2)
    Matrix = Ran_se_ti{1,n};
    for num=1:popNum
        pop(num,n) = bin2dec(Matrix);
    end
end
pop = pop./10^6+Begin;
