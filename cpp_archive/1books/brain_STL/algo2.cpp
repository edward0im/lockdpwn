/*
  c++ stl p145 �˰��� sort�� ���� �ڵ�
 */
#include <iostream>
#include <list>
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

  list<int> list;

  list.push_back(10);
  list.push_back(20);
  list.push_back(30);
  list.push_back(40);
  list.push_back(50);


  sort(ve.begin(), ve.end());  // ���� ����(vector�� ���� ���ٹݺ���)
  //  sort(list.begin(), list.end()); ����! (list�� ����� �ݺ����̹Ƿ� ������ �Ұ����ϴٰ� �Ѵ�)
  return 0;
}
