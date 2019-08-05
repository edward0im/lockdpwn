/*
  c++ ==> stl p155 reverse_iterator�� �������Ұ� �ƴ� ���� ���Ҹ� ����Ű�� ����
          ������ ������ �� --�����ڸ� �Ⱦ��� ++�����ڸ����� ���� ������ �����ϱ� ������ ���Ǹ� ����
*/
#include <iostream>
#include <vector>


using namespace std;


int main()
{
  vector<int> ve;

  ve.push_back(10);
  ve.push_back(20);
  ve.push_back(30);
  ve.push_back(40);
  ve.push_back(50);


  // reverse_iterator�� ������ ����Ű�� ���� ���� �������� ���� ���̴�
  vector<int>::iterator normal_iter = ve.begin() + 4;
  vector<int>::reverse_iterator reverse_iter(normal_iter);

  cout << "normal: " << *normal_iter << endl;
  cout << "reverse: " << *reverse_iter << endl;
  cout << endl;




  for (vector<int>::iterator iter = ve.begin(); iter != normal_iter; ++iter)
  {
    cout << *iter << " ";
  }
  cout << endl;
	

  // --�����ڰ� �ƴ� ++�����ڸ����� ������ �� �־ reverse_iterator�� ���� ���Ҹ� ����Ű�� �����Ǿ���
  for (vector<int>::reverse_iterator riter = reverse_iter; riter != ve.rend(); ++riter)
  {
    cout << *riter << " ";
  }
  cout << endl;

}
