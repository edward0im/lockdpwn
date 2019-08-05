/*
  Name : main.c ver 1.0
  Content : main function
  Implementation : LKB
  Last modified 2016/07/06
*/
#include "common.h"
#include "screenOut.h"
#include "phoneFunc.h"

enum{INPUT=1, SHOWALL, SEARCH, DELETE ,CHANGE ,QUIT};

int main()
{
  int inputMenu = 0;

  loadDataFromFile();

  while(1)
  {
    ShowMenu();
    scanf("%d",&inputMenu);
    fflush(stdin);

    if(inputMenu >10)
    {
      printf("����� �� ���ڸ� �Է����ּ���!\n");
      break;
    }

    switch(inputMenu)
    {
      case INPUT:
        InputPhoneData();
        break;

      case SHOWALL:
        ShowAllData();
        break;

      case SEARCH:
        SearchPhoneData();
        break;
        
      case DELETE:
        DeletePhoneData();
        break;
        
      case CHANGE:
        changePhoneData();
        break;
    }

    if(inputMenu == QUIT)
    {
      storeDataToFile();
      puts("�̿��� �ּż� ����~\n");
      break;
    }
  }

  return 0;
}
/* end of file */
