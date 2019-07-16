/*
  c �ڵ����� ==> x^2 + 3*x + 6 �Լ��� simpson������ �����ϴ� ���� �ڵ�
*/
#include "stdafx.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

#define MAX_NUM 5000

int data_in(int *n, float *a, float *b);
float simpson(int n, float a, float b, float *s);
int solution_out(int n, float a, float b, float s);
float func(float x);
int save(int n, float a, float b);

float jukbun[MAX_NUM];
float function[MAX_NUM];

int main()
{
  int n;
  float a, b, s;

  while (1)
  {
    data_in(&n, &a, &b);
    simpson(n, a, b, &s);
    solution_out(n, a, b, s);
  }
  /// save(n, a, b);   /// �켱 ������ �� ����

  return 0;
}

int data_in(int *n, float *a, float *b)
{
  printf("\n -------------------------\n");
  printf("�������п��� [a,b] \n");
  printf("a[�ð�] = ");
  scanf("%f", &*a);
  printf("b[�ð�] = ");
  scanf("%f", &*b);
  printf("���Ҽ�[n] = ");
  scanf("%d", &*n);

  return 0;
}

float func(float x)
{
  float fx;

  /// �� �Լ��� ���� �������й��� ����� �����ϴµ� ����
  fx = x*x + 3 * x + 6;

  return fx;
}

int solution_out(int n, float a, float b, float s)
{
  printf("\n");
  printf("�������� \n \n");
  printf("���п��� \n \n");
  printf("���Ѱ�� : %f \n", a);
  printf("���Ѱ�� : %f \n", b);
  printf("���Ҽ� : %d \n \n", n);
  printf("*** �� *** \n");
  printf("s = %e \n", s);

  return 0;
}

int save(int n, float a, float b)
{
  FILE *fp;

  char fname[20];
  int i;
  float h;
  h = (b - a) / n;
  printf("����� ������ �� ���� \n");
  printf("������ ���� �̸��� �Է��ϼ��� \n");
  printf("�����̸� : ");
  scanf_s("%s", fname, 100);
  strcat(fname, ".dat");

  fopen_s(&fp, fname, "w");

  printf("[+] ������ ���� ��...");
  for (i = 0; i < 2000; i++)
  {
    fprintf(fp, "%f    %f    %f \n", i*h, function[i], jukbun[i]);
  }
  fclose(fp);
  printf("[*}�����͸� ���� �Ϸ��߽��ϴ�");

  return 0;
}

float simpson(int n, float a, float b, float *s)
{
  float f1, f2, f3, h, sw, x;
  h = (b - a) / n;
  x = a;
  *s = 0.0;

  do {
    f1 = func(x);
    f2 = func(x + h);
    f3 = func(x + 2.0 * h);
    sw = f1 + 4.0 * f2 + f3;
    *s += sw;
    x = x + 2.0 * h;
  } while (x < b);

  *s = *s * h / 3.0;
  return *s;
}
