<<<<<<< HEAD
function [X] = f_dft_center(x)

% �� �Լ��� �־��� x(1:N)�� 
% x[0] ~ x[N-1]�� �־��� ���� �ƴ϶�
% x[-M], ... , x[0], ..., x[M]���� �־��� ���, DFT�� ���Ѵ�.
% x�� ������ �ݵ�� Ȧ���̾�� �Ѵ�.
% x�� n=0�� �߽����� �� ��Ī�� �ʿ�� ����.
%
% Input
%   x: input sequence with odd-number length (say, N)
%
% Output
%   X: DFT of X (length N). 
%      X�� N�� ���ݿ� ���� ��Ī�̱� ������ ����� �̰� �� �� �ʿ� ����

N = length(x);
if ( N/2 == floor(N/2) ) % x�� ������ ¦���̸� error
    error('N must be an odd number')
end
M = (N-1) / 2;

X = [];
WN = exp(-1j*2*pi/N);

% �Ʒ����� �������� X�� -M ~ M�� ������ �ƴϰ� 0 ~ 2M+1 �� ������.
% -M ~ M ������ ���� ���� ������ FT�� �� �� k=0 ���� ���� ��찡 �����Ƿ�.
for k = 1 : N
    Xk = 0;
    for m = -M : M
        n = m + M + 1;
        pow = (k-1)*m;
        Xk = Xk + x(n)*WN^pow;
    end
    
    X = [X; Xk];
end

% change near-zero values to exactly zero to get correct phase
myzero = 1e-10;
Xr = real(X) .* (abs(real(X)) > myzero);
Xi = imag(X) .* (abs(imag(X)) > myzero);
=======
function [X] = f_dft_center(x)

% �� �Լ��� �־��� x(1:N)�� 
% x[0] ~ x[N-1]�� �־��� ���� �ƴ϶�
% x[-M], ... , x[0], ..., x[M]���� �־��� ���, DFT�� ���Ѵ�.
% x�� ������ �ݵ�� Ȧ���̾�� �Ѵ�.
% x�� n=0�� �߽����� �� ��Ī�� �ʿ�� ����.
%
% Input
%   x: input sequence with odd-number length (say, N)
%
% Output
%   X: DFT of X (length N). 
%      X�� N�� ���ݿ� ���� ��Ī�̱� ������ ����� �̰� �� �� �ʿ� ����

N = length(x);
if ( N/2 == floor(N/2) ) % x�� ������ ¦���̸� error
    error('N must be an odd number')
end
M = (N-1) / 2;

X = [];
WN = exp(-1j*2*pi/N);

% �Ʒ����� �������� X�� -M ~ M�� ������ �ƴϰ� 0 ~ 2M+1 �� ������.
% -M ~ M ������ ���� ���� ������ FT�� �� �� k=0 ���� ���� ��찡 �����Ƿ�.
for k = 1 : N
    Xk = 0;
    for m = -M : M
        n = m + M + 1;
        pow = (k-1)*m;
        Xk = Xk + x(n)*WN^pow;
    end
    
    X = [X; Xk];
end

% change near-zero values to exactly zero to get correct phase
myzero = 1e-10;
Xr = real(X) .* (abs(real(X)) > myzero);
Xi = imag(X) .* (abs(imag(X)) > myzero);
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
X = Xr + 1i*Xi;