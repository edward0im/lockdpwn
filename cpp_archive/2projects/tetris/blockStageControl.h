



#include "stdafx.h"

#ifndef __BLOCKSTAGECONTROL_H__
#define __BLOCKSTAGECONTROL_H__


void initNewBlockPos(int x, int y);

void chooseBlock();

int getCurrentBlockIdx();
void showBlock(char blockInfo[][4]);
void deleteBlock(char blockInfo[][4]);

// ����� �浹�� �����ϴ� �Լ�
int detectCollision(int posX, int posY, char blockModel[][4]);

int blockDown();
void shiftLeft();
void shiftRight();
void rotateBlock();

void drawGameBoard();

// gameBoardInfo�� ���� ������ �߰��ϴ� �Լ�
void addCurrentBlockInfoToBoard();

int isGameOver();

void drawSolidBlocks();
void removeFillUpLine();
void solidCurrentBlock();


#endif