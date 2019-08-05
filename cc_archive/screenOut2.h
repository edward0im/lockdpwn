/*
  Name : screenOut2.h ver 1.1
  Content : �ܼ� ����� ���� �Լ� ����
  Implementation : LKB
  Last modified 2016/07/09
*/


#ifndef __SCREENOUT_H__
#define __SCREENOUT_H__

#include "cusInfo.h"
#include "dvdInfo.h"


void showMenu();
void showCustomerInfo(cusInfo *pCus);
void showDvdInfo(dvdInfo *pDvd);
void showGenre(int gen);
void showCustomerInfoContinue(cusInfo *pCus);

#endif


/* end of file */
