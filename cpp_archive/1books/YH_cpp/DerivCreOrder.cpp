/*
	���� c++ ��ӿ� ���� ���� �� ����Ŭ������ ����Ŭ������ ���� ����!
*/
#include "stdafx.h"
#include <iostream>


using namespace std;


// ���� Ŭ����
class SoBase
{
private:
	int baseNum;

public:
	SoBase() : baseNum(123)
	{
		cout << "SoBase()" << endl;
	}


	SoBase(int n) :baseNum(n)
	{
		cout << "SoBase(int n)" << endl;
	}

	void ShowBaseData()
	{
		cout << baseNum << endl;
	}
};


// ���� Ŭ����
class SoDerived : public SoBase
{
private:
	int derivNum;


public:
	SoDerived() : derivNum(456)
	{
		cout << "SoDeriv()" << endl;
	}


	SoDerived(int n) : derivNum(n)
	{
		cout << "SoDerived(int n)" << endl;
	}


	SoDerived(int n1, int n2) : SoBase(n1), derivNum(n2)
	{
		cout << "SoDerived(int n1,int n2)" << endl;
	}

	void ShowDerivData()
	{
		ShowBaseData();
		cout << derivNum << endl;
	}

};




int main()
{
	cout << "case1..." << endl;
	SoDerived dr1;
	dr1.ShowDerivData();

	cout << "-----------------------------" << endl;
	
	cout << "case2..." << endl;
	SoDerived dr2(12);
	dr2.ShowDerivData();


	cout << "-----------------------------" << endl;

	SoDerived dr3(23, 24);
	dr3.ShowDerivData();
	
	
	return 0;


}
