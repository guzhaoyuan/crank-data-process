close all;clc;%clear;
%% read power data from excel
% A1=xlsread('power_data/19TH.xlsx');
a = A1(:,1);
m = find(a>49,1,'first');
n = find(a<52,1,'last');
figure;
%subplot(2,1,1);plot(A1(m:n,1),A1(m:n,2));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(A1(m:n,2)));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
%subplot(2,1,1);plot(A1(m:n,1),smooth(smooth(A1(m:n,2))));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');
subplot(2,1,1);plot(A1(m:n,1),smooth(smooth(smooth(A1(m:n,2)))));title('smoothed机床功率图');ylabel('功率');xlabel('时间/t');

%% 
A2=textread('outline_data/19.413');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
subplot(2,1,2);plot([1:size(A2,1)*2],smooth([A2',A2']'));title('曲轴轮廓图');ylabel('径向误差值');xlabel('测量位置/rad');