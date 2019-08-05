% matlab ==> ���� 45������ ������ ��Ȳ�� plot���� ������ó�� ���̰� �� �ڵ�
clc,clear all

% g ���� �ʱ� ������ ���� theta��, �ʱ�ӵ� ���� �����մϴ�
g = 9.81; 
theta0 = 45*pi/180; 
v0=5;

% �ʱⰪ�� �����մϴ�
t(1) = 0; 
x =0; 
y =0;

% 0���϶��� plot�մϴ�
plot(x,y,'o','MarkerFaceColor','b','MarkerSize',8)
title('The orbital of thrown Ball','fontsize',15);
xlabel('Time (t)','fontsize',15);
ylabel('Height (m)','fontsize',15);
axis([0 3 0 0.8])
grid on
hold on

% dt�� ���� �����մϴ�
% �۰� ������ ���� �� õõ�� �����̴� �������� �� �� �ֽ��ϴ�
dt = 1/256;

for j = 2:1000
    
    % ������ ���鼭 x,y ���� �ް�
    t(j) = t(j-1) + dt;
    x = v0*cos(theta0)*t(j);
    y = v0*sin(theta0)*t(j)-0.5*g*t(j)^2;
    
    % �׷����� �׸��ϴ�
    plot(x,y,'o','MarkerFacecolor','b','MarkerSize',8)
    axis([0 3 0 0.8])
    
    M(j) = getframe;
    
    % ���� ���� �������� ���α׷��� ����˴ϴ�
    if y<=0
        break
    end
end


% ���� �ʿ���� �ڵ��ε�.. ���߰� ���ʹ����� õõ�� �ٽ� �����Ѵ�
pause
movie(M,1)

