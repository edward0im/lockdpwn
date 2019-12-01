/*
  c++ ==> ���� c++ p283 ���(Ŭ����)�� ������ �� �ִ� �ڵ�
*/

#include "stdafx.h"
#include <iostream>


using namespace std;

class Person
{
 private:
  int age;
  char name[50];

 public:
  Person(int myage, char *myname) :age(myage)
  {
    strcpy_s(name, 100, myname);
  }

  void WhatYourName() const
  {
    cout << "my name is: " << name << endl;
  }

  void HowOldAreYou() const
  {
    cout << "Im " << age << " years old" << endl;
  }

};


class UnivStudent : public Person     // public ���
{
 private:
  char major[50];

 public:
  UnivStudent(char *myname, int myage, char *mymajor)
      :Person(myage, myname)
  {
    strcpy_s(major, 100, mymajor);
  }

  void WhoAreYou() const
  {
    WhatYourName();
    HowOldAreYou();
    cout << "My Major is : " << major << endl;

  }

	
};



int main()
{
  UnivStudent ustd1("Lee", 22, "Computer eng.");
  ustd1.WhoAreYou();

  UnivStudent ustd2("Yoon", 21, "Electric eg.");
  ustd2.WhoAreYou();

  return 0;

}
