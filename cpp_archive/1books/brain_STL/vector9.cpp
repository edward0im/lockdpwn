/*
  c++ stl p201 vector ==> erase() ����Լ��� �̿��� ���Ҹ� �����ϴ� ���� �ڵ�
*/

#include <iostream>
#include <vector>

using namespace std;

int main()
{
  vector<int> ve;


  ve.push_back(100);
  ve.push_back(200);
  ve.push_back(300);
  ve.push_back(400);
  ve.push_back(500);



  vector<int>::iterator iter;
  vector<int>::iterator iter2;

  
  for(iter = ve.begin() ; iter != ve.end() ; ++iter)
  {
    cout<< *iter << " ";
  }
  cout<<endl;



  // 1
  iter = ve.begin() + 2;
  iter2 = ve.erase(iter);    // ���� iter�� ����Ű�� ���Ҹ� �����ϰ� iter2�� �� �ּҸ� ����ŵ�ϴ�
  
  for(iter = ve.begin() ; iter != ve.end() ; ++iter)
  {
    cout<< *iter << " ";
  }
  cout<<endl;



  // 2
  iter2 = ve.erase(ve.begin() + 1, ve.end());    // begin() + 1 ���� end()������ ���Ҹ� �����մϴ�

  for(iter = ve.begin() ; iter != ve.end() ; ++iter)
  {
    cout<< *iter << " ";
  }
  cout<<endl;

  
  return 0;
  
}
