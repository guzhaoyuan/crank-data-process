clc;
% A=xlsread('10TH21TH.xlsx');
figure(1)
plot([1:size(A(:,2),1)]/5000,A(:,2),'b');
hold on;
plot([1:size(A(16000:end,3),1)]/5000,A(16000:end,3),'r');
hold off;
title('����ǰ��������ʶԱ�');ylabel('����');xlabel('ʱ��/s');legend('����ǰ����','��������');