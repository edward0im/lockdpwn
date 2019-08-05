/*
	c++ stl p448 functor ==> �Լ���ü(functor)�� �Լ� �����͸� ����غ� ���� �ڵ�
*/
#include <iostream>

using namespace std;



struct LessFunctor
{
	bool operator() (int left, int right) const  // const�� ������ָ� ���ٰ� �Ѵ�
	{
		return left < right;
	}
};



bool LessFun(int left, int right)
{
	return left < right;
}



int main()
{

	bool (*LessPtr)(int, int) = LessFun;  // �Լ� ������ ����
	LessFunctor lessFunctor;  // �Լ���ü ����


	cout << lessFunctor(10, 20) << endl;


	cout << LessFun(10, 20) << endl;


	cout << LessPtr(10, 20) << endl;


	return 0;
}






