#include <stdio.h>
#include <string.h>


#define MAX_STRING 100


void main()
{
  int day, day_f;
  char strRegion[MAX_STRING], strRegion_f[MAX_STRING];
  int ap = 0, ap_f;

  char strWeather_f[MAX_STRING];

  FILE *fp = fopen("weather.dat","r");

  fputs("�˻��� ��¥ �� ���� ���� �Է� : ",stdout);
  fscanf(stdin,"%d %s %c",&day, strRegion,&ap);

  sprintf(strRegion,"%s\n",strRegion);

  while(1)
  {
    fread(&day_f, sizeof(int),1,fp);
    
    if(feof(fp)!=0)
      break;

    fgets(strRegion_f, MAX_STRING,fp);
    ap_f = fgetc(fp);
    fgets(strWeather_f, MAX_STRING,fp);


    if(day == day_f && !strcmp(strRegion,strRegion_f) && ap == ap_f)
    {
      fprintf(stdout, "��¥: %d\n", day_f);
      fprintf(stdout, "����: %s\n", strRegion_f);
      fprintf(stdout, "����/����: %c\n", ap_f);
      fprintf(stdout, "����: %s\n", strWeather_f);
      fclose(fp);
      puts("�˻��� �Ϸ�Ǿ����ϴ�\n");
      exit(0);
    }

    fclose(fp);
    puts("�ش� ��¥ �� �����Ͱ� �������� �ʽ��ϴ�");
    exit(0);
  }
    
  
}
