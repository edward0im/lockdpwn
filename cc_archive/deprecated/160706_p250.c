#include <stdio.h>
#include <string.h>

#define MAX_STRING 100

void main()
{
  char str[MAX_STRING];
  char strPrint[MAX_STRING];
  int i =0;



  printf("-------------���ڿ� �Է�---------------\n");
  FILE *fp = fopen("test.txt","w");


  printf("ù ��° ���ڿ� : ");
  fgets(str,MAX_STRING,stdin);
  fwrite(&str,sizeof(char),strlen(str),fp);
  fflush(stdin);
  
  printf("�� ��° ���ڿ� : ");
  fgets(str,MAX_STRING,stdin);
  fwrite(&str,sizeof(char),strlen(str),fp);
  fflush(stdin);

  fclose(fp);
  
  printf("--------------����� ���ڿ� ���---------------\n");

  fp = fopen("test.txt","r");
  
  printf("ù ��° ���ڿ� ��� : ");
  while(1)
  {
    fread(strPrint+i,sizeof(char),1,fp);

    if(strPrint[i] =='\n')
    {
      strPrint[i+1] = 0;
      break;
    }

    i++;
    
  }
  printf("%s\n",strPrint);

  
  printf("�� ��° ���ڿ� ��� : ");
  i=0;
  while(1)
  {
    fread(strPrint+i,sizeof(char),1,fp);

    if(strPrint[i] =='\n')
    {
      strPrint[i+1] = 0;
      break;
    }

    i++;
    
  }
  printf("%s\n",strPrint);



  fclose(fp);
}
