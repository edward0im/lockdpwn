/*
  c++ stl p358 algo ==> transform() �˰����� for_each() �˰��� ��� ����غ� ���� �ڵ�
                        // transform() <===> for_each() �˰��� ��� ��� ��ü ���ҿ� ��� ��ȭ�� ��å�� �ݿ��� �� ����Ѵ�
                        // transform()�� ������ ������ ��ȭ���� �������� �������� �����Ѵ� (..?)(what..?)
  */
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int Func(int n) {
  return n + 5;
}

int main() {
  vector<int> v;

  v.push_back(10);
  v.push_back(20);
  v.push_back(30);
  v.push_back(40);
  v.push_back(50);

  cout << "v : ";
  for (vector<int>::size_type i = 0; i < v.size(); i++)  {
    cout << v[i] << endl;
  }
  cout << endl;

  // transform ���� �ڵ�
  transform(v.begin(), v.end(), v.begin(), Func);

  cout << "v : ";
  for (vector<int>::size_type i = 0; i < v.size(); i++) {
    cout << v[i] << endl;
  }
  cout << endl;

  return 0;
}
