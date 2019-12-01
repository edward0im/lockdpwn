<<<<<<< HEAD
% �� ���������� �ֱ� 11�� ������ ��ȣ�� 6���� �������� �ռ����� ǥ���ȴٴ� ���� �����ش�.
% ���⼭�� x[n]�� ���Լ��� �ƴϱ� ������ ak�� ���Ҽ��� ���´�.

N = 11; % �ֱ�
n_ori = 0 : N-1; % �� �ֱ�
x_ori = ceil(11*rand(1,N))-6; % -5 ~ 5 ������ �������� 6��
disp(['�ֱ� ',int2str(N),'�� ���� ������ȣ'])
disp(x_ori)

ak = f_dfs(x_ori);
akmag = abs(ak);
akpha = angle(ak);

sx = num2str(x_ori);
sakmag = num2str(akmag');
sakpha = num2str(akpha');

a0 = ak(1);

am1 = akmag(2);
am2 = akmag(3);
am3 = akmag(4);
am4 = akmag(5);
am5 = akmag(6);

ap1 = akpha(2);
ap2 = akpha(3);
ap3 = akpha(4);
ap4 = akpha(5);
ap5 = akpha(6);

nfinal = 20; % n�� ����
n = 0:nfinal; 
nn = 0 : nfinal/200 : nfinal; % ���� ������ �׷����� �ε巴�� ����� ���� ����Ʈ��
x = repmat(x_ori,1,ceil(length(n)/N)); % n�� ���̸�ŭ Ȯ��
x = x(1:length(n));

x0 = a0*ones(size(n)); % DC
x1 = 2*am1*cos( 2*pi*n/N + ap1);
x2 = 2*am2*cos( 4*pi*n/N + ap2);
x3 = 2*am3*cos( 6*pi*n/N + ap3);
x4 = 2*am4*cos( 8*pi*n/N + ap4);
x5 = 2*am5*cos(10*pi*n/N + ap5);

xx0 = a0*ones(size(nn)); % DC
xx1 = 2*am1*cos( 2*pi*nn/N + ap1);
xx2 = 2*am2*cos( 4*pi*nn/N + ap2);
xx3 = 2*am3*cos( 6*pi*nn/N + ap3);
xx4 = 2*am4*cos( 8*pi*nn/N + ap4);
xx5 = 2*am5*cos(10*pi*nn/N + ap5);
xx = xx0 + xx1 + xx2 + xx3 + xx4 + xx5;

xmin = min( [ min(xx) min(xx0), min(xx1), min(xx2), min(xx3) min(xx4) min(xx5) ] );
xmax = max( [ max(xx) max(xx0), max(xx1), max(xx2), max(xx3) max(xx4) max(xx5) ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
figure
subplot(2,1,1)

plot3(nn,-1*ones(1,201),xx,'k','linewidth',3)
hold on
plot3(nn,0*ones(1,201),xx0,'b')
plot3(nn,1*ones(1,201),xx1,'g')
plot3(nn,2*ones(1,201),xx2,'r')
plot3(nn,3*ones(1,201),xx3,'m')
plot3(nn,4*ones(1,201),xx4,'c')
plot3(nn,5*ones(1,201),xx5,'y')
grid
view(40,25)
xlabel('n')
ylabel('k (k-th harmonic)')
zlabel('x_{k}[n]')

subplot(2,1,2)
stem(n_ori,akmag); xlabel('k'), ylabel('| a_k |')

disp('Figure 3�� ù° �׸��� �Ʒ��� ���� ȸ������, ��° �׸��� ũ��� �´��� Ȯ���Ͻÿ�.')
disp('subplot(2,1,1)')
disp('view(88,0)')
disp('�׷� ���� data cursor�� �̿��Ͽ� �׷����� ������ ��.')
=======
% �� ���������� �ֱ� 11�� ������ ��ȣ�� 6���� �������� �ռ����� ǥ���ȴٴ� ���� �����ش�.
% ���⼭�� x[n]�� ���Լ��� �ƴϱ� ������ ak�� ���Ҽ��� ���´�.

N = 11; % �ֱ�
n_ori = 0 : N-1; % �� �ֱ�
x_ori = ceil(11*rand(1,N))-6; % -5 ~ 5 ������ �������� 6��
disp(['�ֱ� ',int2str(N),'�� ���� ������ȣ'])
disp(x_ori)

ak = f_dfs(x_ori);
akmag = abs(ak);
akpha = angle(ak);

sx = num2str(x_ori);
sakmag = num2str(akmag');
sakpha = num2str(akpha');

a0 = ak(1);

am1 = akmag(2);
am2 = akmag(3);
am3 = akmag(4);
am4 = akmag(5);
am5 = akmag(6);

ap1 = akpha(2);
ap2 = akpha(3);
ap3 = akpha(4);
ap4 = akpha(5);
ap5 = akpha(6);

nfinal = 20; % n�� ����
n = 0:nfinal; 
nn = 0 : nfinal/200 : nfinal; % ���� ������ �׷����� �ε巴�� ����� ���� ����Ʈ��
x = repmat(x_ori,1,ceil(length(n)/N)); % n�� ���̸�ŭ Ȯ��
x = x(1:length(n));

x0 = a0*ones(size(n)); % DC
x1 = 2*am1*cos( 2*pi*n/N + ap1);
x2 = 2*am2*cos( 4*pi*n/N + ap2);
x3 = 2*am3*cos( 6*pi*n/N + ap3);
x4 = 2*am4*cos( 8*pi*n/N + ap4);
x5 = 2*am5*cos(10*pi*n/N + ap5);

xx0 = a0*ones(size(nn)); % DC
xx1 = 2*am1*cos( 2*pi*nn/N + ap1);
xx2 = 2*am2*cos( 4*pi*nn/N + ap2);
xx3 = 2*am3*cos( 6*pi*nn/N + ap3);
xx4 = 2*am4*cos( 8*pi*nn/N + ap4);
xx5 = 2*am5*cos(10*pi*nn/N + ap5);
xx = xx0 + xx1 + xx2 + xx3 + xx4 + xx5;

xmin = min( [ min(xx) min(xx0), min(xx1), min(xx2), min(xx3) min(xx4) min(xx5) ] );
xmax = max( [ max(xx) max(xx0), max(xx1), max(xx2), max(xx3) max(xx4) max(xx5) ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
figure
subplot(2,1,1)

plot3(nn,-1*ones(1,201),xx,'k','linewidth',3)
hold on
plot3(nn,0*ones(1,201),xx0,'b')
plot3(nn,1*ones(1,201),xx1,'g')
plot3(nn,2*ones(1,201),xx2,'r')
plot3(nn,3*ones(1,201),xx3,'m')
plot3(nn,4*ones(1,201),xx4,'c')
plot3(nn,5*ones(1,201),xx5,'y')
grid
view(40,25)
xlabel('n')
ylabel('k (k-th harmonic)')
zlabel('x_{k}[n]')

subplot(2,1,2)
stem(n_ori,akmag); xlabel('k'), ylabel('| a_k |')

disp('Figure 3�� ù° �׸��� �Ʒ��� ���� ȸ������, ��° �׸��� ũ��� �´��� Ȯ���Ͻÿ�.')
disp('subplot(2,1,1)')
disp('view(88,0)')
disp('�׷� ���� data cursor�� �̿��Ͽ� �׷����� ������ ��.')
>>>>>>> 1c09010ef4f575c84c998f27e33251ff22ca30a8
