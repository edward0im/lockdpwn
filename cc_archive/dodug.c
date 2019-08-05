#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <Windows.h>
#include <conio.h>

#define Green SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), 10)  
#define White SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), 7)
#define Yellow SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), 14)
#define Red SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), 4)

int totalscore[2]={0};        //score �Լ��� ���� ��������

void countdown(void);
void intro_design(void);
void design(void);
int level(int userchoice1);
void gotoxy(int x, int y);
void movement(int random, int random_2, int random_3, int random_4,int  random_5, int x, int y, int userchoice1);
int score(int eye_random, int user[]);
int random_duplication_remove(int random, int random_2, int random_3,int random_4,int random_5);

int  Input_KeyState (int user[]);
void eye_1( int user[], int eye_random);

#define line2doduge +5   //2��° ���� �δ��� y�� 
#define line3doduge +10 // 3��° ���� �δ��� y��
#define getch _getch

int main()
{
  int userchoice1=0, restart;       //userchoice1 = ������ ������ ���̵� ���� ���� ����
  int random, random_2=0, random_3=0, random_4=0, random_5=0;     //���� ���� ���� ����.
  //���� if�������� ���� random_2,_3�� �ʱ�ȭ�� ����.
  double past;
  time_t start, end;

  srand((unsigned)time(0));

  intro_design();
  system("cls");
  design();
A:    //////////////////////////////////goto A

  gotoxy(26,9);
  printf("���̵� = �ƺ� �� �ص� �ſ�?(3)\n");
  gotoxy(26,10);
  printf("���̵� = �ѹ� ��� ����?(6)\n");
  gotoxy(26,11);
  printf("���̵� = ��ģ�� �ƴϾ�?(9)\n");
  gotoxy(26,12);
  scanf_s("%d", &userchoice1);
  gotoxy(26,11);
  printf("                                   ");
  gotoxy(26,9);
  printf("                                   ");

  level(userchoice1);     //���̵� �Լ�
  design();
  countdown();
  start = time(NULL);

  do
  {
    end = time(NULL);
    past = difftime(end, start);

    //�δ��� �Ӹ����� �ð��� ���� �÷���. �ִ� 5��
    random = rand()% userchoice1 +1;
    if(past>=8)
      random_2 = rand()% userchoice1 +1;
    if(past>=18)
      random_3 = rand()% userchoice1 +1;
    if(past>=28 && userchoice1 >= 6)
      random_4 = rand()% userchoice1 +1;
    if(past>=38 && userchoice1 == 9)
      random_5 =rand()% userchoice1 +1;

    random_duplication_remove( random, random_2, random_3,random_4,random_5);
    // x �� = 10, y �� = 10
    movement(random, random_2, random_3, random_4, random_5, 10, 10, userchoice1);

    //55�� �̻��̵Ǹ� Ÿ�̸� ���� �ʷϻ�����
    if(past>=55)
    {
      Green;
    }

    gotoxy(27,4);
    //"."���� ���� ���,  60���� -1�� ����
    printf("%.lf��",60 - past);
    White;
    gotoxy(34,4);
    //���ھ� ���� ���
    printf("%d", totalscore[0]);
    //60�ʱ���
  }while(past <5);

  White;

  system("cls");
  totalscore[1] += totalscore[0];
  gotoxy(27,7);
  printf("���� = %d\n", totalscore[1]);

  gotoxy(20,10);
  printf("�ٽ� �Ͻðڽ��ϱ�?(���͸� �����ּ���.)\n");
  gotoxy(20,11);
  printf("����� ���̳ʽ� ���� �Է����ּ���.\n");
  gotoxy(27,12);
  scanf_s("%d", &restart);
  system("cls");
  //�������� totalscore �ʱ�ȭ
  totalscore[0] = 0;

  if(restart >= 1)
    //���� �̵�.
    goto A;
  else
    return 0;
}

