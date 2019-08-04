function diffex(func,dfunc,x,n)
format long

% x���� �� �Լ��� ������ ���մϴ�
dftrue = dfunc(x);

% ó�� h�� ���� 1�� �����ϰ�
h =1 ;                                  

% H�� ���� �ֽ��ϴ�
H(1) = h;                               

% �߽������� �ٻ縦 ���մϴ�
D(1) = (func(x+h)-func(x-h))/(2*h);     

% ���������� �������� ������ ���մϴ�
E(1) = abs(dftrue - D(1));              

% i�� 2���� n���� ������Ű�鼭 H,D,E�� ���� ���մϴ�
for i = 2:n
    h = h/10;
    H(i) = h;
    D(i) = (func(x+h)-func(x-h))/(2*h);
    E(i) = abs(dftrue - D(i));
    
end

% H,D,E�� ���� �����ͷ� ��Ÿ���ϴ�
L=[H' D' E']';

% fprintf �Լ��� ���� H,D,E ������ ������� ����մϴ�
fprintf(' step size     finite difference       true error\n');
fprintf('%14.10f    %16.14f     %16.13ff\n',L);
loglog(H,E), xlabel('Step Size'), ylabel('Error')
title('Plot of Error Versus Step Size')
format short