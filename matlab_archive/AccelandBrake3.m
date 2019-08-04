% matlab ==> 
clear,clc;

% ���� ����
m = 747;        % �����߷�
ml = 819;       % �����߷�
l = 2.347;     % �ٺ��̽�
lf = 1.103;     % ������ ���� 
lr = l - lf;    % ������ �ķ�
lf2 = 1.126;    % ����� ����
lr2 = l - lf2;  % ����� �ķ�
h = 0.54;       % �����߽� ����
g = 9.81;       % �߷°��ӵ�
W = m*g;        % �����߷� ����
W2 = ml*g;      % �����߷� ����

a = 0:0.01:1;   % �������
Fbf_W = a.*(lr/l +h/l.*a);     % Fbf/W ������
Fbr_W = a.*(lf/l -h/l.*a);     % Fbr/W ������
Fbf_W2 = a.*(lr2/l +h/l.*a);     % Fbf/W �����  
Fbr_W2 = a.*(lf2/l -h/l.*a);     % Fbr/W �����

Fbf = Fbf_W*W;  
Fbr = Fbr_W*W;
Fbf2 = Fbf_W2*W2;  
Fbr2 = Fbr_W2*W2;

mub = 0.4;   % Mu �� ����

Fbfmax_W = mub*(W*lr/l+h/l*Fbr)/(1-mub*h/l)/W;
Fbrmax_W = mub*(W*lf/l-h/l*Fbf)/(1+mub*h/l)/W;
Fbfmax_W2 = mub*(W2*lr/l+h/l*Fbr2)/(1-mub*h/l)/W2;
Fbrmax_W2 = mub*(W2*lf/l-h/l*Fbf2)/(1+mub*h/l)/W2;

hold on
plot(Fbf_W,Fbr_W,'r','linewidth',1.5)
plot(Fbf_W2,Fbr_W2,'b','linewidth',1.5)
legend('�����߷�','�����߷�')

for n = -3:6
    eval(['plot(Fbfmax_W+',num2str(n*0.1),',Fbr_W,''--'',''Color'',[0 0 0],''linewidth'',1)'])
end

for n = -3:6
    eval(['plot(Fbf_W,Fbrmax_W+',num2str(n*0.05),',''--'',''Color'',[0 0 0],''linewidth'',1)'])
end

plot(Fbfmax_W2,Fbr_W,'Color',[1 0 0],'linewidth',2)
plot(Fbf_W,Fbrmax_W2,'Color',[0 1 0],'linewidth',2)
axis([0 0.9 0 0.4]), grid


