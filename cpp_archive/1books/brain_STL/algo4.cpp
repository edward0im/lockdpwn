/*
  c++ stl p150 vector �����̳ʸ� �̿��� stack ����͸� ������ �ڵ�
 */
#include <iostream>
#include <vector>
#include <stack>

using namespace std;


int main()
{
  stack<int , vector<int> > st;   // vector�� �̿��� ������ stack �����

  // stack<int> st;
  
  st.push(10);
  st.push(20);
  st.push(30);

  cout<< st.top() << endl;
  st.pop();

  cout<< st.top()<<endl;
  st.pop();

  cout<< st.top()<<endl;
  st.pop();

  if(st.empty())
  {
    cout<< "NO DATA" <<endl;
  }

  return 0;

  
}
