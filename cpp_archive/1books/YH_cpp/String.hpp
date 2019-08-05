#ifndef __STRING_H__
#define __STRING_H__

#include "BackingCommonDecl.hpp"
// string Ŭ������ �۰Գ��� �����غ� String Ŭ����
class String
{
 private:
  int len;
  char *str;

 public:
  // ������
  String();
  String(const char* s);
  String(const String& s);
  // �Ҹ���
  ~String();

  // ������ �����ε�
  String& operator=(const String& s);
  String& operator+=(const String& s);
  bool operator==(const String& s);
  String operator+ (const String& s);

  // ģ���Լ��� ����
  friend ostream& operator<<(ostream& os, const String& s);
  friend istream& operator>>(istream& is, String& s);
};

#endif
