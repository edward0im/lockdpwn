/*
  c++ stl p256   set ==>  insert() ����Լ��� ��ȯ������ pair ��ü�� ��ȯ�մϴ� �̸� ������ ���� �ڵ�
 */
#include <iostream>
#include <set>

using namespace std;

int main()
{
  set<int> s;
  pair<set<int>::iterator, bool> pr;    // insert() ����Լ��� ��ȯ������ pair��ü�� ��ȯ�մϴ�
  // pair.first : �ش� ��
  // pair.second : true or false �� (�� �Է��� �����߳� �����߳� �÷���)

  
  pr = s.insert(50);
  s.insert(4444);
  s.insert(2222);

  
  if(true == pr.second)
  {
    cout<< *pr.first << " SUCCESS!"<<endl;
  }
  else
  {
    cout<< *pr.first << " FAIL!"<<endl;
  }

  
    
  set<int>::iterator iter;

  for(iter = s.begin() ; iter != s.end(); iter++)
  {
    cout<< *iter <<endl; 
  }
  cout << endl;

  

  pr = s.insert(5550);
  
  if(true == pr.second)
  {
    cout<< *pr.first << " SUCCESS!"<<endl;
  }
  else
  {
    cout<< *pr.first << " FAIL!"<<endl;
  }


  for(iter = s.begin() ; iter != s.end(); iter++)
  {
    cout<< *iter <<endl; 
  }
  cout << endl;


  
  
  return 0;
}
