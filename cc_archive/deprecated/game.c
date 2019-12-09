/*
  Name : game.c ver 1.0
  Content : ���� ���� �Լ� ����
  Implementation : LKB
  Last modified 2016/07/06
*/


#include <time.h>
#include "common.h"
#include "game.h"
#include "gameMoney.h"
#include "gameContinue.h"

int choiceOfCom()
{
  int rcp;
  srand((unsigned int)time(NULL));

  while(1)
  {
    //rcp�� 1,2,3 �� ������ �� �����̴�
    rcp = rand() %4;

    if(rcp != 0)
      break;
  }

  
  return rcp;
}



int choiceOfMe(int win,int lose,int draw,int moneyAmount)
{
  int myNum;
  int saveFlag = 0;

  while(1)
  {
    printf("\n����(1), ����(2), ��(3), ����(4) �� �ϳ��� �Է��ϼ���:  ");
    scanf("%d",&myNum);

    if(myNum == 1 || myNum ==2 || myNum==3)
      break;
    else if(myNum ==4)
    {
      printf("\n[*]������ �����մϴ�\n\n");

      puts("������ �����Ͻðڽ��ϱ�? < Yes : 1, No : 2 >: ");
      scanf("%d",&saveFlag);

      if(saveFlag == 1)
      {
        saveCurrentState(getCurrentComMoney(),getCurrentYouMoney(),win,lose,draw,moneyAmount);
      }
        exit(0);
    }
    else
      continue;
    /*
    switch(myNum)
    {        
      case scissors:
        break;
      case rock:
        break;
      case paper:
        break;
      case quit:
        printf("������ �����մϴ�\n");
        exit(0);
        }
    */
  }
  
  return myNum;
}


int whoIsWinner(int com, int you)
{

  
  
  if(com == 1 && you == 3 || com == 2 && you == 1 || com == 3 && you == 2)
  {
    printf("[-] ����! ����� �����ϴ�!\n");
    comWinMoneyAccount();
    return -1;
  }
  else if (com == 1 && you == 2 || com == 2 && you == 3 || com == 3 && you == 1)
  {
    printf("[+] ��.. ����� �̰���ϴ�!\n");
    youWinMoneyAccount();
    return 1;
  }
  else
  {
    printf("[0] ���� �����ϴ�!\n");
    return 0;
  }
}

/* end of line */
