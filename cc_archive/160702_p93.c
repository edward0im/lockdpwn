#include <stdio.h>

int factorial(int num);

void main()
{
  int a=0;
  int result = 0;

  printf("�ڿ����� �Է��ϼ���: ");
  scanf("%d",&a);


  result = factorial(a);

  if(result == 0)
  {
    printf("�ڿ����� �ƴ� ���� �Է��߽��ϴ�\n");
    exit(0);
}

  
  printf("%d!�� %d �Դϴ�.\n",a,result);

  
}



int factorial(int num)
{
  int sum = 1;

  if(num <= 0)
    return 0;
  
  for(int i=1; i<=num;i++)
  {
    sum = sum*i;
  }

  return sum;

}
