/*
  c++ stl p272  set ==> multiset<int>�� set<int>�� �ٸ��ٴ� �� �����ִ� ���� �ڵ� (�ߺ��� ���� �Է��� �� �ִ�)
 */
#include <iostream>
#include <set>

using namespace std;

int main() {
  multiset<int> ms;   // multiset<int> �����̳ʴ� set<int>�� �ٸ��� �ߺ��� ���ҵ� �Է��� �����մϴ�

  ms.insert(50);
  ms.insert(30);
  ms.insert(80);
  ms.insert(30);
  ms.insert(70);
  ms.insert(10);
  ms.insert(60);


  multiset<int>::iterator iter;

  for(iter = ms.begin() ; iter != ms.end() ; iter++)
  {
    cout<< *iter << ' ';
  }
  cout << endl;

  cout<< "30 ������ ����: " << ms.count(30) << endl;  // count() ����Լ��� ����� ������ ������ ���ϴ�


  iter = ms.find(30);
  cout << "iter : " << *iter << endl;


  

  multiset<int>::iterator lower_iter;
  multiset<int>::iterator upper_iter;

  lower_iter = ms.lower_bound(30);
  upper_iter = ms.upper_bound(30);   // lower_bound()�� upper_bound() ����Լ��� ����� ���Ҹ� �˻��� �� �ֽ��ϴ�

 
  cout <<"lower: " << *lower_iter << endl;
  cout<<"upper: "<<*upper_iter << endl;



  cout<< "range[lower, upper)�� ������: " ;

  for(iter = lower_iter ; iter != upper_iter ; iter++)
  {
    cout<< *iter << ' ';
  }
  cout << endl;
  
  return 0;
  
}


    
