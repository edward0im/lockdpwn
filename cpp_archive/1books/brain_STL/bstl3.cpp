/*
  c++ stl p48 Ÿ�Ժ�ȯ ������ �����ε��� ���� �ڵ�
*/

#include <iostream>

using namespace std;

class A
{};



class B
{
    public:

    B()
    {
        cout<< "B()"<<endl;;
        
    }

    B(A& _a)
    {
        cout<< "B(A& _a)"<<endl;
    }


    B(int n)
    {
        cout<< "B(int n)"<<endl;
    }

    B(double d)
    {
        cout<< "B(double d)"<<endl;
    }
    
};


int main()
{
    A a;

    int n = 10;
    double d = 5.5;

    B b;   // b() ȣ��

    b = a;   // b(A& _a) ȣ�� 
    b = n;   // b(int n) ȣ��
    b = d;   // b(double d) ȣ��

    return 0;

    
}
