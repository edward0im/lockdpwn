/*
  c �ڵ����� ==> x^2 + 3*x + 6 �Լ��� �������й����� ����, �̺��ϴ� ���� �ڵ�
*/
#include "stdafx.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

#define MAX_NUM 5000

int data_in(int *n, float *a, float *b);
float chabun(int n, float a, float b, float *s, float *y);
int solution_out(int n, float a, float b, float s,float y);
float func(float x);
int save(int n, float a, float b);

float mibun[MAX_NUM];
float jukbun[MAX_NUM];
float function[MAX_NUM];

int main()
{
  int n;
  float a, b, s, y;

  while (1)
  {
    data_in(&n, &a, &b);
    chabun(n, a, b, &s, &y);
    solution_out(n, a, b, s, y);
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


float chabun(int n, float a, float b, float *s, float *y)
{
  float f1, f2, h, x;
  int i = 0;
  h = (b - a) / n;
  x = a;
  f1 = 0;
  f2 = 0;

  *y = 0.0;
  *s = 0.0;
  mibun[0] = 0;
  jukbun[0] = 0;
  function[0] = 0;

  /// �̺� �����ϰ�
  do{
    f1 = func(x);
    *y = (f1 - f2) / h;
    x = x + h;
    f2 = f1;
    mibun[i] = *y;
    function[i] = f1;
    i++;
  } while (x < b);


  h = (b - a) / n;
  x = a;
  f1 = 0;
  f2 = 0;
  /// ������ �����Ѵ�
  for (i = 0; i < MAX_NUM; i++)
  {
    f1 = func(x);
    *s = *s + f1 * h + (f1 - f2)*h / 2;
    x = x + h;
    f2 = f1;
    jukbun[i] = *s;
    function[i] = f1;
  }

  return *s;
}

int solution_out(int n, float a, float b, float s, float y)
{
  printf("\n");
  printf("�������й� \n \n");
  printf("����[�̺�]���� \n \n");
  printf("���Ѱ�� : %f \n", a);
  printf("���Ѱ�� : %f \n", b);
  printf("���Ҽ� : %d \n \n", n);
  printf("*** �� *** \n");
  printf("���� s = %e \n", s);
  printf("�̺� y = %e \n", y);

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
