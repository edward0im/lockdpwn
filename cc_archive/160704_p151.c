#include <stdio.h>

#define STR_LEN 50
#define BOOK_INFO_NUM 3

typedef struct __bookInfo
{
  char bookTitle[STR_LEN];
  char bookPub[STR_LEN];
  int bookPrice;
} bookInfo;

bookInfo bookInfoList[BOOK_INFO_NUM];

void main()
{
  int i;

  for(i=0; i<BOOK_INFO_NUM ; i++)
  { 
    printf("****************************\n");
    printf("%d��° �������� �Է�\n",i+1);

    // �ֱ׷��� �𸣰ڴµ� �ι�° �������� ������ ����
    printf("���� ���� : ");
    gets(bookInfoList[i].bookTitle);
    
    printf("���ǻ� �� : ");
    gets(bookInfoList[i].bookPub);

    printf("���� ���� : ");
    scanf("%d",&bookInfoList[i].bookPrice);

    
    //fflush(stdin);  // �̰� �� �ִ°���..?
     
    printf("%d��° �Է� �Ϸ�\n",i+1);

  }

  puts("***************** ���� ���� ��� ***************");
  for(i=0; i<BOOK_INFO_NUM;i++)
  {
    printf("%d��° ���� ���� ��� \n",(i+1));
    printf("���� ���� : %s\n",bookInfoList[i].bookTitle);
    printf("���ǻ� �� : %s\n",bookInfoList[i].bookPub);
    printf("���� ���� : %d\n",bookInfoList[i].bookPrice);
  }
  
}
