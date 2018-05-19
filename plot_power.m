close all;clc;%clear;
%% read power data from excel
% A1=xlsread('16TH.xlsx');
a = A1(:,1);
% data every 0.2ms

m = find(a>38,1,'first');
n = find(a<50,1,'last');

figure;
plot(A1(:,1),A1(:,2));
figure;
plot(A1(m:n,1),A1(m:n,2));title('power data');ylabel('功率');xlabel('时间/s');