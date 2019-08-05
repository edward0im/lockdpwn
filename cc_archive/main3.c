/*
  Name : main3.c ver 1.0
  Content : main function
  Implementation : LKB
  Last modified 2016/07/07
*/

#include "common.h"
#include "cusManager.h"
#include "screenOut2.h"

enum{CUS_REGIST=1, CUS_SEARCH, DVD_REGIST, DVD_SEARCH,DVD_RENT,DVD_RETURN, DVD_RENT_PRINT,CUS_RENT_PRINT ,QUIT};

void main()
{
  int inputMenu = 0;

  while(1)
  {
    showMenu();
    scanf("%d",&inputMenu);
    fflush(stdin);

    if(inputMenu >10)
    {
      printf("����� �� ���ڸ� �Է����ּ���!\n");
      break;
    }

    switch(inputMenu)
    {
      case CUS_REGIST:
        registCustomer();
        break;

      case CUS_SEARCH:
        searchCusInfo();
        break;

      case DVD_REGIST:
        registDvd();
        break;

      case DVD_SEARCH:
        searchDvdInfo();
        break;

      case DVD_RENT:
        rentDvd();
        break;
        
      case DVD_RETURN:
        returnDvd();
        break;
        
      case DVD_RENT_PRINT:
        showDVDRentAllCusInfo();
        break;

      case CUS_RENT_PRINT:
        showDVDRentAllCusInfo();
        break;

      case QUIT:
        puts("�̿����ּż� �����Ե�!");
        exit(0);
    }   
  }
}

/* end of file */
