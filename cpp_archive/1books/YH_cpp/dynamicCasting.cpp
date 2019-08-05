#include <iostream>


using namespace std;

// ����Ŭ����
class Car
{
private:
	int fuelGauge;

public:
	Car(int fuel) : fuelGauge(fuel)
	{}

	void showCarStatus()
	{
		cout << "fuel : " << fuelGauge << endl;
	}

};



// ����Ŭ����
class Truck : public Car
{
private:
	int frieghtWeight;

public:
	Truck(int fuel, int weight) : Car(fuel), frieghtWeight(weight)
	{}


	void showTruckStatus()
	{
		cout << "Weight : " << frieghtWeight << endl;
	}


};


// dynamic_cast�� �ǹ� : ��Ӱ��迡 �ִ� ����Ŭ������ ������ �� ������ �����͸� ���� Ŭ������ ������ �� ������ �����ͷ� �� ��ȯ�ϰڽ��ϴ�!
int main()
{
	Car* pcar1 = new Truck(80, 200);
	//	Truck* ptruck1 = dynamic_cast<Truck*>(pcar1);

	Car* pcar2 = new Car(120);
	//	Truck* ptruck2 = dynamic_cast<Truck*>(pcar2);


	Truck* ptruck3 = new Truck(70, 150);
	Car* pcar3 = dynamic_cast<Car*>(ptruck3);


	ptruck3->showCarStatus();
	ptruck3->showTruckStatus();

	cout << "----------------------------------" << endl;
	pcar3->showCarStatus();

	return 0;
}