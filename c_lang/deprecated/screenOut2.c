/*
  Name :screenOut2.c ver 1.0
   Content : �ܼ� ����� ���� �Լ����� ����
   Implementation : LKB
   Last modified 2016/07/09
*/

#include "common.h"
#include "cusInfo.h"
#include "dvdInfo.h"
#include "dvdManager.h"
#include "dvdInfoAccess.h"

int firstFlag = 0;

void showMenu()
{
  if (firstFlag == 0 )
  {
    system("clear"); //stdlib.h
    firstFlag++;
  }
  printf("\n---------�޴�---------\n");
  printf("1. �ű԰���\n");
  printf("2. ���˻�\n");
  printf("\n-----------------------\n");
  printf("3. DVD ���\n");
  printf("4. DVD �˻�\n");
  printf("\n-----------------------\n");
  printf("5. DVD �뿩\n");
  printf("6. DVD �ݳ�\n");
  printf("\n-----------------------\n");
  printf("7. DVD �뿩�� ��ü ��ȸ\n");
  printf("8. �� �뿩 DVD ��ü ��ȸ\n");
  printf("9. ����\n");
  printf("-----------------------\n");
  printf("����>> ");
}

void showCustomerInfo(cusInfo *pCus)
{
  printf("\n**********************\n");
  printf("| >> ID : %s \n", pCus->ID);
  printf("| >> �̸� : %s \n", pCus->name);
  printf("| >> ��ȭ��ȣ : %s \n", pCus->phoneNum);
  printf("**********************\n\n"); 
}

void showDvdInfo(dvdInfo *pDvd)
{
  printf("\n**********************\n");
  printf("| >> ISBN : %s \n", pDvd->ISBN);
  printf("| >> ���� : %s \n", pDvd->title);
  printf("| >> �帣 : "); showGenre(pDvd->genre); printf("\n");
  printf("**********************\n\n");
}

void showGenre(int gen)
{
  switch(gen)
  {
    case ACTION:
      fputs("�׼�",stdout);
      break;
      case COMIC:
      fputs("�ڹ�",stdout);
      break;
      case SF:
      fputs("SF",stdout);
      break;

    case ROMANTIC:
      fputs("�θ�ƽ",stdout);
      break;
  }
}

void showCustomerInfoContinue(cusInfo *pCus)
{
  printf("\n**********************\n");
  printf("| >> ID : %s \n", pCus->ID);
  printf("| >> �̸� : %s \n", pCus->name);
  printf("| >> ��ȭ��ȣ : %s \n", pCus->phoneNum); 
  printf("**********************\n\n"); 
}

/* end of file */
