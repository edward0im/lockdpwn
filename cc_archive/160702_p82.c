#include <stdio.h>
#include <string.h>

#define LEN 100

void main()
{
  char str[5][LEN] = {0};
  char tmp[LEN] = {0};
  
  printf("���ڿ� 5���� �Է��ϼ���: ");


  // ���ڸ� �Է¹ް� ���ڿ��� ���̸� ���Ѵ�
  for(int i=0; i<5; i++)
  {
    scanf("%s",str[i]);

    //len[i] = strlen(str[i]);
    // �� �ڵ�� �ʿ����
  }

  // ���̸� ���ؼ� ���� ��ġ�� �ٲ۴�
  for(int k=0; k<4;k++)
  {
    for(int j=0; j<4;j++)
    {
      if(strlen(str[j])>strlen(str[j+1]))
      {
        strcpy(tmp,str[j]);
        strcpy(str[j],str[j+1]);
        strcpy(str[j+1],tmp);
      }
    }
  }

  // ����� ����Ѵ�
  printf("�����:");
  for(int w=0;w<5;w++)
  {
    printf("%s %d\n",str[w],w);
  }
}
