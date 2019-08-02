/*
  c++ stl p70 �Լ� �����͸� Ȱ���� �ݹ��Լ��� �����ϴ� �ڵ�
*/
#include <iostream>

using namespace std;

////////////����//////////////////////
void For_each(int *begin, int *end, void(*pf)(int))
{
    while(begin != end)
        {
            //cout<<"@@"<<*begin<<endl;
            //cout<<"!!"<<begin<<endl;
            pf(*begin++);
            //cout<<endl;
        }
}

/////////Ŭ���̾�Ʈ///////////////////
void Print1(int n)
{
    cout<<n<<' ';
}

void Print2(int n)
{
    cout<<n*n<<" ";
}

void Print3(int n)
{
    cout<<"int: "<<n<<endl;
}

int main()
{
    int arr[5] = {10,20,30,40,50};

    For_each(arr,arr+5,Print1);
    cout<<endl<<endl;

    For_each(arr,arr+5,Print2);
    cout<<endl<<endl;

    For_each(arr,arr+5,Print3);
}
