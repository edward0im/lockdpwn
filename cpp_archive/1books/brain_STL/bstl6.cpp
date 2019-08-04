/*
  c++ stl p113 template ���� ���� �ڵ�
*/
#include <iostream>
#include <string>
#include <typeinfo>

using namespace std;

template<typename T>
class ObjectInfo
{
  T data;

 public:
  ObjectInfo(const T& d)   : data(d)
  {}

  void Print()
  {
    cout<<"Ÿ�� : "<<typeid(data).name() << endl;
    cout<<"ũ�� : "<<sizeof(data)<<endl;
    cout<<"�� : " << data << endl;
  }
};

template<>
class ObjectInfo<string>
{
  string data;

 public:
  ObjectInfo(const string& d)   : data(d)
  {  }

  void Print()
  {
    cout<<"Ÿ�� : "<<"string"<<endl;
    cout<<"���ڿ� ���� : " << data.size() << endl;
    cout<<"�� : "<<data <<endl;
  }
};

int main()
{
  ObjectInfo<int> d1(10);
  d1.Print();

  cout<<"-----------�߽� �߽� �߽�"<<endl;

  ObjectInfo<double> d2(5.5);
  d2.Print();
  cout<<"----------�߽� �߽� �߽�"<<endl;
  
  ObjectInfo<string> d3("Hello!");
  d3.Print();

  cout<<"---------�߽� �߽� �߽�"<<endl;

  return 0;
}
