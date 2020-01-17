#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_NUM 5
#define EXT_SIZE 5


int ExtendMemForString(char **pStr, int strLen);
char *ReadString(void);
void SortString(char *strArr[STR_NUM]);


void main()
{
  char *strArr[STR_NUM];
  int i;

  for(i=0; i<STR_NUM; i++)
  {
    printf("���ڿ� �Է� %d : ",i+1);
    strArr[i] = ReadString();
  }

  SortString(strArr);

  for(i=0; i<STR_NUM ; i++)
    puts(strArr[i]);


  for(i=0; i<STR_NUM;i++)
    free(strArr[i]);

    
}


int ExtendMemForString(char **pStr, int strLen)
{
  int i;
  char *newStrPtr;

  newStrPtr = (char*)malloc(sizeof(char)*(strLen+EXT_SIZE));
  if(newStrPtr == NULL)
    return -1;

  for(i=0; i<strLen ; i++)
    newStrPtr[i] = (*pStr)[i];


  free(*pStr);
  *pStr = newStrPtr;
  
  return strLen+EXT_SIZE;
    
}


// ���ڿ��� �д� �Լ�
char *ReadString(void)
{

  int maxStrLen = 10;
  char *str = (char*)malloc(sizeof(char)*maxStrLen);
  int idx = 0;

  while(1)
  {
    if(idx>=maxStrLen)
      maxStrLen = ExtendMemForString(&str,maxStrLen);
  

    str[idx] = getchar();

    if(str[idx] == '\n')
    {
      str[idx] =0;
      break;
    }

    idx++;
  }

  return str;
}


// ���ڿ��� �����ϴ� �Լ�
void SortString(char *strArr[STR_NUM])
{
  int i,j;
  char *tempStr;

  /* ���ڿ� ���Ĺ�� : ���� �˰��� */
  for(i=0; i<STR_NUM-1;i++)
  {
    for(j=0; j<(STR_NUM-i)-1; j++)
    {
      if(strlen(strArr[j]) > strlen(strArr[j+1]))
      {
        tempStr = strArr[j];
        strArr[j] = strArr[j+1];
        strArr[j+1] = tempStr;
      }
    }
  }  
}
