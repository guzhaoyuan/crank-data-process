close all;clear;clc;
%% init data
TotalTime = 1; %s
fs = 1000; %sample points
n = [1:fs]/fs*TotalTime; %ms
f = [1:fs/2];
f1=100;f2=200;f3=300;
y1 = sin(2*pi*f1*n);
y2 = sin(2*pi*f2*n);
y3 = sin(2*pi*f3*n);
y = y1+y2+y3;
figure;
subplot(3,1,1);plot(n,y);title('原信号');

%% FFT
Y4 = fft(y);
Y4 = Y4(1:fs/2);
subplot(3,1,2);plot(f,abs(Y4));title('傅里叶变换');
hold on;

%% low pass
fc=10;
wn = fc/(fs/2);
[b,a]=butter(4,wn,'low');
y_low=filter(b,a,y);

%% band pass
fc1=150;fc2=250;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_band = filter(b,a,y);

%% fft again
Y = fft(y_band);
Y = Y(1:fs/2);
subplot(3,1,3);plot(f,abs(Y));title('带通滤波');
% plot(n,y_low);
% hold on;

