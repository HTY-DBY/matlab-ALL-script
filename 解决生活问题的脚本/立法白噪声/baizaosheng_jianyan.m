% 立法数白噪声检验，渡边笔记
% 如果易知原始数据不是平稳的，则不能做随机性检验
% 接下来要求差分,目的: 变成平稳的数据
% p 如果比 0.05 小就不是白噪声序列，可以使用时间序列
% 某种现象的指标数值按照时间顺序排列而成的数值序列
% 因为时间序列是某个指标数值长期变化的数值表现
% 所以时间序列数值变化背后必然蕴含着数值变换的规律性
% 这些规律性就是时间序列分析的切入点
% 如果原数据平稳，但是没通过，可以直接差分
clc,clear;close all;

x = []; % 时间，一般做题就是顺序时间排列
yanchi=[6 12 18];   % 通常是做6 12 18 24步延迟，这个数据的选择上限请根据报错来调整
y = [970279
1259308
1127571
1163959
1169540
1076938
991350
953275
951508
904434
889381
864015
836236
]';;
[h1] = adftest(y);    %检验是否平稳
if h1 == 1
    disp('数据是平稳的');
    y_1 = y;
else
    disp('数据是不平稳的');
    i = 1;
    while 1
        y_1 = diff(y,i);   % 在这里对数据进行 n 阶差分
        [h1,p1,adf,ljz] = adftest(y_1);    %检验是否平稳
        if h1 == 1
            disp(['差分后是平稳的，做了 ',num2str(i),' 阶差分']);
            subplot(2,2,3)
            plot(y_1);  % 一阶差分数据时序图
            title('一阶差分数据时序图')
            subplot(2,2,4)
            autocorr(y_1); % 一阶差分数据的自相关系数图
            title('一阶差分数据自相关系数图');
            break
        end
        i = i + 1;
    end
end
% 随时间的变化值
subplot(2,2,1)
plot(y); % 原始数据时序图
title('原始数据时序图')
subplot(2,2,2)
autocorr(y); % 原始数据的自相关系数图
title('原始数据自相关系图像')

[H,pValue,Qstat,CriticalValue]=lbqtest(y_1,'lags',yanchi); % H.结果，pValue.p值, Qstat.卡方统计量
fprintf('%15s%15s%15s','延迟阶数','卡方统计量','p值');
fprintf('\n');
for i=1:length(yanchi)    % i = 1,时候为6，i = 2时候为12
    fprintf('%18f%19f%19f',yanchi(i),Qstat(i),pValue(i));
    fprintf('\n');
end

if sum(find(pValue > 0.05))
    disp('但是没通过立法白噪声检验');
    i = 1;
    while 1
        y_1 = diff(y,i);   % 在这里对数据进行 n 阶差分
        [h1,p1,adf,ljz] = adftest(y_1);    %检验是否平稳
        if h1 == 1
            disp(['差分后是平稳的，做了 ',num2str(i),' 阶差分']);
            subplot(2,2,3)
            plot(y_1);  % 一阶差分数据时序图
            title('一阶差分数据时序图')
            subplot(2,2,4)
            autocorr(y_1); % 一阶差分数据的自相关系数图
            title('一阶差分数据自相关系数图');
            break
        end
        i = i + 1;
    end
end

% 再来一次

[H,pValue,Qstat,CriticalValue]=lbqtest(y_1,'lags',yanchi); % H.结果，pValue.p值, Qstat.卡方统计量
fprintf('%15s%15s%15s','延迟阶数','卡方统计量','p值');
fprintf('\n');
for i=1:length(yanchi)    % i = 1,时候为6，i = 2时候为12
    fprintf('%18f%19f%19f',yanchi(i),Qstat(i),pValue(i));
    fprintf('\n');
end
if sum(find(pValue < 0.05))
    disp('数据通过立法白噪声检验');
else
    disp('数据没通过立法白噪声检验');
end