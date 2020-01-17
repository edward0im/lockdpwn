#include <stdio.h>

// strtoken() �Լ� ����

char* StringTokenize(char * str, char *delim);

void main()
{
  char str[] = "111-2222-3333";
  char * delim= "-";
  char * token;

  token = StringTokenize(str,delim);

  while(token!=NULL)
  {
    puts(token);
    token = StringTokenize(NULL,delim);
  }
  
}


char* StringTokenize(char * str, char *delim)
{
  static char* nextTokenPos;
  char * curTokenPos;
  char * curStrPos;


  if(str!=NULL)
  {
    curTokenPos = str;
    curStrPos = str;
    nextTokenPos = (char*)-1;
  }
  else
  {
    curTokenPos = nextTokenPos;
    curStrPos = nextTokenPos;
  }

  if(nextTokenPos==NULL)  // ���ڿ� �� ������ �˻��Ѵ�
    return NULL;

  
 while(1)
 {
   if(*curStrPos ==0) // ���ڿ��� ���� �˻��Ѵ�
   {
     nextTokenPos = NULL;
     break;
   }

   if(*curStrPos == delim[0]) // ��ū ���� ���ڸ� �߰��Ѵ�
   {
     *curStrPos = 0;
     nextTokenPos = curStrPos +1;
     break;
   }

   curStrPos++;
 }

  return curTokenPos;

  
}
