/*
	���� c++ p186 private ������, ��� �̴ϼȶ�����
*/
#include "stdafx.h"
#include <iostream>


using namespace std;



class AAA
{
private:
	int num;

// ������ <---> ��� �̴ϼȶ����� ������ �˾Ƴ���!
public:
	AAA() : num(0) {}				   // ���⼭ :num(0)�� ��� �̴ϼȶ�����
	AAA& CreateInitObj(int n) const
	{
		AAA *ptr = new AAA(n);
		return *ptr;
	}


	void ShowNum() const { cout << num << endl; }


private:
	AAA(int n) : num(n) {}
	
};


int main()
{
	AAA base;
	base.ShowNum();


	AAA &obj1 = base.CreateInitObj(3);
	obj1.ShowNum();

	AAA &obj2 = base.CreateInitObj(12);
	obj2.ShowNum();


	printf("Deleting... \n");

	delete &obj1;
	printf("Complete!\n");

	delete &obj2;
	printf("Complete!\n");

	return 0;
}