/*
  c++ ==> ���� c++ p644 ������ �߻�Ŭ�������� ����ȯ dynamic_cast�� ����
          dynamic_cast<...> �� ���� ����ȯ�� �� �� �ִ�. ����Ŭ���� -> ����Ŭ������
          ������ �߻�Ŭ������ �����ϸ� ���� -> ������ �����ϴ�
*/
#include <iostream>

using namespace std;

// ����Ŭ���� (virtual �Լ��� �����Ƿ� �߻�Ŭ�����̴�)
class edward
{
 public:
  virtual void showSimpleInfo()
  {
    cout << "Edward Base class" << endl;
  }
};


// ����Ŭ����
class ashely : public edward
{
 public:
  void showSimpleInfo()
  {
    cout << "Ashely Derived class" << endl;
  }
};

int main()
{
  edward *ed = new ashely;   // ed�� ashely ��ü�� ����Ű�� edward �����ͺ����̴�!
  ashely* ash = dynamic_cast<ashely*>(ed);     // edward Ŭ������ �߻�Ŭ�����̹Ƿ� ������ ���� ���� -> ������ ����ȯ�� �����ϴ�

  ash->showSimpleInfo();

  return 0;
}

