close all;clc;%clear;
%% read power data from excel
% A1=xlsread('power_data/19TH.xlsx');
a = A1(:,1);
m = find(a>50.5,1,'first');%for 19
n = find(a<51.9,1,'last');%for 19
% m = find(a>81,1,'first');%for 14
% n = find(a<83.7,1,'last');%for 14
figure;

%subplot(2,1,1);plot(A1(:,1),smooth(smooth(smooth(A1(:,2)))));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
subplot(3,1,1);plot(A1(m:n,1),A1(m:n,2));title('机床功率图');ylabel('功率');xlabel('时间/t');

%subplot(2,1,1);plot(A1(m:n,1),A1(m:n,2));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(A1(m:n,2)));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(smooth(A1(m:n,2))));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
subplot(3,1,2);plot(A1(m:n,1),smooth(smooth(smooth(A1(m:n,2)))));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');

x = A1(m:n,1);
y = smooth(smooth(smooth(A1(m:n,2))));


[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.99999;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
%subplot(3,1,2);plot( fitresult, xData, yData);


x1 = (51.9-4/3:4/3/3600:51.9)';
y1 = fitresult(x1);
y1 = y1 - mean(y1);
subplot(3,1,2);plot([1:size(x1,1)], y1);

%% 
A2=textread('outline_data/14.413');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
A2 = A2 - mean(A2);
x2 = [1:size(A2,1)*2];
y2 = smooth([A2',A2']');
subplot(3,1,3);plot(x2 ,y2);title('曲轴轮廓图');ylabel('径向误差值');xlabel('测量位置/rad');

%% timeshift

for i = 1:3400
    Y(i) = y2(i:size(y1,1)+i-1)'*y1;
end

[M,I]=min(Y(1:3000));
plot([1:3600],y2(I+1:I+3600));