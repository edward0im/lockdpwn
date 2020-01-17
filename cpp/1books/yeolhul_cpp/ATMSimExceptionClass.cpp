/*
  c++ ==> ���� c++ p606 ����Ŭ������ ���ܰ�ü�� ���� �ڵ� throw (DepositException)
  �׸��� AccountException���� ����ó���� ��Ӱ���� �س����� �ξ� ����ϱ� ����
*/
#include "stdafx.h"
#include <iostream>
#include <cstring>


using namespace std;


class AccountException
{
 public:
  virtual void showExceptionReason() = 0; // ���� �����Լ��� �����ؼ� ����ó���� ������� �ذ��ϰ� �Ѵ�
};


class DepositException   : public AccountException
{
 private:
  int reqDep;

 public:
  DepositException(int money) : reqDep(money)
  {}


  void showExceptionReason()
  {
    cout << "Exception: " << reqDep << endl;
  }

};


class WithdrawExcpetion  : public AccountException
{
 private:
  int balance;

 public:
  WithdrawExcpetion(int money) :balance(money)
  {}

  void showExceptionReason()
  {
    cout << "Exception2: " << balance << endl;
  }

};


class Account
{
 private:
  char accNum[50];
  int balance;

 public:
  Account(char *acc, int money) : balance(money)
  {
    int len = strlen(acc) + 1;
    strcpy_s(accNum, len, acc);
  }



  void Deposit(int money) throw (AccountException)  // throw (DepositException)�� ��� �����Ѵ�
  {													// ����ϱ� ���� ���µ�
    if (money < 0)
    {
      DepositException expn(money);
      throw expn;
    }
		
    balance += money;

  }

  void Withdraw(int money) throw (AccountException)
  {
    if (money > balance)
    {
      throw WithdrawExcpetion(balance);
    }

    balance -= money;
  }

  void ShowMyMoney()
  {
    cout << "�ܰ�: " << balance << endl << endl;
  }

};


int main()
{
  Account myAcc("56345-2342", 5000);

  try
  {
    myAcc.Deposit(2000);
    myAcc.Deposit(-300);
  }

  catch (AccountException &expn)
  {
    expn.showExceptionReason();
  }

  myAcc.ShowMyMoney();
  try
  {
    myAcc.Withdraw(3500);
    myAcc.Withdraw(5000);

  }
  catch (AccountException &expn)
  {
    expn.showExceptionReason();
  }
  myAcc.ShowMyMoney();

  return 0;
}












