<<<<<<< HEAD
function Pxx = f_periodogram(x)

N = length(x);

% ���� DFT�� �Ѵ�.
X = f_dft(x); % ���Ҽ��� ���� ����.

=======
function Pxx = f_periodogram(x)

N = length(x);

% ���� DFT�� �Ѵ�.
X = f_dft(x); % ���Ҽ��� ���� ����.

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
Pxx = (abs(X).^2)/N;