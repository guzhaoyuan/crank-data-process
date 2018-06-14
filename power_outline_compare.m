close all;clc;%clear;
%% read power data from excel
% A1=xlsread('power_data/19TH.xlsx');
a = A1(:,1);
figure;
subplot(2,3,1);plot(A1(:,1),A1(:,2));title('��������ͼ');ylabel('����');xlabel('ʱ��/s');
%% find the power focus area
endTime = 40;
duration = 2;%should be 1.333
startTime = endTime - duration;
% pick the finishing milling power
m = find(a>42,1,'first');
n = find(a<52,1,'last');
%% filter for power
fs = 5000;% data every 0.2ms, f = 5000Hz
fc1=20;fc2=200;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_band = filter(b,a,A1(m:n,2));
% subplot(2,3,2);plot(A1(m:n,1),y_band);title('ѡȡ�Ļ������ʶ��˲���');ylabel('����');xlabel('ʱ��/t');
subplot(2,3,2);plot(A1(m:n,1),A1(m:n,2));title('ѡȡ�Ļ������ʶ�');ylabel('����');xlabel('ʱ��/s');

%% fft for power
N=size(A1(m:n),2);
b=0:N-1;
c=1:N/12.5;%max show f
f_power=c*fs/N;
y_power_fft = fft(y_band);
fft_power = abs(y_power_fft(1:N/12.5));
subplot(2,3,3);plot(f_power(1:1100),fft_power(1:1100));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');

%% read outline data from txt

A2=textread('outline_data/19.413');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
subplot(2,3,4);plot([1:size(A2,1)],A2);title('��������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');

%% filter for outline
fs = 3600;
fc1=20;fc2=400;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_outline_high=filter(b,a,A2);
subplot(2,3,5);plot([1:size(A2,1)],y_outline_high);title('�˲�����������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');

%% fft for outline
displayF = 150;

f_outline = [1:size(A2,1)];
f_outline = f_outline ;%��ת��Ϊ45r/min������תһȦ��1.33s������������ʾΪ50Hzʱ��ʵ��������Ϊ1.33s������Ƶ��Ϊ50/1.33
y_outline_fft = fft(y_outline_high);
subplot(2,3,6);plot(f_outline(1:displayF),abs(y_outline_fft(1:displayF)));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');

%% plot fft compare
figure;
displayF = 350;
subplot(2,1,1);plot(f_power(1:3300),fft_power(1:3300));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');
subplot(2,1,2);plot(f_outline(1:displayF),abs(y_outline_fft(1:displayF)));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');
