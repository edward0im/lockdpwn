// c++ stl p39 ��� ��ü�� ��ȯ�ϴ� [] ������ �����ε��� ���� �ڵ� (const���� ���� �����ڿ����ε� ������ ����� �Ѵ�)

#include <iostream>

using namespace std;


class Array
{
  int *arr;
  int size;
  int capacity;

 public:

  Array(int cap = 100) :arr(0), size(0), capacity(cap)
  {
    arr = new int[capacity];
  }


  ~Array()
  {
    delete []arr;
  }


  void Add(int data)
  {
    if(size < capacity)
    {
      arr[size++] = data;
    }
  }



  int Size() const
  {
    return size;
  }


  int operator[](int idx) const
  {
    return arr[idx];
  }

    
  int& operator[](int idx)
  {
    return arr[idx];
  }
    
    
};


int main()
{
  Array ar(10);

  ar.Add(10);
  ar.Add(20);
  ar.Add(30);

  cout<<ar[0] <<endl;     // int& operator[](int idx) �� ȣ���մϴ�
  cout<<endl;


  const Array& ar2 = ar;
    
  cout<<ar2[0] <<endl;     // int operator[](int idx) const �� ȣ���մϴ�
  cout<<endl;



  ar[0] = 100;   // int& operator[](int idx) �� ȣ���� �ذ��մϴ�
    
  // ar2[0] = 100;  ����! int operator[](int idx) const �� ȣ���� �ذ��ϴٰ� �ȵ˴ϴ�

  return 0;

            
    
}








