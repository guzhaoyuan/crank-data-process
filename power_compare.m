close all;clc;%clear;
%% read power data from excel
% A1=xlsread('14TH.xlsx');
% A2=xlsread('15TH.xlsx');
% A3=xlsread('16TH.xlsx');
% A4=xlsread('17TH.xlsx');
% A5=xlsread('18TH.xlsx');
% A6=xlsread('19TH.xlsx');

plot(A1(:,1)-2,A1(:,2),'DisplayName','14');
hold on;
plot(A2(:,1)-5,A2(:,2),'DisplayName','15');
hold on;
plot(A3(:,1)-26,A3(:,2),'DisplayName','16');
hold on;
plot(A4(:,1),A4(:,2),'DisplayName','17');
hold on;
plot(A5(:,1)-45.5,A5(:,2),'DisplayName','18');
hold on;
plot(A6(:,1)+30,A6(:,2),'DisplayName','19');
legend();