void movement(int random, int random_2, int random_3, int random_4,int  random_5, int x, int y, int userchoice1)
{
  int user[9]={0};
  int doduge_1 = 17, doduge_2 = 27, doduge_3 = 37;
  int eye_random=0;

  Yellow;

  gotoxy(x + doduge_1, y-1 );
  printf(" ___ ");
  gotoxy(x-1 + doduge_1, y );
  printf("(     ) ");

  gotoxy(x + doduge_2, y-1 );
  printf(" ___ ");
  gotoxy(x-1 + doduge_2, y );
  printf("(     ) ");

  gotoxy(x + doduge_3, y-1 );
  printf(" ___ ");
  gotoxy(x-1 + doduge_3, y );
  printf("(     ) ");

  gotoxy(x + doduge_1, y line2doduge -1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_1, y line2doduge  );
  printf("(     ) ");

  gotoxy(x + doduge_2, y line2doduge-1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_2, y line2doduge  );
  printf("(     ) ");

  gotoxy(x + doduge_3, y line2doduge-1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_3, y line2doduge  );
  printf("(     ) ");

  gotoxy(x + doduge_1, y line3doduge-1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_1, y line3doduge );
  printf("(     ) ");

  gotoxy(x + doduge_2, y line3doduge-1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_2, y line3doduge );
  printf("(     ) ");

  gotoxy(x + doduge_3, y line3doduge-1);
  printf(" ___ ");
  gotoxy(x-1 + doduge_3, y line3doduge );
  printf("(     ) ");

  ///////////////////////////////////////////////////////////         " ___ "
  Sleep(100);

  if(random == 1 || random_2 == 1 || random_3 == 1 || random_4==1 || random_5 == 1){
    gotoxy(x + doduge_1, y -1);
    printf(" ___ ");}

  if(random == 2|| random_2 == 2 || random_3 == 2 || random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y -1);
    printf(" ___ ");}

  if(random == 3|| random_2 == 3 || random_3 == 3 || random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y-1 );
    printf(" ___ ");}

  if(random == 4 || random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge -1);
    printf(" ___ ");}

  if(random == 5 || random_2 == 5 || random_3 == 5 || random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge -1);
    printf(" ___ ");}

  if(random == 6 || random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge -1);
    printf(" ___ ");}

  if(random == 7 || random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge -1);
    printf(" ___ ");}

  if(random == 8 || random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge -1);
    printf(" ___ ");}

  if(random == 9 || random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge -1);
    printf(" ___ ");}
  ////////////////////////////////////////////////////////////////y-1 ,���κп�  " ___ "



  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y)
        ;
    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge);

    printf("|");
    printf("0 0");
    printf("|");}

  if(random == 9 || random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge);

    printf("|");
    printf("0 0");
    printf("|");}
  //  ___
  Sleep(100);///////////////////////////////////////////// "|0  0|"     0 0 �� eye_1 �Լ��� ���� X X�� �� �� ����.


  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y - 2);
    printf(" ___ ");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y - 2);
    printf(" ___ ");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y - 2);
    printf(" ___ ");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge -2);
    printf(" ___ ");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge -2);
    printf(" ___ ");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge -2);
    printf(" ___ ");}

  if(random == 7 || random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge -2);
    printf(" ___ ");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge -2);
    printf(" ___ ");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge -2);
    printf(" ___ ");}



  Input_KeyState (user);                                                    //�����е� ���� �Է¹���

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y - 1);

    printf("|");

    eye_random = 1;
    eye_1(user, eye_random);


    printf("|");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y - 1);

    printf("|");

    eye_random = 2;
    eye_1(user, eye_random);


    printf("|");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y - 1);

    printf("|");

    eye_random = 3;
    eye_1(user, eye_random);


    printf("|");}

  if(random == 4|| random_2 == 4|| random_3 == 4|| random_4==4 || random_5 == 4 ){
    gotoxy(x + doduge_1, y line2doduge - 1);

    printf("|");

    eye_random = 4;
    eye_1(user, eye_random);


    printf("|");}

  if(random ==  5|| random_2 == 5 || random_3 ==5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge - 1);

    printf("|");

    eye_random = 5;
    eye_1(user, eye_random);


    printf("|");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6)
  {
    gotoxy(x + doduge_3, y line2doduge - 1);

    printf("|");

    eye_random = 6;
    eye_1(user, eye_random);

    printf("|");
  }

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7)
  {
    gotoxy(x + doduge_1, y line3doduge - 1);

    printf("|");

    eye_random = 7;
    eye_1(user, eye_random);

    printf("|");
  }

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8)
  {
    gotoxy(x + doduge_2, y line3doduge - 1);

    printf("|");

    eye_random = 8;
    eye_1(user, eye_random);

    printf("|");
  }

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9)
  {
    gotoxy(x + doduge_3, y line3doduge - 1);

    printf("|");

    eye_random = 9;
    eye_1(user, eye_random);

    printf("|");
  }

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y);
    printf("|   |");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y);
    printf("|   |");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y);
    printf("|   |");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge);
    printf("|   |");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge);
    printf("|   |");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge);
    printf("|   |");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge );
    printf("|   |");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge );
    printf("|   |");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9 ){
    gotoxy(x + doduge_3, y line3doduge );
    printf("|   |");}
  //   ___
  Sleep(500); ////////////////////////////////////////  |0  0|
  ///  |     |
  Input_KeyState (user);                          //�����е� ���� �Է¹���

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y - 2);
    printf("      ");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y - 2);
    printf("      ");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y - 2);
    printf("      ");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4|| random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge- 2);
    printf("      ");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge- 2);
    printf("      ");}

  if(random == 6|| random_2 == 6|| random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge- 2);
    printf("      ");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge- 2);
    printf("      ");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge- 2);
    printf("      ");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge- 2);
    printf("      ");}

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y - 1);
    printf(" ___ ");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y - 1);
    printf(" ___ ");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y - 1);
    printf(" ___ ");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge- 1);
    printf(" ___ ");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge- 1);
    printf(" ___ ");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge- 1);
    printf(" ___ ");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge- 1);
    printf(" ___ ");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge- 1);
    printf(" ___ ");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge- 1);
    printf(" ___ ");}

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y);

    printf("|");
    eye_random = 1;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y);

    printf("|");
    eye_random = 2;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y);

    printf("|");
    eye_random = 3;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge);

    printf("|");
    eye_random = 4;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge);

    printf("|");
    eye_random = 5;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge);

    printf("|");
    eye_random = 6;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge);

    printf("|");
    eye_random = 7;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge);

    printf("|");
    eye_random = 8;
    eye_1(user, eye_random);

    printf("|");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge);

    printf("|");
    eye_random = 9;
    eye_1(user, eye_random);

    printf("|");}

  Sleep(100);

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y - 1);
    printf("      ");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y - 1);
    printf("      ");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y - 1);
    printf("      ");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge- 1);
    printf("      ");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge- 1);
    printf("      ");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge- 1);
    printf("      ");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7|| random_5 == 1){
    gotoxy(x + doduge_1, y line3doduge- 1);
    printf("      ");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge- 1);
    printf("      ");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge- 1);
    printf("      ");}

  if(random == 1|| random_2 == 1 || random_3 == 1|| random_4==1 || random_5 == 1){
    gotoxy(x+ doduge_1, y);

    printf("      ");}

  if(random == 2|| random_2 == 2 || random_3 == 2|| random_4==2 || random_5 == 2){
    gotoxy(x + doduge_2, y);

    printf("      ");}

  if(random == 3|| random_2 == 3 || random_3 == 3|| random_4==3 || random_5 == 3){
    gotoxy(x + doduge_3, y);
    printf("      ");}

  if(random == 4|| random_2 == 4 || random_3 == 4|| random_4==4 || random_5 == 4){
    gotoxy(x + doduge_1, y line2doduge);

    printf("      ");}

  if(random == 5|| random_2 == 5 || random_3 == 5|| random_4==5 || random_5 == 5){
    gotoxy(x + doduge_2, y line2doduge);

    printf("      ");}

  if(random == 6|| random_2 == 6 || random_3 == 6|| random_4==6 || random_5 == 6){
    gotoxy(x + doduge_3, y line2doduge);

    printf("      ");}

  if(random == 7|| random_2 == 7 || random_3 == 7|| random_4==7 || random_5 == 7){
    gotoxy(x + doduge_1, y line3doduge);

    printf("      ");}

  if(random == 8|| random_2 == 8 || random_3 == 8|| random_4==8 || random_5 == 8){
    gotoxy(x + doduge_2, y line3doduge);

    printf("      ");}

  if(random == 9|| random_2 == 9 || random_3 == 9|| random_4==9 || random_5 == 9){
    gotoxy(x + doduge_3, y line3doduge);

    printf("      ");}
}

