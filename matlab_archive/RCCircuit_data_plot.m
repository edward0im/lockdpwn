% matlab ==> simulink�����, simulink�� ���� ���� RCȸ�� ������ ���� plot�ϴ� �ڵ�

plot(tout, yout(:,1), tout, yout(:,2),'linewidth',2)

xlabel('Time (secs)', 'fontsize', 15); 
ylabel('Amplitude (volts)', 'fontsize', 15);
grid

st1 = 'Capacitor Voltage Plot: R = ';
st2 = num2str(R);
st3 = ' \omega';
st4 = ', C = ' ;
st5 = num2str(C);
st6 = ' F ';

stitle = strcat(st1,st2,st3,st4,st5,st6);
title(stitle, 'fontsize',16)

legend('input voltage', 'output voltage', axis([0 10 -5 15]));