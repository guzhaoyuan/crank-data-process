% this code is for test how to process power data
% see power_outline_compare.m for full code
close all;clc;%clear;
%% read power data from excel
% A1=xlsread('16TH.xlsx');
a = A1(:,1);
% data every 0.2ms

m = find(a>95,1,'first');
n = find(a<105,1,'last');

figure;
subplot(2,3,1);plot(A1(:,1),A1(:,2));
% subplot(2,3,1);plot(A1(m:n,1),A1(m:n,2));title('power data');

%% filter for power
fs = 5000;
fc = 250;
wn = fc/(fs/2);
[b,a]=butter(8,wn,'low');
y_power_high=filter(b,a,A1(m:n,2));
subplot(2,3,2);plot(A1(m:n,1),y_power_high);title('filtered power data');
%% band pass for power
% fc1=10;fc2=150;%300
% fc1=150;fc2=250;%110
% fc1=250;fc2=350;%70
% fc1=350;fc2=450;%50
% fc1=450;fc2=550;%40
% fc1=550;fc2=650;%33
fc1=30;fc2=300;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_band = filter(b,a,A1(m:n,2));
%% fft for power
Fs=5000;
N=size(A1(m:n),2);
b=0:N-1;
c=1:N/2;
f=b*Fs/N;
y_power_fft = fft(y_band);
subplot(2,3,3);plot(f,abs(y_power_fft));title('fft power data');
