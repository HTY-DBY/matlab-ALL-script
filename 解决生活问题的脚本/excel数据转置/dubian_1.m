clc,clear
% 省会城市 顺序表
% 北京 天津 石家庄 太原 呼和浩特 沈阳 长春 哈尔滨 上海 南京
% 杭州 合肥 福州 南昌 济南 郑州 武汉 长沙 广州 南宁
% 海口 重庆 成都 贵阳 昆明 拉萨 西安 兰州 西宁 银川 
% 乌鲁木齐
filename_lujin_1 = 'C:\Users\99791\Desktop\生态用水\数据\国家统计局\分省\';
% 文件的前面的路径名称
filename_name_1 = '分省_城市绿地面积.xls';
% 文件的名字
filename_1 = [filename_lujin_1,filename_name_1];
sheet_1 = '';
% Excle 的 工作表 名称
range_1 = 'B5:Q35';
% 读取的范围
[num_1, tex_1, raw_1] = xlsread(filename_1,sheet_1,range_1);
range_1_1 = 'A2';
[num_2, tex_2, raw_2] = xlsread(filename_1,sheet_1,range_1_1);
num_1 = num_1';
dubian_bianliang_1 = num_1;
% 同上
filename_lujin_2 = 'C:\Users\99791\Desktop\生态用水\数据\';
filename_name_2 = 'dubian_shuju.xlsx';
filename_2 = [filename_lujin_2,filename_name_2];
sheet_2 = '';
t_1 = 21;
t_2 = 'W';
% 改变写入 列
range_2 = [t_2,'3:',t_2,'18']; 
for i = 1:31
    dubian_bianliang_2 = dubian_bianliang_1(:,i);
    xlswrite(filename_2,dubian_bianliang_2,sheet_2,range_2)
    range_2 = [t_2,num2str(3+i*t_1),':',t_2,num2str(18+i*t_1)];
end
range_2_1 = [t_2,'1']; 
xlswrite(filename_2,tex_2,sheet_2,range_2_1)