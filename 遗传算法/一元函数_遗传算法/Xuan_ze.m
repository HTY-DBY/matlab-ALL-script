% Shi_ying--��Ӧ�Ⱦ���
% pop--��ʼ��Ⱥ
% Xuan_ze_lv--ѡ����
% Sheng_chun_pop--������������Ⱥ
function Sheng_chun_pop=Xuan_ze(Shi_ying,pop,Xuan_ze_lv)

sumFitness = sum(Shi_ying(:)); % ����������Ⱥ����Ӧ��
Lei_ji_gai_lv = cumsum(Shi_ying/sumFitness); % �����ۻ�����

% ���̶�ѡ���㷨
for n = 1:round(Xuan_ze_lv * size(pop,2))
    matrix = find(Lei_ji_gai_lv > rand); %�ҵ������������ۻ�����
    if isempty(matrix)
        continue
    end
    Sheng_chun_pop(:,n) = pop(:,matrix(1));%���׸������������ۻ����ʵ�λ�õĸ����Ŵ���ȥ
end
end