#include "BankingCommonDecl.hpp"
#include "AccountHandler.hpp"
#include "Account.hpp"
#include "NormalAccount.hpp"
#include "HighCreditAccount.hpp"
#include "String.hpp"

using namespace std;

// ������
AccountHandler::AccountHandler()
    : accNum(0)
{}

// ATM �޴�
void AccountHandler::ShowMenu(void) const
{
  cout << "-----------MENU---------" << endl;
  cout << "1. ���� ����" << endl;
  cout << "2. �Ա�" << endl;
  cout << "3. ���" << endl;
  cout << "4. �������� ��ü ���" << endl;
  cout << "5. ���α׷� ����" << endl;
}

// ���¸����
void AccountHandler::MakeAccount()
{
  int sel;

  cout << "[���� ���� ����]" << endl;
  cout << "1. ���� ���� ����" << endl;
  cout << "2. �ſ� �ŷ� ����" << endl;

  cout << "����� ������ : ";
  cin >> sel;

  if (sel == NORMAL)
  {
    MakeNormalAccount();
  }
  else if(sel == CREDIT)
  {
    MakeCreditAccount();
  }
  else
  {
    cout << "ERROR!";
    return ;
  }
}

// ���뿹�ݰ��� ����
void AccountHandler::MakeNormalAccount()
{
  int id;

  String name;
  int balance;
  int interRate;

  cout << "[���뿹�ݰ��� ����]" << endl;

  cout << "���� ID: ";
  cin >> id;

  cout << "�̸�: ";
  cin >> name;

  cout << "�Աݾ�: ";
  cin >> balance;

  cout << "������: ";
  cin >> interRate;
  cout << endl;

  accArr[accNum++] = new NormalAccount(id, balance, name, interRate);
}

// �ſ�ŷڰ��� ����
void AccountHandler::MakeCreditAccount()
{
  int id;
  String name;
  int balance;
  int interRate;
  int creditLevel;

  cout <<"[�ſ�ŷڰ��� ����]"<<endl;

  cout << "���� ID: ";
  cin >> id;

  cout << "�̸�: ";
  cin >> name;

  cout << "�Աݾ�: ";
  cin >> balance;

  cout << "������: ";
  cin >> interRate;

  cout << "�ſ���(1toA, 2toB, 3toC): ";
  cin >> creditLevel;

  cout << endl;

  switch (creditLevel)
  {
    case 1:
      accArr[accNum++] = new HighCreditAccount(id,balance,name,interRate,LEVEL_A);
      break;

    case 2:
     accArr[accNum++] = new HighCreditAccount(id,balance,name,interRate,LEVEL_B);
      break;

    case 3:
     accArr[accNum++] = new HighCreditAccount(id,balance,name,interRate,LEVEL_C);
      break;
  }
}

// �Ա�
void AccountHandler::DepositMoney()
{
  int money;
  int id;

  cout << "[�� ��]" << endl;

  cout << "���� ID: ";
  cin >> id;

  cout << "�Աݾ�: ";
  cin >> money;

  for (int i= 0; i<accNum; i++)
  {
    if(accArr[i]->GetAccID() == id)
    {
      accArr[i]->Deposit(money);
      cout << "[+] �Ա� �Ϸ�Ǿ����ϴ�" << endl << endl;
      return ;
    }
  }
  cout << "[-] ��ȿ���� ���� ID�Դϴ�." << endl << endl;
}

// ���
void AccountHandler::WithdrawMoney()
{
  int money;
  int id;

  cout << "[�� ��]" << endl;

  cout << "���� ID: ";
  cin >> id;

  cout << "�Աݾ�: ";
  cin >> money;

  for (int i= 0; i<accNum; i++)
  {
    if(accArr[i]->GetAccID() == id)
    {
      if (accArr[i]->Withdraw(money) == 0)
      {
        cout << "[-] �ܾ��� �����մϴ�" << endl << endl;
        return ;
      }
      cout << "[+] ����� �Ϸ�ƽ��ϴ�" << endl << endl;
      return ;
    }
  }
  cout << "[-] ��ȿ���� ���� ID�Դϴ�." << endl << endl;
}

// �������� ���
void AccountHandler::ShowAllAccInfo() const
{
  for (int i = 0; i< accNum; i++)
  {
    accArr[i]->ShowAccInfo();
    cout << endl;
  }
}




// �Ҹ���
AccountHandler::~AccountHandler()
{
  for (int i =0; i < accNum; i++)
  {
    delete accArr[i];
  }

}



