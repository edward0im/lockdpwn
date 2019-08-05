<<<<<<< HEAD
function [xacf,Pxx] = f_psd_acf(x,M)

% �� �Լ��� x[n], n=0,...,N-1 �� �־����� ��, ACF�� PSD�� ���Ѵ�.
% PSD�� ���� �� window�� ������ �ʴ´�.
%
% Input
%   x: input sequence (N-by-1)
%   M: autocorrelation���� ��, m�� ���� (-M ~ M)
%
% Output
%   xacf: autocorrelation of x (���̴� 2M+1)
%   Pxx: PSD (���̴� 2M+1). ���̴� 2M+1������ M+1�� �������� ������ ��Ī.

N = length(x);

% x�� ���� ACF�� ���Ѵ� (����: -M ~ M)
xacf = xcorr(x,M,'biased');

% ACF�� DFT�� ���Ѵ�.
Pxx = f_dft_center(xacf);

=======
function [xacf,Pxx] = f_psd_acf(x,M)

% �� �Լ��� x[n], n=0,...,N-1 �� �־����� ��, ACF�� PSD�� ���Ѵ�.
% PSD�� ���� �� window�� ������ �ʴ´�.
%
% Input
%   x: input sequence (N-by-1)
%   M: autocorrelation���� ��, m�� ���� (-M ~ M)
%
% Output
%   xacf: autocorrelation of x (���̴� 2M+1)
%   Pxx: PSD (���̴� 2M+1). ���̴� 2M+1������ M+1�� �������� ������ ��Ī.

N = length(x);

% x�� ���� ACF�� ���Ѵ� (����: -M ~ M)
xacf = xcorr(x,M,'biased');

% ACF�� DFT�� ���Ѵ�.
Pxx = f_dft_center(xacf);

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
