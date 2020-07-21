#include <stdio.h>
#include <string.h>

#define STR_LEN 50
#define BOOK_INFO_NUM 3


typedef struct __bookInfo
{
  char bookTitle[STR_LEN];
  char bookPub[STR_LEN];
  int bookPrice;
} bookInfo;


int numOfData = 0;
bookInfo bookInfoList[BOOK_INFO_NUM];

/* p164 �پ��� ���ı��� �߰� */
enum{SORT_TITLE=1, SORT_PUB, SORT_PRICE, EXIT};
bookInfo * bookSortList[BOOK_INFO_NUM];


int InsertList(bookInfo *bookPtr);

/* p164 �پ��� ���ı��� �߰� */
void InitSortList();
void PrintSortList();

void SortByTitle();
void SortByPubName();
void SortByPrice();


void main()
{
  int i,num;
  bookInfo book;

  for(i=0; i < BOOK_INFO_NUM ; i++)
  { 
    printf("****************************\n");
    printf("%d��° �������� �Է�\n",i+1);

    printf("���� ���� : ");
    gets(book.bookTitle);
    
    printf("���ǻ� �� : ");
    gets(book.bookPub);

    printf("���� ���� : ");
    scanf("%d",&book.bookPrice);

    num = InsertList(&book); // ���ο� �Լ�... ���� ������ �������� �������� �Ф�

    if(num==-1)
    {
      printf("�Է��� �����߽��ϴ� \n");
    }
    else
    {
      printf("%d��° �Է� �Ϸ�\n\n",i+1);
    }
    
    
  }
  
  puts("***************** ���� ���� ��� ***************");
  for(i=0; i<BOOK_INFO_NUM;i++)
  {
    printf("%d��° ���� ���� ��� \n",i+1);
    printf("���� ���� : %s\n",bookInfoList[i].bookTitle);
    printf("���ǻ� �� : %s\n",bookInfoList[i].bookPrice);
  }
  
}


int InsertList(bookInfo *bookPtr)
{
  int idx;
  int inputIdx = numOfData;

  if(numOfData >= BOOK_INFO_NUM)
    return -1;

  /* �Է� ��ġ ã�� */
  for(idx=0; idx< numOfData; idx++)
  {
    if(strcmp(bookInfoList[idx].bookTitle,bookPtr->bookTitle)>0)
    {
      inputIdx = idx;
      break;
    }
  }

  /* �Է��� �����ϵ��� �ڸ��� �����Ѵ� */
  for(idx=numOfData; idx>inputIdx; idx--)
  {
    bookInfoList[idx] = bookInfoList[idx-1];
  }

  /* ���ο� �����͸� �Է��Ѵ� */
  bookInfoList[inputIdx] = (*bookPtr);


  return ++numOfData;

  
}
