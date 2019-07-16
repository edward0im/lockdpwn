#include <iostream>
#include "zone.h"

using namespace std;

//��ȣ�� �˻� �ÿ� ����� Ŭ���� ����
class SearchByNumFun  :public Search
{
  int num;
 public:
  SearchByNumFun(int _num){num = _num;}
  virtual bool operator()(Member *mem)
  {
    return mem->GetNum() == num;
  }
};


//�̸����� �˻� �ÿ� ����� Ŭ���� ����
class SearchByNameFun  :public Search
{
  string name;
 public:
  SearchByNameFuna(string _name){name = _name;}
  virtual bool operator()(Member *mem)
  {
    return mem->GetName() == name;
  }
};


//��ȣ ������ ���� �ÿ� ���� ����� ���ϱ� ���� �����ϴ� Ŭ���� ����
class CompareByNumFun  :public Compare
{
 public:
  virtual int operator()(Member *mem1,Member *mem2)
  {
    return mem1->GetNum() - mem2->GetNum();
  }
};



//�̸� ������ ���� �ÿ� ���� ����� ���ϱ� ���� �����ϴ� Ŭ���� ����
class CompareByNameFun
    :public Compare
{
 public:
  virtual int operator()(Member *mem1,Member *mem2)
  {
    string n1 = mem1->GetName();
    string n2 = mem2->GetName();
    return strcmp(n1.c_str(),n2.c_str());
  }
};



//��ü ȸ���� ������ ���������� �����ֱ� ���� ���� ����� �����ֱ� ���� �����ϴ� Ŭ���� ����
class ViewMember
    :public DoSomething
{
 public:
  virtual void operator()(Member *mem)
  {
    cout<<mem;
  }
};



//��ü ȸ���� ����ȭ �ϱ� ���� ���� ����� �����ϱ� ���� �����ϴ� Ŭ���� ����
class DeleteMember
    :public DoSomething
{
 public:
  virtual void operator()(Member *mem)
  {
    delete mem;
  }
};


Zone::Zone(void)
{
  Init();
}

Zone::~Zone(void)
{
  Exit();
}

void Zone::Init()
{
  cout<<"�ִ� ������ ȸ�� ���� �Է��ϼ���"<<endl;
  int max_member = MyGlobal::GetNum();
  collection = new Collection(max_member);
}

void Zone::Exit()
{
  DeleteAll();
  delete collection;
}

void Zone::DeleteAll()
{
  //ȸ�� ��ü�� �Ҹ��ϱ� ���� �Լ� ��ü
  DeleteMember dm;
  //collection ��ü�� ListView���� dm �Լ� ��ü�� ���� ���������� ��� ȸ���� �Ҹ��Ŵ
  collection->ListAll(dm);
  //void Zone::ListAll()�� ������ ���� ������.
}

void Zone::Run()
{
  MyGlobal::KeyData key;
  while((key = SelectMenu())!=MyGlobal::ESC)
  {
    switch(key)
    {
      case MyGlobal::F1: AddMember(); break;
      case MyGlobal::F2: DelMember(); break;
      case MyGlobal::F3: SearchByNumber(); break;
      case MyGlobal::F4: SearchByName(); break;
      case MyGlobal::F5: SortByNumber(); break;
      case MyGlobal::F6: SortByName(); break;
      case MyGlobal::F7: ListAll(); break;
      default: cout<<"�߸��� �޴��� �����Ͽ����ϴ�."<<endl; break;
    }
    cout<<"�ƹ�Ű�� ��������"<<endl;
    MyGlobal::GetKey();
  }
}

MyGlobal::KeyData Zone::SelectMenu()
{
  system("cls");
  cout<<"[F1]: ȸ�� �߰� [F2]: ȸ�� ����"<<endl;
  cout<<"[F3]: ��ȣ�� ȸ�� �˻�[F4]: �̸����� ȸ�� �˻�"<<endl;
  cout<<"[F5]: ��ȣ������ ����[F6]: �̸������� ����"<<endl;
  cout<<"[F7]: ��ü ����"<<endl;
  cout<<"[ESC]: ���α׷� ����"<<endl;
  return MyGlobal::GetKey();
}

