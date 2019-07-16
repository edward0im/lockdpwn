/*
	c �ڵ����� ==> ��������� ������ �Է����п� ���� ���ӵ� ���ϴ� �ڵ�
*/
#include "stdafx.h"
#include <math.h>
#include <string.h>
#include <Windows.h>
#include <conio.h>

float w[1000];
float current[1000];
float ri = 5.0, kt = 0.5, jj = 0.101, kv = 0.68, tl =0.0;
float rr = 5.0, kp = 3.0, ki = 2.0, kd = 0.0;

/// vc++���� gotoxy()�� clrscr()�Լ��� �������� �ʴ´�
void gotoxy(int x, int y)
{
	COORD Pos = { x,y };

	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), Pos);
}

void clrscr()
{
	system("cls");
}

void save()
{
	FILE *fp;
	char fname[20];
	int i;

	printf("�������� ���¸� ����\n");
	printf("������ ������ �̸��� �Է��ϼ���\n");
	printf("�����̸� :");

	scanf("%s", fname);
	strcat(fname, ".dat");
	fp = fopen(fname, "w");

	printf("### ������ ������...\n");
	for (i = 0; i < 1000; i++)
	{
		fprintf(fp, "%f	%f	%f\n", i*0.01, current[i], w[i]);
	}
	fclose(fp);
	printf("### ������ ������ �Ϸ�ƽ��ϴ�\n");

}

void para_input()
{
	clrscr();
	
	gotoxy(10, 4);
	printf("���� �������� ȸ�� �ӵ� ����");
	gotoxy(10, 5);
	printf("���� �������� �� �Ķ���͸� �Է��ϼ���");

	gotoxy(10, 10);
	printf("������ ����[ohm] = [%f] ", ri);
	scanf("%f", &ri);

	gotoxy(10, 12);
	printf("������ ����/��ũ ���[Nm/A] = [%f] ", kt);
	scanf("%f", &kt);

	gotoxy(10, 14);
	printf("���� ���Ʈ[] = [%f] ", jj);
	scanf("%f", &jj);

	gotoxy(10, 16);
	printf("�������� ���[V/rads/s] = [%f] ", kv);
	scanf("%f", &kv);

	gotoxy(10, 18);
	printf("�ܶ� = [%f] ", tl);
	scanf("%f", &tl);

	gotoxy(10, 20);
	printf("���� �������� ����� �̵氪�� �Է��Ͻÿ�");
	
	gotoxy(10, 21);
	printf("��ǥ ȸ���ӵ�[rad/s] = [%f] ", rr);
	scanf("%f", &rr);

	gotoxy(10, 22);
	printf("��� �̵氪 [v/rad/s] = [%f] ", kp);
	scanf("%f", &kp);

	gotoxy(10, 23);
	printf("���� �̵氪[] = [%f] ", ki);
	scanf("%f", &ki);

	gotoxy(10, 24);
	printf("�̺� �̵氪[] = [%f] ", kd);
	scanf("%f", &kd);

}

void main()
{
	unsigned int i;
	float ei, ee, ii, tt, tj, ww, tj1;
	float error, error1, error2;

	i = 0;
	ei = 0.0;	// �Է����� 
	ee = 0.0;	// ���п���
	ii = 0.0;	// ����
	tt = 0.0;	// ������ũ
	tj = 0.0;	// �ʿ���ũ (Tj)
	ww = 0.0;	// ���ӵ�
	tj1 = 0.0;	// �����ʿ���ũ (���� tj��)
	w[0] = 0;
	current[0] = 0.0;	//

	error = .0;
	error1 = .0;
	error2 = .0;
	
	/*
		ei			// �Է����� (V)
		ri			// ������ ���� (Ohm)
		kt			// ������ ����/��ũ ��� (Kt)(Nm/A)
		jj			// �������Ʈ
		kv			// ������������ (..?)
		rr			// ��ǥ ȸ���ӵ�
		kp			// ����̵�
		ki			// �����̵�
		kd			// �̺��̵�
	*/

	para_input();

	while (i < 1000)
	{
		error = rr - ww;											// �������
		error2 += (error + error1)*0.01 / 2;						// ����
		ei = kp*error + error2*ki + kd *(error - error1) / 0.01;	// PID�����

		ee = ei - kv*ww;			// ���п��� ��� ( V = V0 - Kv*w )
		ii = ee / ri;				// ���� ��� ( I = V/R )
		tt = kt *ii;				// ������ ���� ��ũ ��� ( T = Kt * I )
		tj = (tt - tl) / jj;		// �������� �ʿ� ȸ�� ��ũ ��� ( Tj = (T - Tl) / J )
		ww += (tj + tj1)*0.01 / 2;	// ���� �� ���ӵ��� �����Ѵ� (�ֱ�ð� 0.01��)
		
		w[i] = ww;
		current[i] = ii;

		error1 = error;

		printf("error = %f     ei = %f     ee =%f	  tt = %f     tj = %f	  w[%d] = %f\n"
			, error, ei, ee, tt, tj, i, w[i]);

		tj1 = tj;
		i++;
	}

//	save();
}

