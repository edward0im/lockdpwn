/*
  c �ڵ����� ==> 2�� ���� �ý����� ������ �ڵ� (RLC ȸ��, �������۽������ý���)
*/
#include "stdafx.h"
#include <conio.h>
#include <string.h>
#include <Windows.h>

float w[2000];
float omega = 10, delta = 1, rr = 1.0;

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

  printf("1�� �����ý����� ����� ����\n");
  printf("������ ������ �̸��� �Է��ϼ���\n");
  printf("�����̸� :");

  scanf("%s", fname);
  strcat(fname, ".dat");
  fp = fopen(fname, "w");

  printf("### ������ ������...\n");
  for (i = 0; i < 2000; i++)
  {
    fprintf(fp, "%f	%f\n", i*0.001, w[i]);
  }
  fclose(fp);
  printf("### ������ ������ �Ϸ�ƽ��ϴ�\n");

}

void para_input()
{
  clrscr();

  gotoxy(10, 5);
  printf("2�� ���� �ý����� �� �Ķ���͸� �Է��ϼ���");

  gotoxy(10, 8);
  printf("��ǥ�Է� R = [%f] ", rr);
  scanf("%f", &rr);

  gotoxy(10, 10);
  printf("�����ļ� wn [rad/sec] = [%f] ", omega);
  scanf("%f", &omega);

  gotoxy(10, 12);
  printf("������ delta = [%f] ", delta);
  scanf("%f", &delta);

}

void main()
{
  unsigned int i;
  float error,ee, ee1, gg, gg1, gg2, ww;

  para_input();

  i = 0;
  ee = .0;	// ���п���
  ee1 = .0;
  gg = .0;
  ww = .0;	// ���ӵ�
  error = .0;
  gg1 = .0;
  gg2 = .0;

  w[0] = 0;

  /*
    delta		// ������
    omega		// �����ļ� Wn
    ei			// �Է����� (V)
    gg			// �������� ���� (1/T)
  */

  while (i < 2000)
  {
    error = rr - gg2;
    ee = omega * omega * error;			// ���п��� ���
    ww += (ee + ee1)*0.001 / 2;			// ���� �� ���ӵ��� �����Ѵ� (�ֱ�ð� 0.001��)

    gg = ww - 2 * delta * omega * gg2;
    gg2 += (gg + gg1)*0.001 / 2;

    w[i] = gg2;

    //printf("��°� w[%d] = %f \n", i, w[i]);

    ee1 = ee;
    gg1 = gg;
    i++;
  }

  save();
}
