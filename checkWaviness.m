close all;clc;
%% init outline data
A2=textread('H15TCER.413');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
figure;
theta = [1:3600]/3600*2*pi;
subplot(2,1,1);plot(theta,A2);title('ÇúÖáÂÖÀªÍ¼');ylabel('¾¶ÏòÎó²îÖµ');xlabel('²âÁ¿Î»ÖÃ/rad');
%% init param
Fs=3600;
N=3600;
n=0:N-1;
m=1:N/2;
f=m*Fs/N;
%% settle filter param & apply band filter
% fc1=200; fc2=400;

%% fft outline and plot
Y = fft(A2);
Y = Y(1:1800);
subplot(2,1,2);plot(f,abs(Y));title('FFTÆµÆ×Í¼');ylabel('ÆµÓò·ùÖµ');xlabel('ÆµÂÊ/Hz');