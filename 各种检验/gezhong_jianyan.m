% 渡辺笔记
% 各类检验，除决定系数是1最好，都是0最好
YReal = [1 2 3 4 5];
YPred = [1 2 3 4 5.1];
% 平均绝对百分比误差（MAPE）
mape = mean(abs((YReal - YPred)./YReal));
disp(mape);
% 均方根误差（RMSE）
rmse = sqrt(mean((YPred-YReal).^2));
disp(rmse);
% 残差平方和（SSE）
sse = sum((YReal - YPred).^2);
disp(sse);
% 均方误差（MSE）
mse = mean(sum((YReal - YPred).^2));
disp(mse);
% 平均绝对误差（MAE）
mae = mean(abs(YReal - YPred));
disp(mae);
% 决定系数（R2-R-Square）
r2 = 1 - (sum((YPred - YReal).^2) / sum((YReal - mean(YReal)).^2));
disp(r2)