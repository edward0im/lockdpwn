// 
#include <iostream>

namespace bestCom
{
  void simpleFunc();
}

namespace bestCom
{
  void prettyFunc();
}

namespace progCom
{
  void simpleFunc();
}

using namespace std;

int main()
{
  bestCom::simpleFunc();
  return 0;
}


void bestCom::simpleFunc()
{
  cout<<"bestCom�� ������ �Լ���: "<<endl;
  prettyFunc();

  progCom::simpleFunc();
}
