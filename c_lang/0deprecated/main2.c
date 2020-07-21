/*
  Name : main2.c ver 1.0
  Content : main function
  Implementation : LKB
  Last modified 2016/07/07
*/
#include "common.h"
#include "game.h"
#include "gameTimes.h"
#include "gameMoney.h"
#include "gameContinue.h"

int main()
{
  int com;
  int you;
  int win =0 ,lose =0 ,draw =0 ;
  int state[4] ={0};
  int initMoneyAmount = 1000;
  int moneyAmount = 200;
  int loadFlag =0;
  int flag =0;

  system("clear");
  puts("��! ������ �����մϴ�\n");

  printf("�̾ �Ͻðڽ��ϱ�? < Yes : 1, No : 2 >: ");
  scanf("%d",&loadFlag);

  FILE *fp = fopen("game.dat","r");

  // �ε��ϰ� ������ ���
  if(loadFlag == 1 && fp != NULL)
  {
    state[4] = loadSavedFile();

    win=state[0] ;
    lose =state[1];
    draw = state[2];
    moneyAmount = state[3];

    printf("[*] ����� �ܾ� : [%d��], ��ǻ���� �ܾ� : [%d��]\n",getCurrentYouMoney(),getCurrentComMoney());
  }

  // initMoneyAmount;
  // �ε� ���ϰ� �ٷ� ������ ���
  else
  {
    while(1)
    {
      printf("�⺻ ���ӸӴ� �ݾ��� �����ϼ���(default: 1000, Min: 100, max: 10000): ");
      scanf("%d",&initMoneyAmount);

      if(initMoneyAmount >= 100 || initMoneyAmount <= 10000)
      {
        break;
      }
      else
        continue;
    }
    setComMoney(initMoneyAmount);
    setYouMoney(initMoneyAmount);

    while(1)
    {
      printf("�ǵ��� ũ�⸦ �����ּ���(default: 200, Min: 100, max: 5000): ");
      scanf("%d",&moneyAmount);

      if(initMoneyAmount < moneyAmount)
        continue;
    
      if(moneyAmount >= 100 || moneyAmount<= 5000)
      {
        break;
      }
      else
        continue;
    }
  
    setGamblingTableMoney(moneyAmount);
  }
  //int moneyCom = 1000, moneyMine = 1000;
  //int win=0,lose=0,draw=0;

  while(1)
  {
    puts("ooooooooo���!ooooooooo\n");
    com = choiceOfCom();
    you = choiceOfMe(win,lose,draw,moneyAmount);
    puts("");

    if(you == 1)
      printf("����� ������ [����]\n");
    else if(you ==2)
      printf("����� ������ [����]\n");
    else if (you ==3)
      printf("����� ������ [��]\n");

    
    if(com == 1)
      printf("��ǻ���� ������ [����]\n");
    else if(com ==2)
      printf("��ǻ���� ������ [����]\n");
    else if (com ==3)
      printf("��ǻ���� ������ [��]\n");

    puts("\nxxxxxxxxx���!xxxxxxxxx\n");
    flag = whoIsWinner(com,you);

    if(flag ==1)
    {
      win++;
    }
    else if(flag == -1)
    {
      lose++;
    }
    else if(flag == 0)
    {
      draw++;
    }

    printf("[*] �·��� %d\%\�Դϴ�.\n",calcPercent(win,lose));
    printf("[*] Count: win:[%d] lose:[%d] draw:[%d}\n",win,lose,draw);
    printf("[*] Game Money\nMe : [%d��], Com : [%d��]\n",getCurrentYouMoney(),getCurrentComMoney());

    if(getCurrentComMoney() <= 0 || getCurrentYouMoney()<=0)
    {
      break;
    }
    
    /* 
       if(moneyMine == 0)
       {
       printf("\n[-] �Ʊ����� ����..\n");
       break;
       }
       else if(moneyCom ==0)
       {
       printf("\n[+] �¸��ϼ̽��ϴ�! �����մϴ�\n");
       break;
       }
    */
    puts("");
  }
  return 0;
}


