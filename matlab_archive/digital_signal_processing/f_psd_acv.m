<<<<<<< HEAD
function [xacv,Pxx] = f_psd_acv(x,M)

% �� �Լ��� �⺻������ f_psd�� ������. �� f_psd�� ACF�� �̿��ϰ�,
% �� �Լ��� autocovariance�� �̿��Ͽ�, PSD�� ����.
%
% Input
%   x: input sequence (N-by-1)
%   M: autocovariance���� ��, m�� ���� (-M ~ M)
%
% Output
%   xacv: autocovariance of x (���̴� 2M+1)
%   Pxx: PSD (���̴� 2M+1). ���̴� 2M+1������ M+1�� �������� ������ ��Ī.

N = length(x);

% x�� ���� ACV�� ���Ѵ� (����: -M ~ M)
xacv = xcov(x,M,'biased');

% ACF�� DFT�� ���Ѵ�.
Pxx = f_dft_center(xacv);
=======
function [xacv,Pxx] = f_psd_acv(x,M)

% �� �Լ��� �⺻������ f_psd�� ������. �� f_psd�� ACF�� �̿��ϰ�,
% �� �Լ��� autocovariance�� �̿��Ͽ�, PSD�� ����.
%
% Input
%   x: input sequence (N-by-1)
%   M: autocovariance���� ��, m�� ���� (-M ~ M)
%
% Output
%   xacv: autocovariance of x (���̴� 2M+1)
%   Pxx: PSD (���̴� 2M+1). ���̴� 2M+1������ M+1�� �������� ������ ��Ī.

N = length(x);

% x�� ���� ACV�� ���Ѵ� (����: -M ~ M)
xacv = xcov(x,M,'biased');

% ACF�� DFT�� ���Ѵ�.
Pxx = f_dft_center(xacv);
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
