/*
  ���� c++ p249
	     friend ����
	     ���������� ���ʶ߸��� �����̹Ƿ� ���ظ� �ϰ� �ظ��ϸ� ���� �ʵ��� ����
*/

#include "stdafx.h"
#include <iostream>

using namespace std;

class Girl;

class Boy
{
 private:
  int height;
  friend class Girl;

 public:
  Boy(int len) :height(len)
  {}

  void ShowYourFriendInfo(Girl &frn);

};

class Girl
{
 private:
  char phNum[20];

 public:
  Girl(char *num)
  {
    strcpy_s(phNum,100, num);
  }

  void ShowYourFriendInfo(Boy &frn);

  friend class Boy;
};

void Boy::ShowYourFriendInfo(Girl &frn)
{
  cout << "Her phone number is : " << frn.phNum << endl;
}

void Girl::ShowYourFriendInfo(Boy &frn)
{
  cout << "His height is : " << frn.height << endl;
}

int main()
{
  Girl girl("010-1234-5612");
  Boy boy(170);
	

  boy.ShowYourFriendInfo(girl);
  girl.ShowYourFriendInfo(boy);
  return 0;
}
