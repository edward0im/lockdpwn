/*
  Name :cusManager.c ver 1.0
   Content : �� ���� ���� ó�� �Լ����� ����
   Implementation : LKB
   Last modified 2016/07/09
*/
#include "common.h"
#include "cusInfo.h"
#include "cusInfoAccess.h"
#include "screenOut2.h"

void registCustomer()
{
  char tmpId[ID_LEN];
  char tmpName[NAME_LEN];
  char tmpPhone[PHONE_LEN];

  while(1)
  {
    printf("ID �Է�: ");
    scanf("%s",tmpId);

    if(isRegistId(tmpId))
    {
      printf("[-] �ش� ID�� ��� ���Դϴ�. �ٸ� ID�� �������ּ���\n");
      continue;
    }
    
    printf("�̸� �Է�: ");
    scanf("%s",tmpName);
    printf("��ȭ��ȣ �Է�: ");
    scanf("%s",tmpPhone);

    if((strlen(tmpId)) < ID_LEN && (strlen(tmpName)) < NAME_LEN && (strlen(tmpPhone)) < PHONE_LEN)
    {
      break;
    }
    else
    {
      continue;
    }
  }
  
  addCusInfo(tmpId,tmpName,tmpPhone);
  printf("[+] ������ �Ϸ�ƽ��ϴ�\n");
}

void searchCusInfo()
{
  char searchId[ID_LEN];
  cusInfo *cusPtr;

  printf("ã�� ID �Է�: ");
  scanf("%s",searchId);
  
  cusPtr = getCusPtrById(searchId);

  if(cusPtr == 0)
  {
    puts("�������� �ʴ� ������Դϴ�");
    return;
  }

  showCustomerInfo(cusPtr);
}


/* end of file */
