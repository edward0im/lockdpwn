/*
  Name :rentInfoAccess.c ver 1.1
   Content : ��ȭ DVD �뿩 ���� ����/���� �Լ����� ���� 
   Implementation : LKB
   Last modified 2016/07/10
*/
#include "common.h"
#include "rentInfo.h"
#include "cusInfo.h"
#include "cusInfoAccess.h"
#include "screenOut2.h"

#define RENT_LEN 100

static dvdRentInfo rentList[RENT_LEN];
static int numOfRentCus = 0;

void addRentList(char *ISBN, char *cusID ,int rentDay)
{
  strcpy(rentList[numOfRentCus].cusID, cusID);
  rentList[rentCusNum].rentDay = rentDay;

  numOfRentCus++;
}

void printOutRentAllCusInfo(char *ISBN)
{
  
  if(strcmp(rentList[numOfRentCus].ISBN,ISBN) != 0)
  {
    puts("�������� �ʴ� ISBN�Դϴ�.");
    return;
  }

  for(int i =0 ; i< numOfRentCus ; i++)
  {
    printf("�뿩�� : %d\n",rentList[numOfRentCus].rentDay);
    ptrCusInfo = getCusPtrById(rentList[numOfRentCus].cusID);
    showCustomerInfoContinue(ptrCusInfo);
  }
   puts("[*] ��ȸ�� �Ϸ��߽��ϴ�");
}

void printOutCusAllRentInfo(char *ID, unsigned in start, unsigned int end)
{
  
}
/* end of file */
