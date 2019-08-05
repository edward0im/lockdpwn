/*
  Name : screenOut.c ver 1.1
  Content : �ܼ� ����� ���� �Լ� ����
  Implementation : LKB
  Last modified 2016/07/06
*/
#include "common.h"
#include "phoneData.h"

int firstFlag = 0;

void ShowMenu()
{
  if (firstFlag == 0 )
  {
    system("clear"); //stdlib.h
    firstFlag++;
  }
  
  printf("\n---------�޴�---------\n");
  printf("1. ��ȭ��ȣ �Է�\n");
  printf("2. ��ü ���� ���\n");
  printf("3. ��ȣ��ȣ �˻�\n");
  printf("4. ��ȭ��ȣ ����\n");
  printf("5. ��ȭ��ȣ ����\n");
  printf("6. ����\n");
  printf("-----------------------\n");
  printf("����>> ");
}

void ShowPhoneInfo(phoneData phone)
{
  printf("\n**********************\n");
  printf("| >> �̸� : %s \n",phone.name);
  printf("| >> ��ȭ��ȣ : %s \n",phone.phoneNum);
  printf("**********************\n\n");
}

void ShowPhoneInfoByPtr(phoneData * pPhone)
{
  printf("\n**********************\n");
  printf("| >> �̸� : %s \n",pPhone->name);
  printf("| >> ��ȭ��ȣ : %s \n",pPhone->phoneNum);
  printf("**********************\n\n");
}
/* end of file  */
