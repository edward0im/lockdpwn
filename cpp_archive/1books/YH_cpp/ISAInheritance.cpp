/*
	���� c++ IS A �� �̷��� ����� ���踦 ������ �ڵ� 
	~�� ~�� �����̴�
*/
#include "stdafx.h"
#include <iostream>



using namespace std;



class Computer
{
private:
	char owner[50];

public:
	Computer(char *name)
	{
		strcpy_s(owner,100,name);
	}

	void Calculate()
	{
		cout << "��û ������ ����մϴ�" << endl;
	}

};


class NotebookComp : public Computer
{
private:
	int Battery;

public:
	NotebookComp(char *name, int initChag)
		: Computer(name), Battery(initChag)
	{}

	void Charging() { Battery += 5; }
	
	
	void UseBattery() { Battery -= 1; }
	


	int GetBatteryInfo() { return Battery; }


	void MovingCal()
	{
		if (GetBatteryInfo() < 1)
		{
			cout << "������ �ʿ��մϴ�" << endl;
		}

		cout << "�̵��ϸ鼭 ";
		Calculate();
		UseBattery();
	}



};


class TableNoteBook : public NotebookComp
{

private:
	char regstPenModel[50];

public:
	TableNoteBook(char *name, int initChag, char *pen)
		:NotebookComp(name, initChag)
	{
		strcpy_s(regstPenModel, 100, pen);
	}


	void Write(char *penInfo)
	{
		if (GetBatteryInfo() < 1)
		{
			cout << "������ �ʿ��մϴ�" << endl;
			return;
		}

		if (strcmp(regstPenModel, penInfo) != 0)
		{
			cout << "��ϵ� ���� �ƴմϴ�";
			return;
		}
		
		cout << "�ʱ� ������ ó���մϴ�" << endl;
		UseBattery(); 

	}




};



int main()
{
	NotebookComp nc("�ӱԹ�", 5);
	TableNoteBook tn("edward", 5, "hello");
	nc.MovingCal();
	tn.Write("hello");

	return 0;
}






