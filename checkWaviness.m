clc;
%% init outline data
A2=textread('H15TCER.413');
A2=A2(2:end,2:end);
A2=A2(:);
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
Y=Y(1:1800)
plot(f,abs(Y));