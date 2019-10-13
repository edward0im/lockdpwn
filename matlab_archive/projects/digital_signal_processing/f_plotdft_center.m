<<<<<<< HEAD
function X = f_plotdft_center(x)

% This function is same as f_plotdft except that this calls for
% f_dft_center for computing DFT. See f_dft_center for how it differs from
% f_dft.
%
% Input
%   x: input sequence with odd-number length (say, N)
%
% Output
%   X: DFT of X (length N). 
%      X�� N�� ���ݿ� ���� ��Ī�̱� ������ ����� �̰� �� �� �ʿ� ����

N = length(x);
if ( N > 100 )
    disp('It may take some time to compute DFT...')
end

N = length(x);
if ( N/2 == floor(N/2) ) % x�� ������ ¦���̸� error
    error('N must be an odd number')
end

kmax = (N-1)/2; 
k = 0 : kmax;

X = f_dft_center(x);
Xk = X(1:kmax+1);

close all

subplot(2,2,1)
stem(k,real(Xk),'fill'), ylabel('real( X(k) )')
xlabel('k')

subplot(2,2,3)
stem(k,imag(Xk),'fill'), ylabel('imag( X(k) )')
xlabel([ 'k  (\Omega_k = 2\pik/N  where  N=' , num2str(N) , ')' ])

subplot(2,2,2)
stem(k,abs(Xk),'fill'), ylabel('| X(k) |')
xlabel('k')

subplot(2,2,4)
stem(k,angle(Xk)*180/pi,'fill'), ylabel('\angle X(k) [deg]')
xlabel([ 'k  (\Omega_k = 2\pik/N  where  N=' , num2str(N) , ')' ])

=======
function X = f_plotdft_center(x)

% This function is same as f_plotdft except that this calls for
% f_dft_center for computing DFT. See f_dft_center for how it differs from
% f_dft.
%
% Input
%   x: input sequence with odd-number length (say, N)
%
% Output
%   X: DFT of X (length N). 
%      X�� N�� ���ݿ� ���� ��Ī�̱� ������ ����� �̰� �� �� �ʿ� ����

N = length(x);
if ( N > 100 )
    disp('It may take some time to compute DFT...')
end

N = length(x);
if ( N/2 == floor(N/2) ) % x�� ������ ¦���̸� error
    error('N must be an odd number')
end

kmax = (N-1)/2; 
k = 0 : kmax;

X = f_dft_center(x);
Xk = X(1:kmax+1);

close all

subplot(2,2,1)
stem(k,real(Xk),'fill'), ylabel('real( X(k) )')
xlabel('k')

subplot(2,2,3)
stem(k,imag(Xk),'fill'), ylabel('imag( X(k) )')
xlabel([ 'k  (\Omega_k = 2\pik/N  where  N=' , num2str(N) , ')' ])

subplot(2,2,2)
stem(k,abs(Xk),'fill'), ylabel('| X(k) |')
xlabel('k')

subplot(2,2,4)
stem(k,angle(Xk)*180/pi,'fill'), ylabel('\angle X(k) [deg]')
xlabel([ 'k  (\Omega_k = 2\pik/N  where  N=' , num2str(N) , ')' ])

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
