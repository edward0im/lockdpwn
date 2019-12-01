<<<<<<< HEAD
function f_FAcompare(x,M)

% �� �Լ��� 4������ ���ļ��м��� ���� ���� ���ϰ�, �׸��� �׷��ش�.
%  frequecny response (FT of x[n])
%  PSD 1 (autocorrelation ����� PSD)
%  PSD 2 (autocovariance ����� PSD)
%  periodogram
%
% Input
%   x: �Է� ��ȣ(���� N)
%   M: ACF�� ���� ��, m�� ���� ��, m = -M ~ M (���� M�� N�� 15%~20% ������ ��� ���� ������)

N = length(x);

%%  frequecny response (FT of x[n])
X = f_dft(x); % ���Ҽ�, ���� N

% �׸��� ���� x�� (0���� 2pi ����)
xX = [0 : N-1] / (N-1); 

%%  PSD 1 (autocorrelation ����� PSD)
[xacf1,Pxx1] = f_psd_acf(x,M); % �Ǽ�, ���� 2M+1

% �׸��� ���� x�� (0���� 2pi ����)
xPxx1 = [0 : 2*M] / (2*M);

%%  PSD 2 (autocovariance ����� PSD)
[xacf2,Pxx2] = f_psd_acv(x,M); % �Ǽ�, ���� 2M+1

% �׸��� ���� x�� (0���� 2pi ����)
xPxx2 = xPxx1;

%%  periodogram
Pxx3 = f_periodogram(x); % �Ǽ�, ���� N

% �׸��� ���� x�� (0���� 2pi ����)
xPxx3 = xX;

%% Plot

close all

subplot(2,2,1)
plot(xX,abs(X))
ylabel('| X(\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('Frequency Spectrum')

subplot(2,2,3)
plot(xPxx1,Pxx1)
ylabel('| P_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('PSD based on ACF')

subplot(2,2,2)
plot(xPxx3,Pxx3)
ylabel('| P''_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('Periodogram')

subplot(2,2,4)
plot(xPxx2,Pxx2)
ylabel('| P_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('PSD based on ACV')

% %% Plot
% 
% subplot(1,3,3)
% plot(xX,abs(X),xPxx1,Pxx1,xPxx2,Pxx2,xPxx3,Pxx3)
% xlabel('\Omega (x pi)')
% legend('Freq Spectrum','ACF-based PSD','ACV-based PSD','Periodogram')

=======
function f_FAcompare(x,M)

% �� �Լ��� 4������ ���ļ��м��� ���� ���� ���ϰ�, �׸��� �׷��ش�.
%  frequecny response (FT of x[n])
%  PSD 1 (autocorrelation ����� PSD)
%  PSD 2 (autocovariance ����� PSD)
%  periodogram
%
% Input
%   x: �Է� ��ȣ(���� N)
%   M: ACF�� ���� ��, m�� ���� ��, m = -M ~ M (���� M�� N�� 15%~20% ������ ��� ���� ������)

N = length(x);

%%  frequecny response (FT of x[n])
X = f_dft(x); % ���Ҽ�, ���� N

% �׸��� ���� x�� (0���� 2pi ����)
xX = [0 : N-1] / (N-1); 

%%  PSD 1 (autocorrelation ����� PSD)
[xacf1,Pxx1] = f_psd_acf(x,M); % �Ǽ�, ���� 2M+1

% �׸��� ���� x�� (0���� 2pi ����)
xPxx1 = [0 : 2*M] / (2*M);

%%  PSD 2 (autocovariance ����� PSD)
[xacf2,Pxx2] = f_psd_acv(x,M); % �Ǽ�, ���� 2M+1

% �׸��� ���� x�� (0���� 2pi ����)
xPxx2 = xPxx1;

%%  periodogram
Pxx3 = f_periodogram(x); % �Ǽ�, ���� N

% �׸��� ���� x�� (0���� 2pi ����)
xPxx3 = xX;

%% Plot

close all

subplot(2,2,1)
plot(xX,abs(X))
ylabel('| X(\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('Frequency Spectrum')

subplot(2,2,3)
plot(xPxx1,Pxx1)
ylabel('| P_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('PSD based on ACF')

subplot(2,2,2)
plot(xPxx3,Pxx3)
ylabel('| P''_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('Periodogram')

subplot(2,2,4)
plot(xPxx2,Pxx2)
ylabel('| P_{xx} (\Omega) |'), xlabel('\Omega ( x 2\pi )'), xlim([-0.02 1.02])
title('PSD based on ACV')

% %% Plot
% 
% subplot(1,3,3)
% plot(xX,abs(X),xPxx1,Pxx1,xPxx2,Pxx2,xPxx3,Pxx3)
% xlabel('\Omega (x pi)')
% legend('Freq Spectrum','ACF-based PSD','ACV-based PSD','Periodogram')

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
