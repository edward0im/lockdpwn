#include <stdio.h>
#include <string.h>


#define MAX_STRING 100
void main()
{
  int date;
  char location[MAX_STRING];
  char apm;
  char weather[MAX_STRING];
  int ret;

  FILE *fp = fopen("weather.dat","w");

  while(1)
  {
    fputs("** ���� ���� �Է� *****\n",stdout);

    fputs("��¥ : ",stdout);
    ret = scanf("%d",&date);
    fflush(stdin);
    if(ret == EOF)
      break;

    fprintf(fp,"%d",date);

    fputs("���� : ",stdout);
    scanf("%s",location);
    fputs("\n",fp);
    fputs(location,fp);

    
    printf("����/ ���� : ");
    
    fputc(apm,fp);
    fflush(stdin);

    fputs("���� : ",stdout);
    gets(weather);
    fputs("\n",fp);
    fputs(weather,fp);

    fputs("\n",stdout);
  }

  fclose(fp);
  fputs("�Է��� �Ϸ�ƽ��ϴ�\n",stdout);
  

    /* 
    printf("��¥�� �Է��ϼ��� : ");
    scanf("%d",&date);
    fprintf(fp,"%d",date);

    printf("������ �Է��ϼ��� : ");
    fgets(&location,MAX_STRING,stdin);
    fputs(&location,fp);

    printf("���� or ���ĸ� �Է��ϼ��� : ");
    scanf("%c",&apm);
    fputc(apm,fp);

    printf("������ �Է��ϼ��� : ");
    fgets(&weather,MAX_STRING,stdin);

    if(weather == EOF)
    {
      puts("���α׷��� �����մϴ�\n");
      exit(0);
    }
    else
    {
      fputs(&weather,fp);
    }
    */
  
}
