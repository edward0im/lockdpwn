/*
  c++ stl p215 deque ==> insert() ����Լ��� ����� ���� �ڵ�
 */
#include <iostream>
#include <deque>

using namespace std;

int main()
{
  deque<int> dq;

  for(deque<int>::size_type i = 0 ; i < 10 ; i++)
  {
    dq.push_back((i+1) * 10);
  }



  
  deque<int>::iterator iter;
  deque<int>::iterator iter2;

  for(iter = dq.begin() ; iter != dq.end() ; iter++)
  {
    cout<< *iter<<endl;
  }
  cout<<endl;


  
  iter = dq.begin() + 2;
  iter2 = dq.insert(iter,555);  // iter �ּҿ� 555�� �߰��ϰ� iter2�� ����Ű�� �մϴ�

  cout<< "["<< *iter2 <<"]"<<endl<<endl;


  
  for(iter = dq.begin() ; iter != dq.end() ; iter++)
  {
    cout<< *iter<<endl;
  }
  cout<<endl;
  
  return 0;
}
