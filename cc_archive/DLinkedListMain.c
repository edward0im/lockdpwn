#include <stdio.h>
#include "DLinkedList.h"

int whoIsPrecede(int d1, int d2)
{
  if(d1<d2)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

void main(int argc, char *argv[])
{
  List list;
  int data;
  
  ListInit(&list);

  setSortRule(&list,whoIsPrecede);

  LInsert(&list,11); LInsert(&list,11);
  LInsert(&list,22); LInsert(&list,22);
  LInsert(&list,33);
  LInsert(&list,11); LInsert(&list,11);
  LInsert(&list,44); LInsert(&list,22);
  LInsert(&list,33);
  LInsert(&list,55); LInsert(&list,11);
  LInsert(&list,22); LInsert(&list,22);
  LInsert(&list,77);
  LInsert(&list,66); LInsert(&list,11);
  LInsert(&list,66); LInsert(&list,22);
  LInsert(&list,33);

  printf("���� �������� ��: %d\n",LCount(&list));

  if(LFirst(&list,&data))
  {
    printf("%d ",data);

    while(LNext(&list,&data))
    {
      printf("%d ",data);
    }
  }
  printf("\n\n");

  // ���� 22�� �˻��Ͽ� ��� �����Ѵ�
  if(LFirst(&list,&data))
  {
    if(data == 22)
    {
      LRemove(&list);
    }
    while(LNext(&list,&data))
    {
      if(data == 22)
      {
        LRemove(&list);
      }
    }
  }

  // ���� �� �����ִ� ������ ��ü�� ����Ѵ�
  printf("���� �������� ��: %d\n",LCount(&list));

  if(LFirst(&list,&data))
  {
    printf("%d ",data);

    while(LNext(&list,&data))
    {
      printf("%d ",data);
    }
  }
  printf("\n\n");
}
