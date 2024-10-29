% 单种群遗传算法，渡边笔记
% 有很多袋鼠，它们降落到喜玛拉雅山脉的任意地方
% 这些袋鼠并不知道它们的任务是寻找珠穆朗玛峰
% 但每过几年，就在一些海拔高度较低的地方射杀一些袋鼠
% 于是，不断有袋鼠死于海拔较低的地方，而越是在海拔高的袋鼠越是能活得更久，也越有机会生儿育女
% 就这样经过许多年，这些袋鼠们竟然都不自觉地聚拢到了一个个的山峰上
% 可是在所有的袋鼠中，只有聚拢到珠穆朗玛峰的袋鼠被带回了美丽的澳洲
% 遗传算法是一种方向性算法，达到的是局部最优，不保证是全局最优
% 解码和编码的m文件我没看懂，有时换函数后解码后还会出错
% 但是并不要紧，反正原理是那样就好了，而且解码编码也是见题猜题
clear;clc;close all;

% 遗传算法求函数最大值，把函数加 '-' 就是求最小值喵
% 遗传参数设置
% 尽量不要随意改变杂交变异率之类的
Num_pop = 100; % 初始种群大小
Begin = -9; End = 5; % 问题解区间
% 请在 mFx.m 上修改函数
Lenght = 24; % 二进制编码长度
Jing_hua = 100; % 进化次数
Zha_jiao_lv = 0.6; % 杂交率
Xuan_ze_lv = 0.5; % 选择率
Bian_yi_lv = 0.001; % 变异率

pop=m_InitPop(Num_pop,Begin,End); % 初始化种群

% 绘制初始种群分布
x = linspace(Begin,End,100); % 对 x 定义域等分
y = m_Fx(x);

% 开始种群迭代
for a = 1:Jing_hua
    Shi_ying = Shi_ying_du(pop); % 计算初始种群的适应度
    
    pop = Xuan_ze(Shi_ying, pop, Xuan_ze_lv); % 选择
    
    binpop = m_Coding(pop,Lenght,Begin); % 编码
    
    Ran_se_ti = Jiao_cha(binpop,Num_pop,Zha_jiao_lv); % 交叉
    
    Ran_se_ti = Bian_yi(Ran_se_ti,Bian_yi_lv); % 变异
    
    Ran_se_ti = m_Incoding(Ran_se_ti,Begin); % 解码
    % 更新种群
    pop = [pop Ran_se_ti];
    
    % 种群更新变化图
    pause(0.03);
    
    subplot(1,2,1);plot(x,y);
    hold on
    for i = 1:size(pop,2)
        plot(pop(i),m_Fx(pop(i)),'ro');
    end
    hold off
    title('种群变化');
    
    % 绘制迭代变化图
    time(a) = a;
    subplot(1,2,2);
    Dang_qian_zhui_you(a) = max(m_Fx((pop)));
    plot(time, Dang_qian_zhui_you, 'r-');
    hold on
end
subplot(1,2,1);
plot(x,y);
hold on
plot(max(pop),m_Fx((max(pop))),'ro');
title('终止种群');

pop_max = pop(find(max(m_Fx(pop))));
Fx_pop_max = max(m_Fx(pop));
disp(['最大适应度 x = ' num2str(pop_max)]);
disp(['最大适应度 y = ' num2str(Fx_pop_max)]);