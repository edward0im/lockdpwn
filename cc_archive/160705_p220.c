#include <stdio.h>

#define MAX_STRING 100
void main()
{
  char *str[5];
  
  int i;

  FILE *fp = fopen("character.txt","w");

  if(fp==NULL)
  {
    puts("������ ������ �ʾҽ��ϴ�");
    return -1;
  }

  for(i=0; i<5 ; i++)
  {
    printf("%d��° ���ڿ��� �Է��ϼ��� : ",i+1);
    fgets(&str[i],MAX_STRING,stdin);
    fputs(&str[i],fp);
  }

  fclose(fp);
  puts("�Է��� �Ϸ�Ǿ����ϴ�");
  
}
