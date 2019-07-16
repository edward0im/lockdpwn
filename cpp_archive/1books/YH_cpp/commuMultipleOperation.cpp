/*
	���� c++ p428 ������ �����ε� �� ��ȯ��Ģ�� ������ ������ �ڵ� ex) 3*pos == pos*3 
*/
#include "stdafx.h"
#include <iostream>



using namespace std;


class pointEdward
{
private:
	int xpos, ypos;


public:
	pointEdward(int x = 0, int y = 0) : xpos(x), ypos(y)
	{}

	void showPosition() const
	{
		cout << xpos << "," << ypos << endl;
	}

	pointEdward operator*(int times)
	{
		pointEdward pos(xpos*times, ypos*times);

		return pos;
	}

	friend pointEdward operator*(int times, pointEdward& ref);

};



// ��ȯ��Ģ ������ ���� �߰��� �ڵ�!   ex) 3*pos == pos*3
pointEdward operator*(int times, pointEdward &ref)
{
	return ref*times;
}


int main()
{
	pointEdward pos(1, 2);
	pointEdward cpy;


	cpy = 3 * pos;
	cpy.showPosition();

	cpy = 2 * pos * 3;
	cpy.showPosition();


	return 0;
}