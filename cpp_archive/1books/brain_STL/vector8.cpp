/*
  c++ stl p199 vector ==> insert() ����Լ��� �̿��� ��ü�� ���Ҹ� �߰��ϴ� �����ڵ�
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


  vector<int>::iterator iter = ve.begin() + 2;

  ve.insert(iter,3,123);  // iter�� ����Ű�� ���� ���� 123�� 3�� �����Ѵ�

  for(iter = ve.begin(); iter != ve.end() ; ++iter)
  {
    cout<< *iter << endl;
  }
  cout<< endl;



  vector<int> ve2;
  
  ve2.push_back(1);
  ve2.push_back(2);
  ve2.push_back(3);


  iter = ve2.begin() + 1;


  ve2.insert(iter, ve.begin(), ve.end());   // ve.begin()���� ve.end() ���� ������ ���Ҹ� ve2�� �����Ѵ�

  for(iter = ve2.begin(); iter != ve2.end() ; ++iter)
  {
    cout<< *iter << endl;
  }
  cout<<endl;
  
  return 0;
  
}
