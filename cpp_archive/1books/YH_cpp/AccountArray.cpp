

#include <cstdlib>
#include "BankingCommonDecl.hpp"
#include "AccountArray.hpp"

using namespace std;


// ������ (len �⺻���� 100)
BoundCheckAccountPtrArray::BoundCheckAccountPtrArray(int len)
    : arrlen(len)
{
  arr= new ACCOUNT_PTR[len];
}



// [] ������ �����ε�
ACCOUNT_PTR& BoundCheckAccountPtrArray::operator[](int idx)
{
  if(idx < 0 || idx >= arrlen)
  {
    cout << "Array index out of bound exception" << endl;
    exit(1);
  }

  return arr[idx];
}


// [] ������ �����ε�2
ACCOUNT_PTR BoundCheckAccountPtrArray::operator[] (int idx) const
{
  if(idx < 0 || idx >= arrlen)
  {
    cout << "Array index out of bound exception" << endl;
    exit(1);
  }

  return arr[idx];

}


// ���� ���°��� ���
int BoundCheckAccountPtrArray::GetArrLen() const
{
  return arrlen;
}


// �Ҹ���
BoundCheckAccountPtrArray::~BoundCheckAccountPtrArray()
{
  delete []arr;
}
