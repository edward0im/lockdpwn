<<<<<<< HEAD
function [xacf,Pxx] = f_plotpsd(x,M)

% �� �Լ��� x[n], n=0,...,N-1 �� �־����� ��, ACF�� PSD�� ���ϰ�,
% �̵��� plot���ش�. Window�� ������ �ʴ´�.
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

%%%% ACF �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all

stem( -M:M , xacf , '.-', 'filled' )
xlabel('m'); ylabel('ACF, \phi_{ xx}[m]'); xlim([ -M, M])

%%%% PSD �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure % ���ο� window�� ����

% �׸��� �׸� �κи� �����.
k = 0 : M;
Pxxk = Pxx(1:M+1); 

subplot(2,2,1)
stem(k,real(Pxxk),'fill'), ylabel('real( P_{xx}(k) )')
xlabel('k'); xlim([ 0, M])

subplot(2,2,3)
stem(k,imag(Pxxk),'fill'), ylabel('imag( P_{xx}(k) )')
xlabel([ 'k  (\Omega_k = 2\pik/(2M+1)  where  M=' , num2str(M) , ')' ]); xlim([ 0, M])

subplot(2,2,2)
stem(k,abs(Pxxk),'fill'), ylabel('| P_{xx}(k) |')
xlabel('k'); xlim([ 0, M])

subplot(2,2,4)
stem(k,angle(Pxxk)*180/pi,'fill'), ylabel('\angle P_{xx}(k) [deg]')
xlabel([ 'k  (\Omega_k = 2\pik/(2M+1)  where  M=' , num2str(M) , ')' ]); xlim([ 0, M])

=======
function [xacf,Pxx] = f_plotpsd(x,M)

% �� �Լ��� x[n], n=0,...,N-1 �� �־����� ��, ACF�� PSD�� ���ϰ�,
% �̵��� plot���ش�. Window�� ������ �ʴ´�.
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

%%%% ACF �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all

stem( -M:M , xacf , '.-', 'filled' )
xlabel('m'); ylabel('ACF, \phi_{ xx}[m]'); xlim([ -M, M])

%%%% PSD �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure % ���ο� window�� ����

% �׸��� �׸� �κи� �����.
k = 0 : M;
Pxxk = Pxx(1:M+1); 

subplot(2,2,1)
stem(k,real(Pxxk),'fill'), ylabel('real( P_{xx}(k) )')
xlabel('k'); xlim([ 0, M])

subplot(2,2,3)
stem(k,imag(Pxxk),'fill'), ylabel('imag( P_{xx}(k) )')
xlabel([ 'k  (\Omega_k = 2\pik/(2M+1)  where  M=' , num2str(M) , ')' ]); xlim([ 0, M])

subplot(2,2,2)
stem(k,abs(Pxxk),'fill'), ylabel('| P_{xx}(k) |')
xlabel('k'); xlim([ 0, M])

subplot(2,2,4)
stem(k,angle(Pxxk)*180/pi,'fill'), ylabel('\angle P_{xx}(k) [deg]')
xlabel([ 'k  (\Omega_k = 2\pik/(2M+1)  where  M=' , num2str(M) , ')' ]); xlim([ 0, M])

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
