<<<<<<< HEAD
function [xacv,Pxx] = f_plotpsd2(x,M)

% �� �Լ��� �⺻������ f_plotpsd�� ������. �� f_plotpsd�� ACF�� �̿��ϰ�,
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

%%%% ACF �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stem( -M:M , xacv , '.-', 'filled' )
xlabel('m'); ylabel('Autocovariance, \gamma_{ xx}[m]'); xlim([ -M, M])

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
function [xacv,Pxx] = f_plotpsd2(x,M)

% �� �Լ��� �⺻������ f_plotpsd�� ������. �� f_plotpsd�� ACF�� �̿��ϰ�,
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

%%%% ACF �׷��� �׸��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stem( -M:M , xacv , '.-', 'filled' )
xlabel('m'); ylabel('Autocovariance, \gamma_{ xx}[m]'); xlim([ -M, M])

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
