#include <stdio.h>
#include <ctype.h>
 
void Reverse(char s[]);
 
void main()
{
    char s[100] = { 0 };
    char c;
    int count = 0;
 
    printf("Please Enter a Sentence : ");
 
 
    // Enter�� �Է��� ������ ������ �Է��ؼ� s�� �����մϴ�
    for (; (c = getchar()) != '\n';)  
    {
        s[count] = c;
        count++;
    }
    
 
    Reverse(s);   
 
    printf("Reversed Sentence is : %s\n", s);
 
}
void Power(int i)

void Reverse(char s[])
{
    char* p;
    char q[100] = { 0 };
    int count = 0;
    int count2 = 0;
 
    p = s;  // p �����ʹ� ���ڿ� (s)�� ����ŵ�ϴ�
    
 
    // ���ڿ� ������ count�� ������Ų ����
    for (count = 0; p[count] != '\0';)
        count++;
    
 
 
    // count�� �����ϸ鼭  q�� ���ڿ��� �Ųٷ� �ְ�
    for (count-- ; count >= 0; count--)
    {
        q[count2] = p[count];
        count2++;
    }
 
 
    // ���������� s�� �Ųٷ� �Էµ� ���ڸ� �Է��Ѵ� 
    for (count = 0; q[count] != '\0' ;count++)
        s[count] = q[count];
 
}
