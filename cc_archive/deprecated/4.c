#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LEN 100


// ����ü�� �����մϴ�
typedef struct student
{
  char name[MAX_LEN];
  int mathScore;
  int koreanScore;
  int englishScore;
  int totalScore;
  double meanScore;
} STUDENT;


enum{NAME=1, SCOREHIGH, SCORELOW, QUIT};

STUDENT student[MAX_LEN];
STUDENT tmp;

// �л����� ������ ���ϴ� �Լ�
void getStudentScore(int num);

// ������ ���ϴ� �Լ�
void getTotalScore(int num);

// ����� ���ϴ� �Լ�
void getMeanScore(int num);

// �����ϴ� �Լ���
void sortStudentByScoreHigh(int num);
void sortStudentByScoreLow(int num);
void sortStudentByScoreName(int num);



void main()
{
  int maxNum;
  int selection = 0;
  char a[MAX_LEN];
  
  // �ʱ�ȭ���� ����ϴ�
  system("clear");

  
  
  printf("�� ���� �ִ� �л����� ���ϼ���: ");
  scanf("%d",&maxNum);

  printf("%lf,%d",maxNum,maxNum);

  
  // �ڵ� �߰�
  if(maxNum == 0)
  {
    puts("�߸��� �Է��Դϴ�. ���α׷��� �����մϴ�...");
    exit(0);
  }

  printf("\n[%d]���� �л� ������ �Է��ϼ���\n",maxNum);

  // �л� ������ �Է��ϰ� ����, ����� ���մϴ�

  for(int i = 0 ; i< maxNum ; i++)
  {
    getStudentScore(i);
    getTotalScore(i);
    getMeanScore(i);

    printf("\n");
  }

  // �Էµ� ������ ���� �� ����մϴ�
  while(1)
  {
    printf("\n1. �̸������� ���\n2. ����(��������)���� ���\n3. ������(��������)���� ���\n4. ���α׷� ����\n");
    printf("� ������ ����Ͻðڽ��ϱ�?: ");
    scanf("%d",&selection);
  
    if(selection > 0 && selection < 5)
    {
      switch(selection)
      {
        case NAME:
          sortStudentByScoreName(maxNum);
          continue;
          
        case SCOREHIGH:
          sortStudentByScoreHigh(maxNum);
          continue;
          
        case SCORELOW:
          sortStudentByScoreLow(maxNum);
          continue;
          
        case QUIT:
          printf("[-] ���α׷��� �����մϴ�...\n");
          exit(0);
      }
    }
    else
      continue;
    
  }
  
  
}

// �л����� ������ ���ϴ� �Լ�
void getStudentScore(int num)
{
  printf("�̸� : ");
  scanf("%s",student[num].name);

  printf("���� : ");
  scanf("%d",&student[num].koreanScore);
  
  printf("���� : ");
  scanf("%d",&student[num].englishScore);
  
  printf("���� : ");
  scanf("%d",&student[num].mathScore);
  
}


// ������ ���ϴ� �Լ�
void getTotalScore(int num)
{
  student[num].totalScore = student[num].englishScore + student[num].koreanScore + student[num].mathScore;
}


// ����� ���ϴ� �Լ�
void getMeanScore(int num)
{
  student[num].meanScore = student[num].totalScore / 3;
}




// ������������ ����
void sortStudentByScoreHigh(int num)
{
  
  
  for(int i = 0; i< num-1 ; i++)
  {
    for(int j = 0; j < num-1 ; j++)
    {
      if(student[j].totalScore > student[j+1].totalScore)
      {
        tmp = student[j];
        student[j] = student[j+1];
        student[j+1] = tmp;
      }
    }
  }

  printf("\n<����ǥ>\n");
  printf("�̸�      ����    ����    ����    ����    ���\n");
  
  for(int i = 0; i <num;i++)
  {
    printf("%s       %d       %d       %d       %d      %.1lf\n",student[i].name, student[i].koreanScore, student[i].englishScore, student[i].mathScore, student[i].totalScore, student[i].meanScore);
  }
  
}

// ������������ ����
void sortStudentByScoreLow(int num)
{

  
  for(int i = 0; i< num-1 ; i++)
  {
    for(int j = 0; j < num-1 ; j++)
    {
      if(student[j].totalScore < student[j+1].totalScore)
      {
        tmp = student[j];
        student[j] = student[j+1];
        student[j+1] = tmp;
      }
    }
  }

  printf("\n<����ǥ>\n");
  printf("�̸�      ����    ����    ����    ����    ���\n");
  
  for(int i = 0; i <num;i++)
  {
    printf("%s       %d       %d       %d       %d      %.1lf\n",student[i].name, student[i].koreanScore, student[i].englishScore, student[i].mathScore, student[i].totalScore, student[i].meanScore);
  }
  
}

// �̸� ������ ����
void sortStudentByScoreName(int num)
{
 
  
  for(int i = 0; i< num-1 ; i++)
  {
    for(int j = 0; j < num-1; j++)
    {
      if(strcmp(student[j].name,student[j+1].name) > 0)
      {
        tmp = student[j];
        student[j] = student[j+1];
        student[j+1] = tmp;
      }
    }
  }

  printf("\n<����ǥ>\n");
  printf("�̸�      ����    ����    ����    ����    ���\n");
  
  for(int i = 0; i <num;i++)
  {
    printf("%s       %d       %d       %d       %d      %.1lf\n",student[i].name, student[i].koreanScore, student[i].englishScore, student[i].mathScore, student[i].totalScore, student[i].meanScore);
  }
  
}
