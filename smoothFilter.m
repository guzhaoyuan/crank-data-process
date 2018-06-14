%test filter for power, using SmoothingSpline
close all;clc;%clear;
%% read power data from excel
% A1=xlsread('power_data/19TH.xlsx');
a = A1(:,1);
m = find(a>50.5,1,'first');%for 19
n = find(a<51.9,1,'last');%for 19
% m = find(a>81,1,'first');%for 14
% n = find(a<83.7,1,'last');%for 14
figure;

%subplot(2,1,1);plot(A1(:,1),smooth(smooth(smooth(A1(:,2)))));title('smoothed��������ͼ');ylabel('����');xlabel('ʱ��/t');
subplot(3,1,1);plot(A1(m:n,1),A1(m:n,2));title('��������ͼ');ylabel('����');xlabel('ʱ��/s');

%subplot(2,1,1);plot(A1(m:n,1),A1(m:n,2));title('smoothed��������ͼ');ylabel('����');xlabel('ʱ��/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(A1(m:n,2)));title('smoothed��������ͼ');ylabel('����');xlabel('ʱ��/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(smooth(A1(m:n,2))));title('smoothed��������ͼ');ylabel('����');xlabel('ʱ��/t');
subplot(3,1,2);plot(A1(m:n,1),smooth(smooth(smooth(A1(m:n,2)))));title('��ֵ�˲���Ļ�������');ylabel('����');xlabel('ʱ��/s');

x = A1(m:n,1);
y = smooth(smooth(smooth(A1(m:n,2))));


[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.99999;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
subplot(3,1,3);plot( fitresult, xData, yData);title('����������ϵĻ�������');ylabel('����');xlabel('ʱ��/s');


x = (50.5:4/3/3600:51.9)';
y = fitresult(x);
y = y - mean(y);
%subplot(3,1,2);plot(x, y);

%% 
A2=textread('outline_data/14.413');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
A2 = A2 - mean(A2);
%subplot(3,1,3);plot([1:size(A2,1)*2],smooth([A2',A2']'));title('��������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');