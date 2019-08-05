/*
  Name : blockStageControl.cpp ver 1.0
  Content :
  Implementation : LKB

  Last modified 2016/07/12
*/

#include "stdafx.h"
#include "point.h"
#include "blockInfo.h"
#include "keyCurControl.h"
#include "scoreLevelControl.h"
#include <time.h>
#include <Windows.h>

#define GBOARD_WIDTH 10
#define GBOARD_HEIGHT 20

#define GBOARD_ORIGIN_X 4
#define GBOARD_ORIGIN_Y 2


static int gameBoardInfo[GBOARD_HEIGHT + 1][GBOARD_WIDTH + 2] = { 0, };

static int currentBlockModel;
static int curPosX, curPosY;
static int rotateSte;


void initNewBlockPos(int x, int y)
{
  if (x < 0 || y < 0)
    return;

  curPosX = x;
  curPosY = y;

  setCurrentCursorPos(x, y);
}


void chooseBlock()
{
  srand((unsigned int)time(NULL));

  currentBlockModel = (rand() % NUM_OF_BLOCK_MODEL) * 4;

}



// ���� ����ؾ��ϴ� ����� index ������ ��ȯ�Ѵ�
int getCurrentBlockIdx()
{
  return currentBlockModel + rotateSte;
}



void showBlock(char blockInfo[][4])
{
  int y, x;

  POINT_EDWARD curPos = getCurrentCursorPos();

  for (y = 0; y < 4; y++)
  {
    for (x = 0; x < 4; x++)
    {
      setCurrentCursorPos(curPos.x + (x * 2), curPos.y + y);

      if (blockInfo[y][x] == 1)
        printf("��");
    }
  }

  setCurrentCursorPos(curPos.x, curPos.y); // Ŀ�� ��ġ ������� �Ѵ�
}



void deleteBlock(char blockInfo[][4])
{
  POINT_EDWARD curPos = getCurrentCursorPos();

  for (int y = 0; y < 4; y++)
  {
    for (int x = 0; x < 4; x++)
    {
      setCurrentCursorPos(curPos.x + (x * 2), curPos.y + y);

      if (blockInfo[y][x] == 1)
        printf("  "); // ���� �� ĭ
    }
  }

  setCurrentCursorPos(curPos.x, curPos.y);
}

// gameBoardInfo�� ���� ������ �߰��ϴ� �Լ�
void addCurrentBlockInfoToBoard()
{
  int x, y;

  int arrCurX;
  int arrCurY;

  for (y = 0; y < 4; y++)
  {
    for (x = 0; x < 4; x++)
    {
      arrCurX = (curPosX - GBOARD_ORIGIN_X) / 2;
      arrCurY = curPosY - GBOARD_ORIGIN_Y;

      if (blockModel[getCurrentBlockIdx()][y][x] == 1)
      {
        gameBoardInfo[arrCurY + y][arrCurX + x] = 1;
      }
    }
  }

}



// �����ǿ� ������ ����� �׸���
void drawSolidBlocks()
{
  int x, y;
  int cursX, cursY;

  for (y = 0; y < GBOARD_HEIGHT; y++)
  {
    for (x = 1; x < GBOARD_WIDTH + 1; x++)
    {
      cursX = x * 2 + GBOARD_ORIGIN_X;
      cursY = y + GBOARD_ORIGIN_Y;

      setCurrentCursorPos(cursX, cursY);

      if (gameBoardInfo[y][x] == 1)
        printf("��");
      else
        printf("  ");
    }
  }
}



// �� ������ ä���� ����� �����ϴ� �Լ�
void removeFilledUpLine()
{
  int x, y;
  int line;


  for (y = GBOARD_HEIGHT - 1; y > 0; y--)
  {
    for (x = 1; x < GBOARD_WIDTH + 1; x++)
    {
      if (gameBoardInfo[y][x] != 1)
        break;
    }

    if (x == (GBOARD_WIDTH + 1))
    {
      for (line = 0; y - line > 0; line++)
      {
        memcpy(
            &gameBoardInfo[y - line][1],
            &gameBoardInfo[(y - line) - 1][1],
            GBOARD_WIDTH * sizeof(int)
               );
      }

      y++;	// �迭 ������ �Ʒ��� �� ĭ�� �̵������Ƿ� �������� ���󺹱���Ų��.
      addGameScore(10);
      showCurrentScoreAndLevel();
    }
  }

  drawSolidBlocks();

}





// ����� �浹�� �����ϴ� �Լ�
int detectCollision(int posX, int posY, char blockModel[][4])
{

  /* gameBoardInfo �迭�� ��ǥ�� ���� */
  int arrX = (posX - GBOARD_ORIGIN_X) / 2;
  int arrY = posY - GBOARD_ORIGIN_Y;

  for (int x = 0; x < 4; x++)
  {
    for (int y = 0; y < 4; y++)
    {
      if (blockModel[y][x] == 1 && gameBoardInfo[arrY + y][arrX + x] == 1)
        return 0;
    }
  }

  return 1;
}



