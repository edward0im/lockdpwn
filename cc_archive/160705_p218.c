#include <stdio.h>



int main()
{
  int num;


  FILE *fp = fopen("numeric.dat","rb");

  if(fp==NULL)
  {
    puts("������ ������ �ʽ��ϴ�");
    return -1;
  }

  for(int i=0; i<5; i++)
  {
    fread(&num,sizeof(int),1,fp);
    printf("%d ��° �Էµ� ���� : %d \n",i+1,num);
  }

  fclose(fp);
  puts("����� �Ϸ�Ǿ����ϴ�");


  
}
