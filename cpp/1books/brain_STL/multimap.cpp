#include <iostream>
#include <map>

using namespace std;

int main()
{

	multimap<int, int> mm;


	mm.insert(pair<int, int>(5, 100));
	mm.insert(pair<int, int>(3, 100));
	mm.insert(pair<int, int>(8, 30));
	mm.insert(pair<int, int>(3, 40));
	mm.insert(pair<int, int>(1, 70));
	mm.insert(pair<int, int>(7, 100));
	mm.insert(pair<int, int>(8, 50));



	multimap<int, int>::iterator iter;

	for (iter = mm.begin(); iter != mm.end(); iter++)
	{
		cout << "(" << iter->first << ',' << iter->second << ")" << " ";
	}
	cout << endl;




	// count(3)�� ����մϴ�
	cout << "key 3 ������ ������ : " << mm.count(3) << endl;

		
	// find(3)�� ����մϴ�
	iter = mm.find(3);
	if (iter != mm.end())
	{
		cout << "ù��° key 3�� ���ε� value�� : " << iter->second << endl;
	}
	cout << endl;


	return 0;
}





















