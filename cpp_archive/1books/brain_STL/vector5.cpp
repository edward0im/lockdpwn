/*
  c++ stl p183 vector ==> swap()�� ����� ��ü�� �޸𸮸� �����ϴ� ���� �ڵ�
*/

#include <iostream>
#include <vector>


using namespace std;


int main()
{
  vector<int> ve(5);
  
  cout<< "size: "<<ve.size() <<" capacity: " << ve.capacity() << endl;

  // �ӽð�ü�� ve ���͸� swap�ϸ� �޸𸮸� ��ȯ�� �� �ִ�
  vector<int>().swap(ve);

  cout<<"[*] AFTER SWAP"<<endl;
  
  cout<< "size: "<<ve.size() <<" capacity: " << ve.capacity() << endl;


  

  return 0;
  
}
