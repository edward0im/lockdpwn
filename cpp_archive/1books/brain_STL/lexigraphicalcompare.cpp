/*
  c++ stl p320 algo ==> lexicographical_compare() �˰����� ����� �� ���� ��ü���� ���Ҹ� ������� ���ϴ� ���� �ڵ�
 */
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
    vector<int> v1;

    v1.push_back(10);
    v1.push_back(20);
    v1.push_back(30);

    vector<int> v2;

    v2.push_back(10);
    v2.push_back(20);
    v2.push_back(50);

    vector<int> v3;

    v3.push_back(10);
    v3.push_back(20);
    v3.push_back(30);

    // lexicographical_compare() �˰����� ����� �� ���Ͱ�ü���� ���Ҹ� �������� ���մϴ�
    if(lexicographical_compare(v1.begin(), v1.end(), v2.begin(), v2.end()))
    {
        cout << "v1 < v2" << endl;
    }

    else
    {
        cout << "v1 >= v2" <<endl;
    }

    if (lexicographical_compare(v1.begin(), v1.end(), v3.begin(),v3.end()))
    {
        cout << "v1 < v3" <<endl;
    }
    else
    {
        cout << "v1 >= v3" << endl;
    }

    return 0;
}
