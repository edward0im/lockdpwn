/*
  c++ stl p60 �Լ������Ϳ� ���� ���� ���� �ڵ�
*/

#include <iostream>

using namespace std;

void Print(int n)
{
    cout<<"int: "<< n <<endl;
}



int main()
{
    void (*pf)(int);   // �Լ� ������ ���� 
    pf = Print;


    Print(10);
    pf(10);
    (*pf)(10);


    cout<<endl;
        
    
}
