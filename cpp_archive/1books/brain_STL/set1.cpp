/*
  c++ stl p254 set ==> set<int> �����̳� ù ��� ���� �ڵ�
 */
#include <iostream>
#include <set>

using namespace std;

int main()
{
  set<int> s;

  s.insert(50);
  s.insert(30);
  s.insert(80);
  s.insert(40);
  s.insert(10);
  s.insert(70);
  s.insert(90);

  set<int>::iterator iter;

  for(iter = s.begin() ; iter != s.end(); iter++)
  {
    cout<< *iter <<endl;   // set<int> �����̳ʴ� �˾Ƽ� ������������ ���ҵ��� �����մϴ� : 10 30 40 50 70 80 90...
  }
  cout << endl;

  
  s.insert(50);
  s.insert(50);   // �ߺ������� ������ �ʽ��ϴ� (multiset�� ����ϸ� ��)

  for(iter = s.begin() ; iter != s.end(); iter++)
  {
    cout<< *iter <<endl;
  }
  cout << endl;

  s.insert(50);

 
  return 0;
}
