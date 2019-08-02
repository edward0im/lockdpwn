/*
  Name :rentInfo.h ver 1.1
   Content : ��ȭ DVD �뿩 ���� ����ü 
   Implementation : LKB
   Last modified 2016/07/10
*/


#ifndef __RENTINFO_H__
#define __RENTINFO_H__


#include "dvdInfo.h"
#include "cusInfo.h"

typedef struct __dvdRentInfo
{
  char cusID[ID_LEN];
  char ISBN[ISBN_LEN];
  unsigned int rentDay;
} dvdRentInfo;



#endif



/* end of file */