void gotoxy(int x, int y)
{
  COORD Pos = { x - 1, y - 1 };
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), Pos);
}

int  Input_KeyState (int user[])
{
  if (GetAsyncKeyState( VK_NUMPAD7 )&0x8001) //�����е� 7���� ������
    // ������ ���� ���� �ְ� ȣ�� �������� �����ִ� ����
    user[0]=1;
	
  if(GetAsyncKeyState( VK_NUMPAD8  )&0x8001)
    user[1]=2;
	
  if(GetAsyncKeyState( VK_NUMPAD9 )&0x8001)
    user[2]=3;
	
  if(GetAsyncKeyState( VK_NUMPAD4 )&0x8001)
    user[3]=4;

  if(GetAsyncKeyState( VK_NUMPAD5 )&0x8001)
    user[4]=5;
	
  if(GetAsyncKeyState( VK_NUMPAD6 )&0x8001)
    user[5]=6;
	
  if(GetAsyncKeyState( VK_NUMPAD1 )&0x8001)
    user[6]=7;
	
  if(GetAsyncKeyState( VK_NUMPAD2 )&0x8001)
    user[7]=8;

  if(GetAsyncKeyState( VK_NUMPAD3 )&0x8001)
    user[8]=9;

  return user[0], user[1], user[2], user[3], user[4], user[5], user[6], user[7], user[8];
}

