/*
  c++ stl p178 vector �����ڿ� � ���� �ִ��Ŀ� ���� �ٸ� ���Ͱ� �����ȴ� v1(5), v2(5,10)...
*/
#include <iostream>
#include <vector>

using namespace std;

int main() {
  vector<int> v1(5);
  vector<int> v2(5,0);   // vector �����ڿ� �ʱⰪ�� ������ �� �ִ�
  vector<int> v3(5,55555);

  for (vector<int>::size_type i = 0; i < v1.size(); ++i)
    cout << v1[i] << " ";

  cout << endl;

  for (vector<int>::size_type i = 0; i < v2.size(); ++i)
    cout << v2[i] << " ";

  cout << endl;

  for (vector<int>::size_type i = 0; i < v3.size(); ++i)
    cout << v3[i] << " ";

  cout << endl;

  return 0;
}
