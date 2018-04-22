close all;clc;%clear;
%% read power data from excel
% A1=xlsread('16TH.xlsx');
a = A1(:,1);
% data every 0.2ms

m = find(a>105,1,'first');
n = find(a<125,1,'last');

figure;
% subplot(2,1,1);plot(A1(:,1),A1(:,2));
subplot(2,3,1);plot(A1(m:n,1),A1(m:n,2));   
%% filter for power
fs = 5000;
fc=200;
wn = fc/(fs/2);
[b,a]=butter(4,wn,'low');
y_power_high=filter(b,a,A1(:,2));
subplot(2,3,2);plot(A1(:,1),y_power_high);

%% fft for power

y_power_fft = fft(A1(m:n,2));
subplot(2,3,3);plot(A1(m:n,1),y_power_fft);
%% read outline data from txt

A2=textread('H15TCER.413');
A2=A2(2:end,2:end);
A2=A2(:);
subplot(2,3,4);plot([1:size(A2,1)],A2);

%% filter for outline
fs = 3600;
fc=200;
wn = fc/(fs/2);
[b,a]=butter(4,wn,'low');
y_outline_high=filter(b,a,A2);
subplot(2,3,5);plot([1:size(A2,1)],y_outline_high);
%% fft for outline

y_outline_fft = fft(A2);
subplot(2,3,6);plot([1:size(A2,1)],abs(y_outline_fft));
