function pop=m_InitPop(Num_pop,Begin,End)
%% ��ʼ����Ⱥ
%  ���룺numpop--��Ⱥ��С��
%       [irange_l,irange_r]--��ʼ��Ⱥ���ڵ�����
pop = [];
for i = 1:Num_pop
    pop(:,i)=Begin + (End - Begin) * rand;
end
end
    