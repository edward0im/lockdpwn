#include "stdafx.h"
#include <conio.h>
#include <Windows.h>
#include "point.h"
#include "blockStageControl.h"

#define KEY_SENSITIVE 100
#define SYS_DELAY 20

#define LEFT 75
#define RIGHT 77
#define UP 72
#define DOWN 80
#define SPACE 32  // �����̽��� ó���� ���� ��ũ��


static int keyDelayRate;



// �����Ÿ��� Ŀ���� �����Ѵ� 
void removeCursor()
{
  CONSOLE_CURSOR_INFO curInfo;

  GetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &curInfo);
  curInfo.bVisible = 0;

  SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &curInfo);
}

// ���� Ŀ���� ��ġ������ ���� ����ü ������ ��ȯ�Ѵ�
POINT_EDWARD getCurrentCursorPos()
{
  POINT_EDWARD curPoint;
  CONSOLE_SCREEN_BUFFER_INFO curInfo;

  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &curInfo);

  curPoint.x = curInfo.dwCursorPosition.X;
  curPoint.y = curInfo.dwCursorPosition.Y;

  return curPoint;

}

// Ŀ���� ��ġ�� �����Ѵ�
void setCurrentCursorPos(int x, int y)
{
  COORD pos = { x, y };
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos);

}

// Ű �Է� ó�� �Լ�
// �ٽ�!
int insertUserKeyInput()
{
  int key;

  for (int i = 0; i < KEY_SENSITIVE; i++)
  {
    if (_kbhit() != 0)
    {
      key = _getch();

      switch(key)
      {
        case LEFT:
          shiftLeft();
          break;
        case RIGHT:
          shiftRight();
          break;
        case UP:
          rotateBlock();
          break;
        case SPACE:
          solidCurrentBlock();
          return 1;					// �����̽��ٰ� �Էµ� �� �˸��� ����
      }
    }
    if (i % keyDelayRate == 0)
    {
      Sleep(SYS_DELAY);
    }
  }

  return 0;
}


// ���� �ӵ��� ������Ű�� �Լ�
void keyDelaySpeedCtl(int addSpeed)
{
  keyDelayRate += addSpeed;
}


void initKeyDelayRate(int rate)
{
  if (rate < 1)
  {
    return;
  }

  keyDelayRate = rate;
}


/* end of file */
