#include <stdio.h>

int main()
{
  int n1,n2;
  int add;

  fputs("�� ���� 16������ �Է� : ", stdout);
  scanf("%x %x",&n1,&n2);
  add = n1+n2;


  printf("���� ��� 8����, 10����, 16���� : %o %d %x\n",add,add,add);
  
  return 0;
  
  
}