// ����� �ϰ��Ѵ�
// �浹�˻� �˰��� �߰� �� �� ������ ����ȴ� 
int blockDown()
{
  // �ٷ� �Ʒ��ִ� ĭ�ϰ� �ε�����
  if (!detectCollision(curPosX, curPosY + 1, blockModel[getCurrentBlockIdx()]))
  {
    addCurrentBlockInfoToBoard();
    removeFilledUpLine();
    return 0;
  }

  deleteBlock(blockModel[getCurrentBlockIdx()]);
  curPosY += 1;


  setCurrentCursorPos(curPosX, curPosY);
  showBlock(blockModel[getCurrentBlockIdx()]);
  return 1;

}




// �������� �̵��Ѵ�
void shiftLeft()
{
  // �浹���� �߰� �ڵ�
  if (!detectCollision(curPosX -2, curPosY, blockModel[getCurrentBlockIdx()]))
    return;

  deleteBlock(blockModel[getCurrentBlockIdx()]);

  curPosX -= 2;

  setCurrentCursorPos(curPosX, curPosY);
  showBlock(blockModel[getCurrentBlockIdx()]);

}

// ���������� �̵��Ѵ�
void shiftRight()
{
  // �浹���� �߰� �ڵ�
  if (!detectCollision(curPosX+2, curPosY, blockModel[getCurrentBlockIdx()]))
    return;

  deleteBlock(blockModel[getCurrentBlockIdx()]);

  curPosX += 2;

  setCurrentCursorPos(curPosX, curPosY);
  showBlock(blockModel[getCurrentBlockIdx()]);

}

// ����� 90�� ȸ����Ų��
void rotateBlock()
{
  int nextRotSte;
  int beforeRotSte = rotateSte;

  deleteBlock(blockModel[getCurrentBlockIdx()]);

  nextRotSte = rotateSte + 1;
  nextRotSte %= 4;
  rotateSte = nextRotSte;

  // �浹���� �߰� �ڵ�
  if (!detectCollision(curPosX, curPosY, blockModel[getCurrentBlockIdx()]))
  {
    rotateSte = beforeRotSte;
    return;
  }


  setCurrentCursorPos(curPosX, curPosY);
  showBlock(blockModel[getCurrentBlockIdx()]);
	
}

void drawGameBoard()
{
  int x, y;


  /* �ð����� �κ� ó�� */
  for (y = 0; y <= GBOARD_HEIGHT; y++)
  {
    setCurrentCursorPos(GBOARD_ORIGIN_X, GBOARD_ORIGIN_Y + y);


    if (y == GBOARD_HEIGHT)
      printf("��");
    else
      printf("��");

  }


  for (y = 0; y <= GBOARD_HEIGHT; y++)
  {
    setCurrentCursorPos(
        GBOARD_ORIGIN_X + (GBOARD_WIDTH + 1) * 2,
        GBOARD_ORIGIN_Y + y);

    if (y == GBOARD_HEIGHT)
      printf("��");
    else
      printf("��");


  }

  for (x = 1; x < GBOARD_WIDTH + 1; x++)
  {
    setCurrentCursorPos(
        GBOARD_ORIGIN_X + x * 2, GBOARD_ORIGIN_Y + GBOARD_HEIGHT);

    printf("��");

  }
  setCurrentCursorPos(0, 0);


  /* ������ �κ� ó�� */
  for (int y = 0; y < GBOARD_HEIGHT; y++)
  {
    gameBoardInfo[y][0] = 1;
    gameBoardInfo[y][GBOARD_WIDTH + 1] = 1;
  }

  for (int x = 0; x < GBOARD_WIDTH + 2; x++)
  {
    gameBoardInfo[GBOARD_HEIGHT][x] = 1;
  }


}




// ���� ���� �Լ�
int isGameOver()
{
  // ó�� ����� ������ �� �浹�� �����Ǹ� ���� �й�
  if (!detectCollision(curPosX, curPosY, blockModel[getCurrentBlockIdx()]))
  {
    return 1;
  }
  else
    return 0;
}








// ���� ����� �ٴ����� �̵����� ������
void solidCurrentBlock()
{
  while (blockDown());
}









// �����̽��ٸ� ������ �ٷ� �������� �Լ�

/*
  void goDirectlyWithSpace()
  {
  int i = 0;

  deleteBlock(blockModel[getCurrentBlockIdx()]);


  // �ε����� ������ i ���� ��� ������Ű��
  while (!detectCollision(curPosX, curPosY + i, blockModel[getCurrentBlockIdx()]))
  {
  i++;
  }

  // �� i ���� ���Ѵ�
  curPosY += i;

  setCurrentCursorPos(curPosX, curPosY);
  showBlock(blockModel[getCurrentBlockIdx()]);

  }
*/


// �� ���� ��á���� Ȯ���ϴ� �Լ�
/*
  void oneLineIsFilled()
  {
  int count = 0;


  for (int x = 1; x < GBOARD_WIDTH + 1; x++)
  {

  if (gameBoardInfo[GBOARD_HEIGHT - 1][x] == 1)
  {
  count++;
  }

  }


  // 10�� ��� �� ��������
  if (count == 10)
  {
  // �� ���� �����
  deleteLastLine();

  // ���� �� ������ �Ʒ��� ������
  for (int y = 0; y < GBOARD_HEIGHT; y++)
  {
  for (int x = 0; x < GBOARD_WIDTH; x++)
  {
  gameBoardInfo[y][x] = gameBoardInfo[y - 1][x];
  }
  }
  }
  }
*/


/* end of file */
