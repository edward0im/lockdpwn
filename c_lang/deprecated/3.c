#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#define MAX_LEN 100
#define DIC_LEN 5

void main()
{
  char engWords[MAX_LEN][MAX_LEN] = {"sex", "orgasm", "kiss", "technic", "felachio"};
  char hanWords[MAX_LEN][MAX_LEN] = {"����","��������","Ű��","��ũ��","���ġ��"};

  char word[MAX_LEN] = {0};
 
  printf("��/�� �����Դϴ�.\n");

  
  while(1)
  {
    
    printf("���ϴ� �ܾ �Է����ּ���: ");
    scanf("%s",word);

    


    for(int i =0; i< DIC_LEN ; i++)
    {
      if(strcmp(word,engWords[i]) == 0)
      {
        printf("%s�� �ѱ� ���� �ܾ�� [%s]�Դϴ�\n",engWords[i],hanWords[i]);
        continue;
      }
      else if(strcmp(word,hanWords[i]) == 0)
      {
        printf("%s�� ���� ���� �ܾ�� [%s]�Դϴ�\n",hanWords[i],engWords[i]);
        continue;
      }
      
    }
    

    
  }
  
  
  
}
