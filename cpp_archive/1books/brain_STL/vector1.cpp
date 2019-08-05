#include <iostream>
#include <vector>

using namespace std;


int main()
{
  vector<int> ve;

  ve.push_back(100);
  ve.push_back(200);
  ve.push_back(300);
  ve.push_back(400);
  ve.push_back(500);



  // size_type�� �̿��� i ���� unsigned int ������ ��������ش�
  for (vector<int>::size_type i = 0; i < ve.size(); ++i)
  {
    cout << ve[i] << endl;
  }
  cout << endl;

  cout << ve.size() << endl;			// size() : ������ ����
  cout << ve.capacity() << endl;		// capacity() : �Ҵ�� �޸��� ũ��
  cout << ve.max_size() << endl;      // max_size() : �ִ� ���尡���� ������ ����

  return 0;
}
