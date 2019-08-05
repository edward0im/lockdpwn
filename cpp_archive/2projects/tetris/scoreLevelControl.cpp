

#include "stdafx.h"
#include "keyCurControl.h"

#define LEVEL_DIFF 2				// �ܰ躰 �ӵ� ���� ����
#define LEVEL_UP_SCORE_DIFF 200    // ������ �����ϴ� ���ھ� ���� ����

static int curGameLevel = 1;
static int curGameScore = 0;

void showCurrentScoreAndLevel()
{

	setCurrentCursorPos(30, 4);
	printf("& ���� ���� : %d  &", curGameLevel);

	setCurrentCursorPos(30, 7);
	printf("& ���� ���� : %d  &", curGameScore);

}


void gameLevelUp()
{
	curGameLevel++;
	keyDelaySpeedCtl(LEVEL_DIFF);
}


void addGameScore(int score)
{
	if (score < 1)
		return;

	curGameScore += score;


	// ���� ��� Ȯ�� �� ���� up!
	if (curGameScore >= curGameLevel * LEVEL_UP_SCORE_DIFF)
		gameLevelUp();

}

