/*
	c++ stl p456 functor ==> plus<int>�� ����� ���� �ڵ�
*/
#include <iostream>
#include <functional>

using namespace std;

int main()
{
	plus<int> oPlus;

	// plus<int> �Լ� ��ü�� ����� ���� �ڵ�
	cout << oPlus(10, 20) << endl;
	cout << oPlus.operator()(10, 20) << endl;
	cout << plus<int>()(10, 20) << endl;
	cout << plus<int>().operator()(10, 20) << endl;

	return 0;
}