void eye_1(int user[],int eye_random)
{
  Red;
  if (eye_random == user[0])
    printf("X X");
  else if (eye_random == user[1])
    printf("X X");
  else if (eye_random == user[2])
    printf("X X");
  else if (eye_random == user[3])
    printf("X X");
  else if (eye_random == user[4])
    printf("X X");
  else if (eye_random == user[5])
    printf("X X");
  else if (eye_random == user[6])
    printf("X X");
  else if (eye_random == user[7])
    printf("X X");
  else if (eye_random == user[8])
    printf("X X");
  else {
    White;
    printf("0 0");}
  White;

  score(eye_random ,user);
}

int score(int eye_random, int user[])
{
  int i=0;

  if (eye_random == user[0])
    totalscore[0] += 100;
  else if (eye_random == user[1])
    totalscore[0] += 100;
  else if (eye_random == user[2])
    totalscore[0] += 100;
  else if (eye_random == user[3])
    totalscore[0] += 100;
  else if (eye_random == user[4])
    totalscore[0] += 100;
  else if (eye_random == user[5])
    totalscore[0] += 100;
  else if (eye_random == user[6])
    totalscore[0] += 100;
  else if (eye_random == user[7])
    totalscore[0] += 100;
  else if (eye_random == user[8])
    totalscore[0] += 100;

  return totalscore[0];  //�δ��� ���κ� "|" �� ��ġ�� �ٲ�Ƿ� ����� �ٸ� ������
}

int level(int userchoice1)
{
  switch(userchoice1)
  {
    case 6:                //6�� �Է¹��� �� userchoice = 6.
      gotoxy(23,10);
      printf("���̵��� �������� �����Ǿ����ϴ�.");
      Sleep(1000);
      userchoice1=6;
      break;

    case 9:                //9�� �Է¹��� �� userchoice = 9.
      gotoxy(23,10);
      printf("���̵��� ��������� �����Ǿ����ϴ�.");
      Sleep(1000);
      userchoice1=9;
      break;

    default:             //�ٸ� ���϶� 6�� �Է¹���.
      gotoxy(23,10);
      printf("���̵��� �������� �����Ǿ����ϴ�.");
      Sleep(1000);
      userchoice1=3;
      break;
  }

  system("cls");
  return userchoice1;
}

void intro_design(void)
{
  design();

  Sleep(1000);

  Yellow;
  gotoxy(32, 10);
  printf("�δ��� ���� ~!");

  Red;
  gotoxy(39, 10);
  printf("��\a");
  Sleep(200);
  gotoxy(39, 10);
  printf("   ");

  gotoxy(41, 10);
  printf("��\a");
  Sleep(200);
  gotoxy(42, 10);
  printf("   ");

  Yellow;
  gotoxy(32, 10);
  printf("�δ��� ���� ~!!!");

  gotoxy(26, 14);
  printf("�����Ϸ��� �ƹ�Ű�� ��������.");

  White;
  gotoxy(32, 18);
  printf("������1 : ������");
  gotoxy(32, 19);
  printf("������2 : �ڻ�");
  getch();
}

void design(void)
{
  int i;

  for (i = 1; i <= 25; i++)
  {
    gotoxy(14, i);
    printf("��");
  }
  for (i = 1; i <= 25; i++)
  {
    gotoxy(64, i);
    printf("��");
  }
}

void countdown(void)
{
  //////////////////////////�ʹ� ���� ī��Ʈ�ٿ�.
  Sleep(1000);
  gotoxy(40,8);
  printf("3");
  Sleep(1000);
  gotoxy(40,8);
  printf("2");
  Sleep(1000);
  gotoxy(40,8);
  printf("1");
  Sleep(1000);
  gotoxy(38,8);
  Red;
  printf("����!");
  Sleep(500);
  gotoxy(38,8);
  printf("        ");

  White;
}

int random_duplication_remove(int random, int random_2, int random_3,int random_4,int random_5)
{
  if(random == random_2)                        //���� ���� �ߺ��� ���� ���� �����.
    random = 0;

  if(random == random_3)
    random = 0;

  if(random_2 == random_3)
    random_2= 0;

  if(random == random_4)
    random = 0;

  if(random == random_5)
    random = 0;

  if(random_2 == random_4)
    random = 0;

  if(random_2 == random_5)
    random = 0;

  if(random_3 == random_4)
    random = 0;

  if(random_3 == random_5)
    random = 0;

  if(random_4 == random_5)
    random_4 = 0;

  return random, random_2, random_3,random_4,random_5;
}
