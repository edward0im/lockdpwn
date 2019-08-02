#include "stdafx.h"
#include <Windows.h>
#include "keyCurControl.h"
#include "blockStageControl.h"
#include "scoreLevelControl.h"

#define START_CURPOS_X (5*2)
#define START_CURPOS_Y (0)

void main()
{
  // ���� �ӵ� ����
  initKeyDelayRate(10);
  // Ŀ�� ������ ����
  removeCursor();
  // ���� ���� �׸���
  drawGameBoard();
  showCurrentScoreAndLevel();

  while (1)
  {
    // �� ����� ������ġ ����
    initNewBlockPos(START_CURPOS_X, START_CURPOS_Y);
    // ��� ����
    chooseBlock();

    if (isGameOver())
    {
      break;
    }
    while (1)
    {
      if (!blockDown())
      {
        // addCurrentBlockInfoToBoard();  // ȣ�� ��ġ�� blockDown�Լ� ������ �Ű��
        break;
      }
      if (insertUserKeyInput())
        break;
    }
  }
  setCurrentCursorPos(10, 10);
  puts("GAME OVER!\n");
}
/* end of file*/
