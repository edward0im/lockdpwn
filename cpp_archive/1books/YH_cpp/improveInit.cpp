/*
	���� c++ p454 ������, ���������, ���Կ������� ��� ���Ǵ��� �����ִ� �ڵ�
*/
#include "stdafx.h"
#include <iostream>


using namespace std;


class AAA
{
private:
	int num;

public:
	AAA(int n = 0) :num(n)		// ������
	{
		cout << "AAA(int n =0) CALLED" << endl;
	}

	AAA(const AAA& ref) : num(ref.num)			// ���� ������
	{
		cout << "AAA(const AAA& ref) CALLED" << endl;
	}

	AAA& operator=(const AAA& ref)		// ���Կ�����
	{
		num = ref.num;
		cout << "operator= CALLED" << endl;
		return *this;
	}
};


class BBB
{
private:
	AAA edward;

public:
	BBB(const AAA& ref) : edward(ref)
	{}

};


class CCC
{
private:
	AAA edward2;

public:

	// AAA& ref�� ���� ������Ű�� operator= ��  �ԷµǴ� ��Ŀ�����ε�
	CCC(const AAA& ref)
	{
		edward2 = ref;
	}
};


int main()
{
	AAA obj1(12);

	cout << "********************************" << endl;;

	BBB obj2(obj1);

	cout << "********************************" << endl;

	CCC obj3(obj1);

	return 0;
}