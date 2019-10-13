<<<<<<< HEAD
function [xacf,xacfM] = f_plotacf(x,M)

% �� �Լ��� �Է½�ȣ x�� �޾Ƽ�, �� ��ȣ�� ACF(Autocorrelation Function)�� ���ϰ�,
% �̸� plot���ش�.
%
% Input
%   x: �Է� ��ȣ(���� N)
%   M: ACF�� ���� ��, m�� ���� ��, m = -M ~ M (���� M�� N�� 15%~20% ������ ��� ���� ������)
%
% Output
%   xacf: ACF of x (full length �� -(N-1) ~ (N-1)). ���� 2N-1
%   xacfM: ACF of x (-M ~ M ����). ���� 2M+1

N = length(x);

n = 0 : N-1;
m = -M : M;

xacf = xcorr(x,'biased'); % full length, �� -(N-1) ~ (N-1)
xacfM = xcorr(x,M,'biased'); % -M to M

close all

% x�� �׸���. �� ������ ����. n = 0 ~ N-1
subplot(2,2,1)
stem( n , x , '.-' )
xlabel('n (full range)'); ylabel('x[n]'); xlim([0 N]) 

% x�� �׸���. Ȯ��� ������ ���� (N�� 300���� ū ��쿡��), n = 200 ~ 300
if ( N > 300 )
    subplot(2,2,3)
    stem( n , x , '.-' )
    xlabel('n (200~300)'); ylabel('x[n]'); xlim([200 300]) 
end

% ACF�� �׸���. �� ������ ����. m = -(N-1) ~ (N-1)
subplot(2,2,2)
stem( -(N-1):(N-1) , xacf , '.-' )
xlabel('m (full range)'); ylabel('ACF, \phi_{ xx}[m]'); xlim([-N N]) 

% ACF�� �׸���. �־��� ������ ����. m = -M ~ M
subplot(2,2,4)
stem( -M:M , xacfM , '.-' )
xlabel('m (-M ~ M)'); ylabel('ACF, \phi_{ xx}[m]'); xlim([-M M]) 
=======
function [xacf,xacfM] = f_plotacf(x,M)

% �� �Լ��� �Է½�ȣ x�� �޾Ƽ�, �� ��ȣ�� ACF(Autocorrelation Function)�� ���ϰ�,
% �̸� plot���ش�.
%
% Input
%   x: �Է� ��ȣ(���� N)
%   M: ACF�� ���� ��, m�� ���� ��, m = -M ~ M (���� M�� N�� 15%~20% ������ ��� ���� ������)
%
% Output
%   xacf: ACF of x (full length �� -(N-1) ~ (N-1)). ���� 2N-1
%   xacfM: ACF of x (-M ~ M ����). ���� 2M+1

N = length(x);

n = 0 : N-1;
m = -M : M;

xacf = xcorr(x,'biased'); % full length, �� -(N-1) ~ (N-1)
xacfM = xcorr(x,M,'biased'); % -M to M

close all

% x�� �׸���. �� ������ ����. n = 0 ~ N-1
subplot(2,2,1)
stem( n , x , '.-' )
xlabel('n (full range)'); ylabel('x[n]'); xlim([0 N]) 

% x�� �׸���. Ȯ��� ������ ���� (N�� 300���� ū ��쿡��), n = 200 ~ 300
if ( N > 300 )
    subplot(2,2,3)
    stem( n , x , '.-' )
    xlabel('n (200~300)'); ylabel('x[n]'); xlim([200 300]) 
end

% ACF�� �׸���. �� ������ ����. m = -(N-1) ~ (N-1)
subplot(2,2,2)
stem( -(N-1):(N-1) , xacf , '.-' )
xlabel('m (full range)'); ylabel('ACF, \phi_{ xx}[m]'); xlim([-N N]) 

% ACF�� �׸���. �־��� ������ ����. m = -M ~ M
subplot(2,2,4)
stem( -M:M , xacfM , '.-' )
xlabel('m (-M ~ M)'); ylabel('ACF, \phi_{ xx}[m]'); xlim([-M M]) 
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
