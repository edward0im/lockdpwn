#include <stdio.h>


void main()
{
  int a,b;
  int max=0;
  int min=0;
  int sum = 0;
  
  printf("���� 2���� �Է��ϼ���: ");
  scanf("%d %d%",&a,&b);


  max = (a>b)? a:b;
  min = (a>b)? b:a;
 
  for(min;min<=max;min++)
  {
    if((min%3) == 0)
    {
      printf("3�� ��� %d�� ����\n",min);
      continue;
    }
    if((min%5)==0)
    {
      printf("5�� ��� %d�� ����\n",min);
      continue;
    }

    sum = sum + min;
    
  }

  printf("�� ���� %d\n",sum);






  
}
