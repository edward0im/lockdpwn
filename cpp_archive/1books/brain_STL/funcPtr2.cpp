/*
  c++ stl p71 �Լ� �����͸� Ȱ���� �ݹ��Լ��� �����ϴ� �ڵ� (algorithm ���)
*/

#include <iostream>
#include <algorithm>


using namespace std;


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

    for_each(arr,arr+5,Print1);
    cout<<endl<<endl;

    
    for_each(arr,arr+5,Print2);
    cout<<endl<<endl;
    
    
    for_each(arr,arr+5,Print3);


    
}
