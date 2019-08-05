<<<<<<< HEAD
% m_quantize.m
%
% ������ 1�� �����Ŀ��� quantize(����)�� ����� ������

r = input('Type resolution bit, r (ex. 1, 2, 3, ...) -->  ');
n = 2^r;

t = 0 : 2/100 : 2;
y = sin(2*pi*1*t) + 1; % y�� 0�� 2������ ���� ����

deltay = 1 / 2^(r-1);

scale = 2^(r-1);
yq = fix(scale*y)/scale;

close all
subplot(2,1,1)
plot(t,y,'.-',t,yq,'r.'), grid
title(['Range of y is divided by 2^',int2str(r),' values'])
legend('original','quantized')

subplot(2,1,2)
stem(t,y-yq,'.')
ylabel('quantization error')
=======
% m_quantize.m
%
% ������ 1�� �����Ŀ��� quantize(����)�� ����� ������

r = input('Type resolution bit, r (ex. 1, 2, 3, ...) -->  ');
n = 2^r;

t = 0 : 2/100 : 2;
y = sin(2*pi*1*t) + 1; % y�� 0�� 2������ ���� ����

deltay = 1 / 2^(r-1);

scale = 2^(r-1);
yq = fix(scale*y)/scale;

close all
subplot(2,1,1)
plot(t,y,'.-',t,yq,'r.'), grid
title(['Range of y is divided by 2^',int2str(r),' values'])
legend('original','quantized')

subplot(2,1,2)
stem(t,y-yq,'.')
ylabel('quantization error')
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
