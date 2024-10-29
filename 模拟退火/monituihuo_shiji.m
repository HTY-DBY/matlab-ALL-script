clc,clear
% 模拟退火(求最小)
temperature = 100; % 初始温度
final_temperature = 1; % 最低温度
time_temperature = 1; % 用于计算步数
time_tuihuo = 10; % 退火步长
cooling_rate = 0.95; % 降温步数
% 初始化随机数生成器，以使结果具备可重复性
% rng(0,'twister');
% 生成范围a-b的随机数
a = -10; b = 10;
% rang_math = (b-a).*rand(1000,1) + a;
rang_math = (b-a).*rand + a;
f = @(x)(...
    x.^2 ...    % 定义函数，求最小值
    );
current_old = f(rang_math);


while final_temperature < temperature
    rang_math = (b-a).*rand + a; % 随机数
    current_new =  f(rang_math); % 生成新解
    diff = current_new - current_old;
    
    % Metropolis 准则
    if(diff<0)||(rand < exp(-diff/(temperature))) % 接受新解的条件
        route = rang_math;
        current_old = current_new;
        time_temperature = time_temperature + 1;
    end
    
    if time_temperature == time_tuihuo
        temperature = temperature * cooling_rate;
        time_temperature = 0;
    end
    
end

plot([a:b],f([a:b])); % 原函数图像
hold on;
plot(route,current_old,'ko', 'linewidth', 2); % 作解的图像
