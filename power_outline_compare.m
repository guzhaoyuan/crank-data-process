close all;clc;%clear;
%% read power data from excel
% A1=xlsread('16TH.xlsx');
a = A1(:,1);
% data every 0.2ms, f = 5000Hz

% pick the finishing milling power
m = find(a>95,1,'first');
n = find(a<105,1,'last');

figure;
subplot(2,3,1);plot(A1(:,1),A1(:,2));title('��������ͼ');ylabel('����');xlabel('ʱ��/t');
% subplot(2,3,1);plot(A1(m:n,1),A1(m:n,2));   
%% filter for power
fs = 5000;
fc1=20;fc2=280;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_band = filter(b,a,A1(m:n,2));
subplot(2,3,2);plot(A1(m:n,1),y_power_high);title('ѡȡ�Ļ������ʶ�');ylabel('����');xlabel('ʱ��/t');

%% fft for power
N=size(A1(m:n),2);
b=0:N-1;
c=1:N/12.5;%max show f
f_power=c*fs/N;
fft_power = abs(y_power_fft(1:N/12.5));
y_power_fft = fft(y_band);
subplot(2,3,3);plot(f_power,fft_power);title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');
%% read outline data from txt

A2=textread('H15TCER.413');
A2=A2(2:end,2:end);
A2=A2(:);
subplot(2,3,4);plot([1:size(A2,1)],A2);title('��������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');

%% filter for outline
fs = 3600;
fc1=20;fc2=280;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_outline_high=filter(b,a,A2);
subplot(2,3,5);plot([1:size(A2,1)],y_outline_high);title('�˲�����������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');
%% fft for outline
f_outline = [1:size(A2,1)];
f_outline = f_outline / 1.333;%��ת��Ϊ45r/min������תһȦ��1.33s������������ʾΪ50Hzʱ��ʵ��������Ϊ1.33s������Ƶ��Ϊ50/1.33
y_outline_fft = fft(y_outline_high);
subplot(2,3,6);plot(f_outline(1:500),abs(y_outline_fft(1:500)));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');

%% plot fft compare
figure;
subplot(2,1,1);plot(f_power,fft_power);title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');
subplot(2,1,2);plot(f_outline(1:500),abs(y_outline_fft(1:500)));title('��������FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');