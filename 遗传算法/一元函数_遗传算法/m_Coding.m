% pop--��Ⱥ
% pop_length--���볤��
% Begin--���俪ʼ��
function Bian_ma = m_Coding(pop,Lenght,Begin)

pop = round((pop-Begin)*10^6);
for n = 1:size(pop,2) % ��ѭ��
    for k = 1:size(pop,1) % ��ѭ��
        dec2binpop{k,n} = dec2bin(pop(k,n));% dec2bin�����Ϊ�ַ�������
        % dec2binpop��cell����
        lengthpop = length(dec2binpop{k,n});
        for s = 1:Lenght-lengthpop % ����
            dec2binpop{k,n} = ['0' dec2binpop{k,n}];
        end
    end
    Bian_ma{n} = dec2binpop{k,n}; % ȡdec2binpop�ĵ�k��
end
end

