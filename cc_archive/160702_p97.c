#include <stdio.h>

int DivInt(int *a,int *b,int *c,int *d);


void main()
{
  int num1,num2,num3=0,num4=0;
  int c,d;
  
  printf("�������� ���� �� ������ �Է��ϼ���: ");
  scanf("%d %d",&num1,&num2);

  if(DivInt(&num1,&num2,&num3,&num4) == 1)
  {
    printf("�� : %d , ������ : %d",num3,num4);
  }

  else if(DivInt(&num1,&num2,&num3,&num4) == -256)
  {
    printf("0���� ���� �� �����ϴ�\n");
    exit(0);
  }
  else
  {
    
  }

  
}



int DivInt(int *a,int *b,int *c,int *d)
{
  if(*a != 0 || *b !=0)
  {
    return 1;
  }

  else
  {
    return -256;
  }

  
}
