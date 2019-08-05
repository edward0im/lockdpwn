/*
  ���� c++ p466  ���� ������ �����ε� �� operator[] �� ���� �ڵ�
*/
#include "stdafx.h"
#include <iostream>
#include <cstdlib>

using namespace std;

class Point
{
 private:
  int xpos, ypos;

 public:
  Point(int x = 0, int y = 0) : xpos(x), ypos(y)
  {}

  friend ostream& operator<<(ostream& os, const Point& pos);
};



// cout << ... 
ostream& operator<<(ostream& os, const Point& pos)
{
  os << pos.xpos << ", " << pos.ypos << endl;
  return os;
}





typedef Point* POINT_PTR;





class boundCheckPointPtrArray
{
 private:
  POINT_PTR *arr;
  int arrlen;



  boundCheckPointPtrArray(const boundCheckPointPtrArray& arr)
  {}  // bound Ŭ������ ��������� (�迭�� ���縦 ��õ������ ���´�)(��κ��� ��� ���ʿ��ϰų� �Ǽ��� ���ֵǹǷ�)
  // private �������� �ۿ��� ���� ���ϰ� ���Ƴ���
  boundCheckPointPtrArray& operator=(const boundCheckPointPtrArray& arr)
  {} // bound Ŭ������ ���Կ����� (=)


 public:
  boundCheckPointPtrArray(int len) : arrlen(len)
  {
    arr = new POINT_PTR[len];       // arr.operator[](len)�� ����
  }



  POINT_PTR& operator[](int idx)   // ���Կ����� operator[]
  {
    if (idx < 0 || idx >= arrlen)
    {
      cout << "ERROR OCCURED" << endl;
      exit(1);
    }

    return arr[idx];
  }



  POINT_PTR& operator[](int idx) const  // ���Կ����� operator[] const (�Լ��� �����ε��� ���� const���� ���� �� ����Ѵ�)
  {
    if (idx < 0 || idx >= arrlen)
    {
      cout << "ERROR OCCURED" << endl;
      exit(1);
    }

    return arr[idx];
  }


  int getArrayLen() const
  {
    return arrlen;
  }


  ~boundCheckPointPtrArray()
  {
    delete []arr;
  }


};



int main()
{
  boundCheckPointPtrArray eddy(3);

  eddy[0] = new Point(1, 2);      // eddy.operator[] (0)  = new Point(1,2);
  eddy[1] = new Point(100, 200);
  eddy[2] = new Point(10000, 20000);

  for (int i = 0; i < eddy.getArrayLen(); i++)
  {
    cout << *(eddy[i]) << eddy[i] << endl;  // �� *�� �ٿ����ϴ��� ������ �� �𸣰ڴ�... 0.0
    // ��ü�ڽ��� ����Ű�� �Ŷ�� �Ѵ�. �׳� eddy�� �ּҰ��ε�
    // eddy.operator[](i)�� ���� arr[idx]�� ��ȯ�Ѵ�
  }

  delete eddy[0];
  delete eddy[1];
  delete eddy[2];

  return 0;

}









