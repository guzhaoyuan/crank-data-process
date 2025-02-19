close all;clc;

crankNum = 14;
fg1 = figure('Name','crankData');
figure(fg1);
while crankNum < 20
    A2=textread(join([num2str(crankNum),'.413']));
    A2=A2(2:end,2:end);
    B = A2';
    A2=B(:);
    
    theta = [1:3600]/3600*2*pi;
    subplot(2,1,1);plot(theta,A2);title('��������ͼ');ylabel('�������ֵ');xlabel('����λ��/rad');
    % init param
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
    subplot(2,1,2);plot(f(1:150),abs(Y(1:150)));title('FFTƵ��ͼ');ylabel('Ƶ���ֵ');xlabel('Ƶ��/Hz');
    input(num2str(crankNum));
    crankNum = crankNum + 1;
end