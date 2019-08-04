/*
	c �ڵ����� ==> ���������� ������ �Է����п� ���� ���ӵ� ���ϴ� �ڵ�
*/
#include "stdafx.h"
#include <math.h>
#include <string.h>
#include <Windows.h>
#include <conio.h>

float w[1000];
float current[1000];
float ei = 5.0, ri = 5.0, kt = 0.5, jj = 0.101, kv = 0.68;

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

	gotoxy(10, 5);
	printf("���� �������� �� �Ķ���͸� �Է��Ͻÿ�");
	gotoxy(10, 8);
	printf("�Է� ����[V] = [%f] ", ei);
	scanf("%f", &ei);

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
	printf("������������[V/rad/s] = [%f] ", kv);
	scanf("%f", &kv);
}

void main()
{
	unsigned int i;
	float ee, ii, tt, tl, tj, ww, tj1;

	i = 0;		
	tl = 0.0;	// �ܶ� (Tl) : ���� ���ϴ� ������ ������ �� �ִ� , 0.2
	ee = 0.0;	// ���п���
	ii = 0.0;	// ����
	tt = 0.0;	// ������ũ
	tj = 0.0;	// �ʿ���ũ (Tj)
	ww = 0.0;	// ���ӵ�
	tj1 = 0.0;	// �����ʿ���ũ (���� tj��)
	current[0] = 0.0;	//

	/*
		ei			// �Է����� (V)
		ri			// ������ ���� (Ohm)
		kt			// ������ ����/��ũ ��� (Kt)(Nm/A)
		jj			// �������Ʈ
		kv			// ������������..?
	*/

	para_input();

	while (i < 1000)
	{
		ee = ei - kv*ww;	// ���п��� ��� ( V = V0 - Kv*w )
		ii = ee / ri;		// ���� ��� ( I = V/R )
		tt = kt *ii;		// ������ ���� ��ũ ��� ( T = Kt * I )
		tj = (tt - tl) / jj;	// �������� �ʿ� ȸ�� ��ũ ��� ( Tj = (T - Tl) / J
		ww += (tj + tj1) * 0.01 / 2;	// ���� �� ���ӵ��� �����Ѵ� (�ֱ�ð� 0.01��)

		w[i] = ww;	
		current[i] = ii;

		printf(" ������ũ[tt] = %f, ȸ����ũ[tj] = %f, ���ӵ�[ww] = %f, ���п���[ee] = %f, �������ӵ�[w[%d]] = %f \n"
			, tt, tj, ww, ee, i, w[i]);
		tj1 = tj;
		i++;
	}

//	save();
}

