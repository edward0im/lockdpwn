#include <stdio.h>


void main()
{
  int numOfchar;
  int ch;

  FILE *fp = fopen("character.txt","r");
  if(fp=NULL)
  {
    puts("I can't open this");
    return -1;
  }

  printf("what is the number of character you want to get? ");
  scanf("%d",&numOfchar);


  for(int i=0; i<numOfchar*2 ;i++)
  {
    ch = fgetc(fp);
    if(ch==EOF)
    {
      puts("���Ͽ� ���� �����߰ų� ������ �߻��߽��ϴ�");
      return -1;
    }

    fputc(ch,stdout);
    
  }

  fclose(fp);
  puts(" ");
  puts("����� �ȷ�ƽ��ϴ�");


  
}
