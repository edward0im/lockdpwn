#include <stdio.h>

#define MAX_STRING 100

void printString(int num,FILE *fp);
void printAllString(FILE *fp);

void main()
{
  int num;


  FILE *fp = fopen("character.txt","rb");

  if(fp==NULL)
  {
    puts("������ ������ �ʽ��ϴ�");
    return -1;
  }

  printf("����� ���ڿ� ������ �Է��ϼ��� (6 �̻��� ��ü ���): ");
  scanf("%d",&num);

  if(num <= 5)
  {
    printString(num,fp);
  }
  else if (num > 5)
  {
    printAllString(fp);
  }



  fclose(fp);
  puts("����� �Ϸ�Ǿ����ϴ�");


  
}

void printString(int num, FILE *fp)
{
 
  char str[MAX_STRING];

  for(int i=0; i<num-1;i++)
  {
    fgets(str,MAX_STRING-1,fp);
  }

  fgets(str,MAX_STRING-1,fp);
  fputs(str,stdout);

  
}
void printAllString(FILE *fp)
{
  char str[MAX_STRING];

  while(1)
  {
    fgets(str,MAX_STRING-1,fp);

    if(feof(fp) !=0)
      break;

    fputs(str,stdout);
  }
}
