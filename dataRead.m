close all;clear;clc;
%% read power data from excel
A1=xlsread('16TH.xlsx');
a = A1(:,1);
% data every 0.2ms

m = find(a>113,1,'first');
n = find(a<114,1,'last');

figure;
% subplot(2,1,1);plot(A1(:,1),A1(:,2));
subplot(2,2,1);plot(A1(m:n,1),A1(m:n,2));
%% filter for power
fs = 5000;
fc=100;
wn = fc/(fs/2);
[b,a]=butter(4,wn,'high');
y_high=filter(b,a,y);
subplot(2,2,2);plot(A1(m:n,1),y_high);
%% read outline data from txt

A2=textread('H15TCER.413');
A2=A2(2:end,2:end);
A2=A2(:);
subplot(2,2,3);plot([1:size(A2,1)],A2);

%% filter for outline
fs = 5000;
fc=100;
wn = fc/(fs/2);
[b,a]=butter(4,wn,'high');
y_high=filter(b,a,y);
subplot(2,2,2);plot(A1(m:n,1),y_high);