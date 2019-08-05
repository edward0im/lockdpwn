/*
	������� ��ų���� - ����(try, catch)�� �̿��� ������ �ҽ��ڵ�
*/
#include "stdafx.h"
#include <iostream>


using namespace std;


int main()
{
  int input;

  while (1)
  {
    try
    {
      cout << "�� ��? ";
      cin >> input;


      if (cin.fail())
      {
        throw "error";
      }

      else if (input >= 1 && input <= 9)
      {
        for (int i = 1; i <= 9; i++)
        {
          cout << input << "x" << i << "=" << input*i << '\t';
        }

        cout << endl << endl;
      }

      else throw input;



    }


    catch (int e)
    {
      cout << e << "�� �߸��� �Է��Դϴ�. 1~ 9 ������ ���ڸ� �Է��ϼ���" << endl << endl;
    }

    catch (char *e)
    {
      cout << e << "�� �߸��� ���ڿ� �Է��Դϴ�. 1~ 9 ������ ���ڸ� �Է��ϼ���" << endl << endl;
    }

    break;
  }


  return 0;
}












