/*
  c++ stl p194 vector ==> iterator �� const_iterator�� const vector<int>::iterator�� �������� ���� �ڵ�
*/

#include <iostream>
#include <vector>

using namespace std;

int main()
{
  vector<int> ve;
  int arr[5] = {10,20,30,40,50};

  ve.push_back(100);
  ve.push_back(200);
  ve.push_back(300);
  ve.push_back(400);
  ve.push_back(500);

  /*
    const *int aa;
    int* const bb = &cc;

    aa = 10; (x)
    aa++; (o)
 
    bb = 10; (o)
    bb++; (x)

    aa�� ���� ������ �Ұ����ϰ�
    bb�� �ּ��� ������ �Ұ����ϴ�

  */

  vector<int>::iterator iter = ve.begin();   
  int *p = arr;
  cout << *iter <<", " << *p << endl;

  vector<int>::const_iterator citer = ve.begin();   // const *int (�� ���� x)
  const int* cp = arr;
  cout << *citer <<", " << *cp << endl;

  const vector<int>::iterator iter_const = ve.begin();   // int* const (�ּ� ����x)
  int* const p_const = arr;
  cout << *iter_const <<", " << *p_const << endl;

  const vector<int>::const_iterator citer_const = ve.begin();
  const int* const cp_const = arr;
  cout << *citer_const <<", " << cp_const << endl;

  return 0;
}
