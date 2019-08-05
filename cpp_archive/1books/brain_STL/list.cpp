/*
  c++ stl p222 list ==> ����Ʈ �����̳ʰ� vector, deque�� ���� �������� �����ִ� ���� �ڵ�
                    ==> ������̹Ƿ� insert()�� erase()�� ���� �޸� ���� ���� 
 */
#include <iostream>
#include <list>

using namespace std;


int main()
{
  list<int> lt;

  lt.push_back(1);
  lt.push_back(20);
  lt.push_back(300);
  lt.push_back(4000);
  lt.push_back(50000);

  list<int>::iterator iter = lt.begin();
  list<int>::iterator iter2;


  
  for(iter = lt.begin() ; iter != lt.end() ; iter++)
  {
    cout<< *iter <<endl;
  }
  cout<<endl;


 ///////////////////////////////////////////////////////////

  iter = lt.begin();
  ++iter;
  ++iter;
  iter2 = lt.erase(iter);

  for(iter = lt.begin() ; iter != lt.end() ; iter++)
  {
    cout<< *iter <<endl;
  }
  cout<<endl;

  cout<<"iter2 : " << *iter2 <<endl<<endl;


 ///////////////////////////////////////////////////////////

  iter = iter2;
  iter2 = lt.insert(iter,333);

  for(iter = lt.begin() ; iter != lt.end() ; iter++)
  {
    cout<< *iter <<endl;
  }
  cout<<endl;

  
  cout<<"iter2 : " << *iter2 <<endl;


  return 0;
}
