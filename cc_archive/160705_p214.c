#include <stdio.h>


void main()
{
  int num;
  
  
  FILE *fp = fopen("numeric.dat","w");

  if(fp ==NULL)
  {
    puts("������ �� �� �����ϴ�");
    return -1;
  }

  for(int i=0; i<5;i++)
  {
    printf("���Ͽ� ������ ���� %d ",i+1);
    scanf("%d",&num);
    fprintf(fp,"%d",num);

    
  }

  
  fclose(fp);
  puts("�Է��� �Ϸ�Ǿ����ϴ�");




  
}
