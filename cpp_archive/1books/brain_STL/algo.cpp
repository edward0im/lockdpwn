/*
  c++ stl p143 find �˰����� ����� vector�ȿ� �ִ� ��ü�� ã�� �ڵ�
*/
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
  vector<int> ve;

  ve.push_back(10);
  ve.push_back(20);
  ve.push_back(30);
  ve.push_back(40);
  ve.push_back(50);

  vector<int>::iterator iter;

  iter = find(ve.begin(), ve.end(), 20);    // find �˰����� ����� ���� ã�´�

  cout<<*iter<<endl;


  iter = find(ve.begin(), ve.end(), 100);

  if (iter == ve.end())
  {
    cout<< "�׷��� ����!"<<endl;
  }

  return 0;
  
}
