#include <stdio.h>
#include <string.h>

#define MAX_LEN 5


void main()
{
  int studentScore[MAX_LEN] = {0};
  int count = 0;
  int tmp= 0 ;

  
  printf("�й��� ������ ���������� �����ϴ� ���α׷��Դϴ�.\n");

  
  while(1)
  {
    printf("�й��� ������ ���ʷ� �Է����ּ��� [%d] [����: ctrl + D] : ",count+1);
    scanf("%d",&studentScore[count]);

    
    if (count == 4)
      break;

    count++;
  }

  
  for(int i = 0 ; i < count ; i++)
  {
    for(int j =0; j < count ; j++)
    {
      if(studentScore[j] > studentScore[j+1])
      {
        tmp = studentScore[j];
        studentScore[j] = studentScore[j+1];
        studentScore[j+1] = tmp;
      }
    }
  }


  printf("������������ ���ĵ� ������ ������ �����ϴ�\n");
  
  for(int i = 0;  i <= count ; i++)
  {
    printf("�й� : [%d], ���� : [%d]\n",i+1,studentScore[i]);
  }
  
}


