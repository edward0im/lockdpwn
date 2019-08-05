/*
  Name :dvdManager.c ver 1.0
   Content : DVD ���� ���� ó�� �Լ����� ����
   Implementation : LKB
   Last modified 2016/07/09
*/


#include "common.h"
#include "screenOut2.h"
#include "dvdInfo.h"
#include "dvdInfoAccess.h"

// DVD �뿩�� �߰��� ����
#include "cusInfoAccess.h"
#include "rentInfo.h"


void registDvd()
{
  
  char tmpISBN[ISBN_LEN];
  char tmpTitle[TITLE_LEN];
  int tmpGenre;
  

  while(1)
  {
    printf("ISBN �Է�: ");
    scanf("%s",tmpISBN);
    printf("���� �Է�: ");

    // scanf�� ������� �Է��Ϸ��� �Ʒ� �� ���� �ʿ��ϴ�
    getchar();
    scanf("%[^\n]s",tmpTitle);

    
    printf("�帣 �Է� <�׼� 1, �ڹ� 2, SF 3, �θ�ƽ 4>: ");
    scanf("%d",&tmpGenre);

    if((strlen(tmpISBN) < ISBN_LEN && (strlen(tmpTitle)) < TITLE_LEN))
    {   
      if(!isRegistISBN(tmpISBN))
      {
        break;
      }
      else if(isRegistISBN(tmpISBN))
      {
        printf("[-] �ش� ISBN�� ��� ���Դϴ�. �ٸ� ISBN�� �������ּ���\n");
      }
      
    }
    
    else
    {
      continue;
    }
  
  }

  addDvdInfo(tmpISBN,tmpTitle,tmpGenre);
  printf("[+] DVD ����� �Ϸ�ƽ��ϴ�\n");
    
}


void searchDvdInfo()
{
  char searchISBN[ISBN_LEN];
  dvdInfo *dvdPtr;

  
  printf("ã�� ISBN �Է�: ");
  scanf("%s",searchISBN);
  
  dvdPtr = getDvdPtrByISBN(searchISBN);

  if(dvdPtr == 0)
  {
    puts("�������� �ʴ� ISBN �Դϴ�");
    return;
  }


  showDvdInfo(dvdPtr);
}

void rentDvd()
{
  char tmpISBN[ISBN_LEN];
  int registDvd;
  int registCus;
  int rentSte;

  char tmpId[ID_LEN];
  unsigned int tmpDay;

  
  printf("[*] �뿩 DVD ISBN �Է�: ");
  scanf("%s",tmpISBN);

  registDvd  = isRegistISBN(tmpISBN);
  
  if(registDvd == 0)
  {
    printf("�ش� DVD�� �������� �ʽ��ϴ�");
    return;
  }

  rentSte = getDVDRentState(tmpISBN);

  if(rentSte = RENTED)
  {
    puts("[-] �뿩 ���̶� �뿩�� �Ұ����մϴ�.");
    return;
  }

  printf("[*] �뿩�� �����մϴ�. �뿩 ������ �����մϴ�.\n");
  printf("�뿩 �� ID �Է�: ");
  scanf("%s",tmpId);

  registCus = isRegistId(tmpId);

  if(registCus == 0)
  {
    puts("���� ���� �ƴմϴ�");
    return;
  }

  fputs("�뿩 ��¥�� �Է��ϼ���: ",stdout);
  scanf("%u",&tmpDay);

  fflush(stdin);

  setDVDRented(tmpISBN,tmpId,tmpDay);
  puts("[+] �뿩�� �Ϸ�ƽ��ϴ�");
  
  
      
  /* 
  for(int i =0; i < numOfDvd ; i++)
  {
    if(strcmp(tmpISBN,dvdList[i]) == 0 && dvdList[i].rentState == RETURNED)
    {
      printf("[*] �뿩�� �����մϴ�. �뿩 ������ �����մϴ�.\n");
      printf("�뿩 �� ID �Է�: ");
      scanf("%s",tmpId);

      for(int j =0 ; j< numOfCustomer ; j++)
      {
        if(isRegistId(tmpId) != 0)
        {
          strcpy(dvdList[i].rentList[numOfRent++].cusID,tmpId);
          
          printf("�뿩 ��¥ �Է�: ");
          scanf("%d",&tmpDay);

          dvdList[i].rentList[numOfRent++].rentDay = tmpDay;
          dvdList[i].rentState = RENTED;
          dvdList[i].numOfRentCus++;

          printf("[+] �뿩�� �Ϸ�ƽ��ϴ�");
          return;
        }
        else
        {
          printf("[-] ID�� ã�� �� �����ϴ�");
          return;
        }
      }
    }
    else
    {
      printf("[-] ã�� DVD�� �����ϴ�");
    }
  }
 
  return;
 */ 
}


void returnDvd()
{
  char tmpISBN[ISBN_LEN];
  int registDvd;
  int rentSte;

  
  printf("�ݳ� DVD ISBN �Է�: ");
  scanf("%s",tmpISBN);


  registDvd = isRegistISBN(tmpISBN);

  if(registDvd == 0)
  {
    printf("�ش� DVD�� �������� �ʽ��ϴ�");
    return;
  }

  rentSte = getDVDRentState(tmpISBN);

  if(rentSte == RETURNED)
  {
    puts("�뿩���� ���� DVD�Դϴ�.");
    return;
  }

  setDVDReturned(tmpISBN);
  puts("[+] �ݳ��� �Ϸ�ƽ��ϴ�");

  
  /*  
  for(int i =0 ; i< numOfDvd ; i++)
  {
    if(strcmp(tmpISBN, dvdList[i]) == 0 && dvdList[i].rentState == RENTED)
    {
      
      dvdList[i].rentState = RETURNED;
      printf("[+]�ݳ��� �Ϸ�ƽ��ϴ�");
      return;
    }
    else
    {
      printf("�ش� DVD�� �뿩 ���� �ƴϰų� �������� �ʽ��ϴ�");
      return;
    }
    
  }

  return;
*/
}

void showDVDRentAllCusInfo()
{
  char tmpISBN[ISBN_LEN];
  
  printf("ã�� ISBN �Է�: ");
  getchar();
  scanf("%[^\n]s",tmpISBN);


  printOutRentAllCusInfo(tmpISBN);

  puts("[*] ��ȸ�� �Ϸ��߽��ϴ�");
  
}

/* end of file */
