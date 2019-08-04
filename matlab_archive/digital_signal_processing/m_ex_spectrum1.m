<<<<<<< HEAD
% �� ���������� �ֱ� 6�� ��ȣ�� 4���� �������� �ռ����� ǥ���ȴٴ� ���� �����ش�.
%x = 3 + 2*cos(2*pi*n/6) + 8*cos(6*pi*n/6);

n_ori = 0 : 5; % �� �ֱ�
x_ori = 3 + 2*cos(2*pi*n_ori/6) + 8*cos(6*pi*n_ori/6);
ak = f_dfs(x_ori); % ���Լ��̱� ������ �Ǽ��� ����
sx = num2str(x_ori);
sak = num2str(ak');

a0 = ak(1);
a1 = ak(2);
a2 = ak(3);
a3 = ak(4);

n = 0:11; % 2�ֱ�� Ȯ��
nn = 0 : 11/200 : 11; % ���� ������ �׷����� �ε巴�� ����� ���� ����Ʈ��
x = repmat(x_ori,1,2); % 2�ֱ⸸ŭ Ȯ��

x0 = a0 * ones(size(n)); % DC
x1 = 2 * a1 * cos(2*pi*n/6);
x2 = 2 * a2 * cos(4*pi*n/6);
x3 = a3 * cos(6*pi*n/6);

xx0 = a0 * ones(size(nn)); % DC
xx1 = 2 * a1 * cos(2*pi*nn/6);
xx2 = 2 * a2 * cos(4*pi*nn/6);
xx3 = a3 * cos(6*pi*nn/6);
xx = xx0 + xx1 + xx2 + xx3;

xmin = min( [ min(xx) min(xx0), min(xx1), min(xx2), min(xx3) ] );
xmax = max( [ max(xx) max(xx0), max(xx1), max(xx2), max(xx3) ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
subplot(1,2,1)
plot(n,x,'ok','MarkerFaceColor','k'), hold on
plot(n,x0,'ob',n,x1,'og',n,x2,'or',n,x3,'om')
s  = 'x[n] (N=6)';
s0 = 'a_0 cos(\Omega_0 n)';
s1 = '2a_1 cos(\Omega_1 n)';
s2 = '2a_2 cos(\Omega_2 n)';
s3 = 'a_3 cos(\Omega_3 n)';
legend(s,s0,s1,s2,s3)
title(['x = ',sx,' ,   a_k = ',sak])

plot(nn,xx0+xx1+xx2+xx3,'k:')
plot(nn,xx0,'b',nn,xx1,'g',nn,xx2,'r',nn,xx3,'m'); hold off
axis([ min(n)-1 max(n)+1 xmin-1 xmax+1])
grid

% stem(n,x0); hold on
% stem(n,x1)
% stem(n,x2)
% stem(n,x3); hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)

stem(n_ori,abs(ak)); ylabel('| a_k |')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)

=======
% �� ���������� �ֱ� 6�� ��ȣ�� 4���� �������� �ռ����� ǥ���ȴٴ� ���� �����ش�.
%x = 3 + 2*cos(2*pi*n/6) + 8*cos(6*pi*n/6);

n_ori = 0 : 5; % �� �ֱ�
x_ori = 3 + 2*cos(2*pi*n_ori/6) + 8*cos(6*pi*n_ori/6);
ak = f_dfs(x_ori); % ���Լ��̱� ������ �Ǽ��� ����
sx = num2str(x_ori);
sak = num2str(ak');

a0 = ak(1);
a1 = ak(2);
a2 = ak(3);
a3 = ak(4);

n = 0:11; % 2�ֱ�� Ȯ��
nn = 0 : 11/200 : 11; % ���� ������ �׷����� �ε巴�� ����� ���� ����Ʈ��
x = repmat(x_ori,1,2); % 2�ֱ⸸ŭ Ȯ��

x0 = a0 * ones(size(n)); % DC
x1 = 2 * a1 * cos(2*pi*n/6);
x2 = 2 * a2 * cos(4*pi*n/6);
x3 = a3 * cos(6*pi*n/6);

xx0 = a0 * ones(size(nn)); % DC
xx1 = 2 * a1 * cos(2*pi*nn/6);
xx2 = 2 * a2 * cos(4*pi*nn/6);
xx3 = a3 * cos(6*pi*nn/6);
xx = xx0 + xx1 + xx2 + xx3;

xmin = min( [ min(xx) min(xx0), min(xx1), min(xx2), min(xx3) ] );
xmax = max( [ max(xx) max(xx0), max(xx1), max(xx2), max(xx3) ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
subplot(1,2,1)
plot(n,x,'ok','MarkerFaceColor','k'), hold on
plot(n,x0,'ob',n,x1,'og',n,x2,'or',n,x3,'om')
s  = 'x[n] (N=6)';
s0 = 'a_0 cos(\Omega_0 n)';
s1 = '2a_1 cos(\Omega_1 n)';
s2 = '2a_2 cos(\Omega_2 n)';
s3 = 'a_3 cos(\Omega_3 n)';
legend(s,s0,s1,s2,s3)
title(['x = ',sx,' ,   a_k = ',sak])

plot(nn,xx0+xx1+xx2+xx3,'k:')
plot(nn,xx0,'b',nn,xx1,'g',nn,xx2,'r',nn,xx3,'m'); hold off
axis([ min(n)-1 max(n)+1 xmin-1 xmax+1])
grid

% stem(n,x0); hold on
% stem(n,x1)
% stem(n,x2)
% stem(n,x3); hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)

stem(n_ori,abs(ak)); ylabel('| a_k |')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)

>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
stem(n_ori,angle(ak)*180/pi); ylabel('\angle a_k [deg]')