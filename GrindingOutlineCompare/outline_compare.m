%compare junker and jiuzhou outline data
close all;clc;
%% init param
theta = [1:3600]/3600*2*pi;
Fs=3600;
N=3600;
n=0:N-1;
m=1:N/2;
f=m*Fs/N;
displayF = 150;
%% plot junker outline data
A1=textread('H15TCER.413');
A1=A1(2:end,2:end);
B = A1';
A1=B(:);
figure;
subplot(2,2,1);plot(theta,A1(1:3600));title('ÓÂ¿ËÇúÖáÂÖÀªÍ¼');ylabel('¾¶ÏòÎó²îÖµ');xlabel('²âÁ¿Î»ÖÃ/rad');

%% plot junker outline fft 
Y1 = fft(A1);
Y1 = Y1(1:1800);
subplot(2,2,2);plot(f(1:displayF),abs(Y1(1:displayF)));title('ÓÂ¿ËFFTÆµÆ×Í¼');ylabel('ÆµÓò·ùÖµ');xlabel('ÆµÂÊ/Hz');

%% plot jiuzhou outline data
A2=textread('P71.3TER.412');
A2=A2(2:end,2:end);
B = A2';
A2=B(:);
subplot(2,2,3);plot(theta,A2(1:3600));title('¾ÅÖŞÇúÖáÂÖÀªÍ¼');ylabel('¾¶ÏòÎó²îÖµ');xlabel('²âÁ¿Î»ÖÃ/rad');

%% plot jiuzhou outline fft 
Y2 = fft(A2);
Y2 = Y2(1:1800);
subplot(2,2,4);plot(f(1:displayF),abs(Y2(1:displayF)));title('¾ÅÖŞFFTÆµÆ×Í¼');ylabel('ÆµÓò·ùÖµ');xlabel('ÆµÂÊ/Hz');

