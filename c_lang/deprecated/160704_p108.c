#include <stdio.h>

#define LEN 100

int searchArr(char* arr, char c);


void main()
{
  char string[LEN] = {0};
  char ch;
  int count = 0;

  
  printf("��� ���ڿ��� �Է��ϼ���: ");
  gets(string);

  // ���⸦ ���� �� ���ٴ� ����.. Ū
  //scanf("%s",string);

  printf("���� �� ���ڸ� �Է��ϼ���: ");
  ch = getchar();


  count = searchArr(string,ch);

  printf("%c�� ������ : %d\n",ch,count);

}



int searchArr(char* arr, char c)
{
  int count = 0;

  for(int i=0;i<LEN;i++)
  {
    if(arr[i] == c)
    {
      count++;
    }
    
  }

  return count;
}
