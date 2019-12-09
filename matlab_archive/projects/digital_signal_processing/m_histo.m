<<<<<<< HEAD
% m_histo.m

M = input('Type number of set of uniform random signals to add to form Gaussian -->  ');

%--------------------------------------------------------------------------------------------------
% generate uniformly distributed random and find number of occurrence
%--------------------------------------------------------------------------------------------------
xu = ceil(300*rand(3000,1));
val = [1:300]';
for i = 1:300
   yu(i) = sum( xu == val(i) );
end

%--------------------------------------------------------------------------------------------------
% generate normally distributed random and find number of occurrence
%--------------------------------------------------------------------------------------------------
xn = ceil(300*rand(3000,1));
for i = 1:M-1
    xn = xn + ceil(300*rand(3000,1));
end

% ���߱� ������ ũ���� ������ 1~300 �� �ƴϰ� ����. �ٽ� 1~300 ������ ������ ������ش�.
% �׳� M���� ������ ������ �ƴ� �Ǽ��� ���� �� �ֱ� ������ ceil�� ����
% 4�� ������ �� 10�� ������ ��, �÷����� ǥ�������� �� �������Ŵ°� �����غ�
xn = ceil(xn/M); 

for i = 1:300
   yn(i) = sum( xn == val(i) );
end

%--------------------------------------------------------------------------------------------------
% plot
%--------------------------------------------------------------------------------------------------
close all

subplot(2,1,1);
bar(val,yu)
title('Histogram of scores for uniformly distributed random signal')

subplot(2,1,2)
bar(val,yn)
title(['Histogram of scores for ',int2str(M),'-addition of uniformly distributed random signal'])
=======
% m_histo.m

M = input('Type number of set of uniform random signals to add to form Gaussian -->  ');

%--------------------------------------------------------------------------------------------------
% generate uniformly distributed random and find number of occurrence
%--------------------------------------------------------------------------------------------------
xu = ceil(300*rand(3000,1));
val = [1:300]';
for i = 1:300
   yu(i) = sum( xu == val(i) );
end

%--------------------------------------------------------------------------------------------------
% generate normally distributed random and find number of occurrence
%--------------------------------------------------------------------------------------------------
xn = ceil(300*rand(3000,1));
for i = 1:M-1
    xn = xn + ceil(300*rand(3000,1));
end

% ���߱� ������ ũ���� ������ 1~300 �� �ƴϰ� ����. �ٽ� 1~300 ������ ������ ������ش�.
% �׳� M���� ������ ������ �ƴ� �Ǽ��� ���� �� �ֱ� ������ ceil�� ����
% 4�� ������ �� 10�� ������ ��, �÷����� ǥ�������� �� �������Ŵ°� �����غ�
xn = ceil(xn/M); 

for i = 1:300
   yn(i) = sum( xn == val(i) );
end

%--------------------------------------------------------------------------------------------------
% plot
%--------------------------------------------------------------------------------------------------
close all

subplot(2,1,1);
bar(val,yu)
title('Histogram of scores for uniformly distributed random signal')

subplot(2,1,2)
bar(val,yn)
title(['Histogram of scores for ',int2str(M),'-addition of uniformly distributed random signal'])
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
