clc;
%% init outline data
A2=textread('14.413');
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
fs = 3600;
fc1=20;fc2=400;
wn = [fc1/(fs/2) fc2/(fs/2)];
[b,a]=butter(4,wn);
y_outline_high=filter(b,a,A2);
%subplot(2,3,5);plot([1:size(A2,1)],y_outline_high);title('ÂË²¨ºóÇúÖáÂÖÀªÍ¼');ylabel('¾¶ÏòÎó²îÖµ');xlabel('²âÁ¿Î»ÖÃ/rad');
%% fft outline and plot
Y = fft(y_outline_high);
Y = Y(1:1800);
subplot(2,1,2);plot(f(1:300),abs(Y(1:300)));title('FFTÆµÆ×Í¼');ylabel('ÆµÓò·ùÖµ');xlabel('ÆµÂÊ/Hz');