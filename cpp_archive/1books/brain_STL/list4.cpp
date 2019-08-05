/*
  c++ stl p232 list ==> splice() �� �ٸ� 2���� ���� ���� �ڵ�  splice(iter,lt2,iter2)  ,  splice(lt.begin(), lt2, lt2.begin(), lt2.end())
*/
#include <iostream>
#include <list>

using namespace std;



int main()
{
  list<int> lt;
  list<int> lt2;

  
  lt.push_back(10);
  lt.push_back(20);
  lt.push_back(30);
  lt.push_back(40);
  lt.push_back(50);

  lt2.push_back(111);
  lt2.push_back(222);
  lt2.push_back(333);
  lt2.push_back(444);
  lt2.push_back(555);


  
  list<int>::iterator iter;
  list<int>::iterator iter2;

  
  cout<<"lt: " ;
   
  for(iter = lt.begin(); iter != lt.end() ; iter++)
  {
    cout<< *iter <<' ';
  }
  cout << endl;


  cout<<"lt2: " ;
   
  for(iter2 = lt2.begin(); iter2 != lt2.end() ; iter2++)
  {
    cout<< *iter2 <<' ';
  }
   cout<<endl <<"==================================="<< endl;


  
  iter = lt.begin();
  ++iter;
  ++iter;

  iter2 = lt2.begin();
  ++iter2;

  lt.splice(iter,lt2,iter2);  // splice() version1 : iter2�� ����Ű�� lt2 ���Ҹ� iter�� ����Ű�� lt ��ü�� �߶���Դϴ�
  




  cout<<"lt: " ;
   
  for(iter = lt.begin(); iter != lt.end() ; iter++)
  {
    cout<< *iter <<' ';
  }
  cout << endl;


  cout<<"lt2: " ;

  for(iter2 = lt2.begin(); iter2 != lt2.end() ; iter2++)
  {
    cout<< *iter2 <<' ';
  }
  cout<<endl <<"==================================="<< endl;




  lt.splice(lt.begin(), lt2,lt2.begin(),lt2.end());   // splice() version2 : lt.begin() ��ġ�� lt2�� ��� ���Ҹ� �߶���Դϴ�



  
  cout<<"lt: " ;
   
  for(iter = lt.begin(); iter != lt.end() ; iter++)
  {
    cout<< *iter <<' ' ;
  }
  cout << endl;


  cout<<"lt2: " ;
   
  for(iter2 = lt2.begin(); iter2 != lt2.end() ; iter2++)
  {
    cout<< *iter2 <<' ' ;
  }
  cout<<endl <<"==================================="<< endl;
  
  return 0;
}
