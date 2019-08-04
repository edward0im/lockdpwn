/*
  clang project, Ư���� ���ڸ� �빮��ȭ <==> �ҹ���ȭ�ϴ� �ڵ�
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>


int strupr(char *);
int strlwr(char *);

int main()
{
    char string[256];

    memset(string, 0x00, sizeof(string));
    sprintf(string, "%s", "abc123defg");
    fprintf(stdout, "\"%s\"\n", string);


    // ����ڰ� ���� ���� �Լ���
    strupr(string);
    fprintf(stdout, "to upper:\"%s\"\n", string);


    strlwr(string);
    fprintf(stdout, "to lower:\"%s\"\n", string);



    return 0;
}


// �빮��ȭ
int strupr(char *str)
{
    int i=0;
    int len=0;
    len=strlen(str);


    for(i=0;i<len;i++)
    {
        *(str+i)=_toupper(*(str+i));
    }

    return i;
}



// �ҹ���ȭ
int strlwr(char *str)
{
    int i=0;
    int len=0;
    len=strlen(str);


    for(i=0;i<len;i++)
    {
        *(str+i)=_tolower(*(str+i));
    }

    return i;
}
