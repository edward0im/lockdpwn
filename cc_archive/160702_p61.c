#include <stdio.h>


void main()
{
  int flag = 0;
  
  printf("1 �Ǵ� 2�� �Է��ϼ���:");

  while(flag == 0){

    scanf("%d",&flag);

    if(flag != 0)
      break;
    else
      printf("���ڸ� ����� �Է��ϼ���");
  }


  // ������ �˰���
  
  if(flag == 1)
  {
    for(int i=3; i<10; i=i+2)
    {
      for(int j=1; j<10;j++)
      {
        printf("%d * %d = %d\n",i,j,i*j);
      }
    }
  }

  if(flag == 2)
  {
    for(int i=2; i<10; i=i+2)
    {
      for(int j=1; j<10;j++)
      {
        printf("%d * %d = %d\n",i,j,i*j);
      }
    }
  }

  


  
}
