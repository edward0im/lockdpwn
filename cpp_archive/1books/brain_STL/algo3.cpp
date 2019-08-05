/*
  c++ stl p146 �˰��� sort�� �Լ������͸� ����� �������� �������� ������ �ڵ�(greater<int>, less<int>)
 */
#include <iostream>
#include <list>
#include <vector>
#include <algorithm>
#include <stdio.h>


using namespace std;


int main()
{
  vector<int> ve;

  ve.push_back(50);
  ve.push_back(10);
  ve.push_back(20);
  ve.push_back(40);
  ve.push_back(30);

  sort(ve.begin(), ve.end(), less<int>()); // �������� ����

  for(vector<int>::iterator iter = ve.begin() ; iter != ve.end(); ++iter)
  {
    cout<< *iter << " ";
  }
  cout << endl;




  
  sort(ve.begin(), ve.end(), greater<int>());  // �������� ����
  
  for(vector<int>::iterator iter = ve.begin() ; iter != ve.end(); ++iter)
  {
    cout<< *iter << " ";
  }
  cout << endl;
  
  
  
  return 0;
  
}
