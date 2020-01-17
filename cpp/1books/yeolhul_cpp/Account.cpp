
#include "BankingCommonDecl.hpp"
#include "Account.hpp"

using namespace std;


// ������ (���� ����)
Account::Account(int ID, int money , String name)
    : accID(ID) , balance(money)
{
  cusName = name;
}


// ID Ȯ��
int Account::GetAccID() const
{
  return accID;
}


// �Ա�
void Account::Deposit(int money)
{
  balance += money;
}


// ���
int Account::Withdraw(int money)
{
  if (balance < money)
  {
    return 0;
  }

  balance -= money;
  return money;
}


// �����������
void Account::ShowAccInfo() const
{
  cout << "���� ID: " << accID << endl;
  cout << "�̸�: " << cusName << endl;
  cout << "�ܾ�: " << balance << endl;
}
