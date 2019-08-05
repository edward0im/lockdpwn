// c++ stlp 43 ����Ʈ �����Ϳ� ���� �ڵ�

#include <iostream>

using namespace std;


class Point
{
  int x;
  int y;


 public:

  Point(int _x = 0, int _y = 0) : x(_x), y(_y)
  {}

  void Print() const
  {
    cout<< x << ',' << y << endl;
  }

    
};


// ����Ʈ ������ ����
class PointPtr
{
  Point *ptr;

 public:

  PointPtr(Point *p) : ptr(p)
  {}

  ~PointPtr()
  {
    delete ptr;
  }


  Point* operator->() const
  {
    return ptr;
  }


  Point& operator*() const
  {
    return *ptr;
  }
};




int main()                              
{
  PointPtr p1 = new Point(2,3);
  PointPtr p2 = new Point(5,5);

  p1->Print();                        //  p1.operator->() const �Լ��� ȣ���մϴ�
  p2->Print();                        //  p2.operator->() const �Լ��� ȣ���մϴ�
  //  p1, p2 �Ҹ��ڿ��� �ڵ����� Point ���� ��ü�� �޸𸮿��� �����մϴ�
  cout<<endl;

    
  Point* p3 = new Point(1,1);
  PointPtr p4 = new Point(2,2);

  p3-> Print();
  p4-> Print();

  cout<<endl;

  (*p3).Print();   // *p3.Print()�� ȣ���մϴ�
  (*p4).Print();   // p4.operator*().Print() �� ȣ���մϴ�

  delete p3;                          // p4�� �˾Ƽ� �Ҹ�˴ϴ�
  return 0;
}