void Zone::AddMember()
{
  cout<<"ȸ�� �߰� ����Դϴ�."<<endl;
  if(collection->IsFull())
  {
    cout<<"�� �̻� ȸ���� �߰��� �� �����ϴ�."<<endl;
    return;
  }

  cout<<"�߰��� ȸ���� ��ȣ�� �Է��ϼ���"<<endl;
  int num = MyGlobal::GetNum();

  //��ȣ�� ������ ȸ���� ���ϱ� ���� �Լ� ��ü ����
  SearchByNumFun sbn(num);
  //collection�� FindMember���� �Լ� ��ü�� ���� ���ϴ� ȸ���� �˻��� ��
  if(collection->FindMember(sbn))
  {
    cout<<"�̹� �����ϴ� ȸ�� ��ȣ�Դϴ�."<<endl;
    return;
  }

  cout<<num<<"�� ȸ���� �̸��� �Է��ϼ���"<<endl;
  string name = MyGlobal::GetStr();

  if(collection->Push(new Member(num,name)))
  {
    cout<<"���������� �߰��Ͽ����ϴ�."<<endl;
  }
  else
  {
    cout<<"���������� ������ �߻��Ͽ����ϴ�."<<endl;
  }
}

void Zone::DelMember()
{
  cout<<"ȸ�� ���� ����Դϴ�."<<endl;
  int count = collection->GetCount();
  if(count == 0)
  {
    cout<<"������ ȸ���� �����ϴ�."<<endl;
    return;
  }

  cout<<"������ ȸ�� ��ȣ�� �Է��ϼ���"<<endl;
  int num = MyGlobal::GetNum();
  //��ȣ�� ������ ȸ���� ���ϱ� ���� �Լ� ��ü ����
  SearchByNumFun sbn(num);
  //collection�� GetMember���� �Լ� ��ü�� ���� ���ϴ� ȸ���� ������
  Member *mem = collection->GetMember(sbn);
  if(mem == 0)
  {
    cout<<"�߸��� ��ȣ�� �Է��Ͽ����ϴ�."<<endl;
    return;
  }

  cout<<mem<<endl;
  cout<<"ȸ���� �����ϰڽ��ϴ�."<<endl;
  delete mem;

}



void Zone::SearchByNumber()
{
  cout<<"��ȣ�� ȸ�� �˻� ����Դϴ�."<<endl;
  int count = collection->GetCount();
  if(count == 0)
  {
    cout<<"������ ȸ���� �����ϴ�."<<endl;return;
  }
  cout<<"�˻��� ȸ�� ��ȣ�� �Է��ϼ���"<<1<<"~"<<count<<endl;
  int num = MyGlobal::GetNum();
  SearchByNumFun sbn(num);
  Member *mem = collection->FindMember(sbn);
  if(mem == 0)
  {
    cout<<"�߸��� ��ȣ�� �Է��Ͽ����ϴ�."<<endl;return;
  }
  cout<<mem<<endl;
}
void Zone::SearchByName()
{
  cout<<"�̸����� ȸ�� �˻� ����Դϴ�."<<endl;
  int count = collection->GetCount();
  if(count == 0)
  {
    cout<<"������ ȸ���̾����ϴ�."<<endl;return;
  }
  cout<<"�˻��� ȸ�� �̸��� �Է��ϼ���"<<endl;
  string name = MyGlobal::GetStr();
  SearchByNameFun sbn(name);
  Member *mem = collection->FindMember(sbn);
  if(mem == 0)
  {
    cout<<"�������� �ʴ� ȸ�� �̸� �Դϴ�."<<endl;return;
  }
  cout<<mem<<endl;
}

void Zone::SortByNumber()
{
  //��ȣ ������ ���Ŀ� �ʿ��� ȸ�� ��ȣ�� ���ϴ� �Լ� ��ü ����
  CompareByNumFun cn;
  //colletion�� Sort �޼��忡���� ���޹��� �Լ� ��ü�� �̿��Ͽ� ����
  collection->Sort(cn);
  ListAll();
}
void Zone::SortByName()
{
  //�̸� ������ ���Ŀ� �ʿ��� ȸ�� ��ȣ�� ���ϴ� �Լ� ��ü ����
  CompareByNameFun cn;
  //colletion�� Sort �޼��忡���� ���޹��� �Լ� ��ü�� �̿��Ͽ� ����
  collection->Sort(cn);
  ListAll();
}
void Zone::ListAll()
{
  //ȸ�� ������ �����ֱ� ���� �Լ� ��ü ����
  ViewMember vm;
  //collection�� ListAll������ vm�� �̿��Ͽ� ȸ������ ������ ������
  collection->ListAll(vm);
}
