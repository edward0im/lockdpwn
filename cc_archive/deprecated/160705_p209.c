#include <stdio.h>


void main()
{
  char c[] = {"�����ٶ󸶹ٻ������īŸ����"};
  
  int i;

  FILE *fp = fopen("character.txt","w");

  if(fp==NULL)
  {
    puts("������ ������ �ʾҽ��ϴ�");
    return -1;
  }

  for(i=0; i<sizeof(c)-1 ; i++)
  {
    fputc(c[i],fp);
  }

  fclose(fp);
  puts("�Է��� �ȷ�Ǿ����ϴ�");

  

  
}
