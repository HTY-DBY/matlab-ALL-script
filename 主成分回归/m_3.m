clc,clear,close all;
% 渡辺论文代码 m_1
% 文件的路径
filename_1 = 'first_shuju.xlsx';
sheet_1 = '';
% Excle 的 工作表 名称
range_1 = 'B43:Q58';
range_2 = 'B1:T1';
range_3 = 'G3:G18';
Year_0 = 2004;
years(1) = Year_0;
for j = 2:13
    years(j) = years(j-1)+1;
end

[num_1, ~,~] = xlsread(filename_1,sheet_1,range_1);
[~, num_2,~] = xlsread(filename_1,sheet_1,range_2);
[num_3, ~,~] = xlsread(filename_1,sheet_1,range_3);
data = num_1(1:13,:);

X = num_1(1:13,:);
XZ = zscore(X); % 数据标准化
[COEFF_2,SCORE,latent,tsquare] = pca(XZ);
[m, n] = size(X); % 求X的行数和列数
result_2 = cell(m, 4); % 定义一个n+1行，4列的元胞数组
result_2(1,:) = {'特征值', '差值', '贡献率', '累积贡献率'};
explained = 100*latent/sum(latent);% 计算贡献率
%result_2中第1列的第2行到最后一行存放的数据(latent)特征值
result_2(2:end,1) = num2cell(latent);
%result1中第2列的第2行到倒数第2行存放的数据(latent的方差，特征值的方差)
result_2(2:end-1,2) = num2cell(-diff(latent));
%result1中第3列和第4列的第2行到最后一行分别存放主成分的贡献率和累积贡献率
result_2(2:end,3:4) = num2cell([explained, cumsum(explained)]);
disp(result_2);
disp(COEFF_2);
xlswrite('result.xlsx',result_2);
xlswrite('SCORE.xlsx',SCORE);

y = num_3(1:13);
% x,y 需要转置才可以使用
num_1_2 = num_1(1:13,:);
ppp = 0;
for i=1:13
    for ii = 1:6
        pp(i,ii) = num_1_2(i,:) * COEFF_2(:,ii);
    end
end
SCORE = pp;
X = [ones(size(y)) SCORE(:,1) SCORE(:,2) SCORE(:,3) SCORE(:,4) ...
    SCORE(:,5) SCORE(:,6)]; % 定义回归方程

[B,BINT,R,RINT,STATS] = regress(y,X); % 回归
% [B,BINT,R,RINT,STATS] = REGRESS(Y,X,alpha)
% b 为回归系数向量
% BINT 回归系数的估计区间
% R 残差
% RINT 置信区间
% STATS 用于检验回归模型的统计量。有4个数值：判定系数r2，F统计量观测值，检验的p的值，误差方差的估计
% r2越接近1，回归方程越显著；F>F1−α(k,n−k−1)时拒绝H0，F越大，回归方程越显著；p<α时拒绝H0
% ALPHA 显著性水平（缺少时默认0.05）
y2 = B(2).* SCORE(:,1)' + B(3).*SCORE(:,2)' + B(4).*SCORE(:,3)' + B(5).*SCORE(:,4)' ...
    + B(6).*SCORE(:,5)' + B(7).*SCORE(:,6)' + B(1)';   %预测值
plot([2004:2019],num_3','ro-',years,y2,'b*');
legend('生态用水量', '主成分回归');
xlabel('时间/年');
ylabel('城市生态用水量/亿立方米');
disp('回归分析统计量为');
disp([ 'R^2 : ',num2str(STATS(1))]); % 模型由 这么多原始数据 解释，最优为 1
disp([ 'F : ',num2str(STATS(2))]);
disp([ '检验 p : ',num2str(STATS(3))]); % 日常小于 0.05 最好
disp([ '误差方差 : ',num2str(STATS(4))]); % 越小越好
xlswrite('zhuchengf_huigui.xlsx',B);
hold on;

num_1_2 = num_1(14:16,:);
ppp = 0;
for n = 1:3
    for ii = 1:6
        pp_1(n,ii) = num_1_2(n,:) * COEFF_2(:,ii);
    end
end
SCORE = pp_1;
y3 = B(2).* SCORE(:,1)' + B(3).*SCORE(:,2)' + B(4).*SCORE(:,3)' + B(5).*SCORE(:,4)' ...
    + B(6).*SCORE(:,5)' + B(7).*SCORE(:,6)' + B(1)';   %预测值
plot([2017:2019],y3,'m*');
line([2016.5,2016.5],[0,17],'linestyle','--');
axis([2004 2019 0 17]);
legend('城市生态用水量-原始数据', '主成分回归在数据集的结果','主成分回归在测试集的结果');
xlswrite('save_4.xlsx',y3);