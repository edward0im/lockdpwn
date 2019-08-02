<<<<<<< HEAD
function ccf = f_ccf(x1,x2,M)

% �� �Լ��� �� sequence x1, x2 �� cross-correlation function�� ���Ѵ�.
%
% Input
%   x1, x2: input sequences (N-by-1)
%   M: cross ocorrelation���� ��, m�� ���� (-M ~ M)
%
% Output
%   ccf: cross correlation of x (���̴� 2M+1)

% compute CCF
ccf = xcorr( x1 , x2 , M , 'biased' );




=======
function ccf = f_ccf(x1,x2,M)

% �� �Լ��� �� sequence x1, x2 �� cross-correlation function�� ���Ѵ�.
%
% Input
%   x1, x2: input sequences (N-by-1)
%   M: cross ocorrelation���� ��, m�� ���� (-M ~ M)
%
% Output
%   ccf: cross correlation of x (���̴� 2M+1)

% compute CCF
ccf = xcorr( x1 , x2 , M , 'biased' );




>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
