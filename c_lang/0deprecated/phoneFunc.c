/*
  Name : phoneFunc.c ver 1.4
  Content : ��ȭ��ȣ ��Ʈ�� �Լ�
  Implementation : LKB
  Last modified 2016/07/06
*/
#include "common.h"
#include "phoneData.h"
#include "screenOut.h"

#define LIST_NUM 100

int numOfData = 0;
phoneData *phoneList[LIST_NUM];

char name[LIST_NUM];
int j =1 ;

void InputPhoneData()
{
  phoneData *pData;
  
  if(numOfData >= LIST_NUM)
  {
    puts("[-] �޸� ������ �����մϴ�");
    return;
  }

  pData = (phoneData*)malloc(sizeof(phoneData));

  printf("�̸� �Է�: ");
  scanf("%s",pData->name);

  printf("��ȭ��ȣ �Է�: ");
  scanf("%s",pData->phoneNum);

  if(checkSameData(pData) == 1)
  {
    printf("\n[-] �̹� �Էµ� �������Դϴ�.\n");
    free(pData);
    return;
  }

  printf("\n[*] �Է��� �Ϸ�ƽ��ϴ�.\n");

  phoneList[numOfData] = pData;
  numOfData++;
  storeDataToFile();
  storeDataToFileInStruct();
  
}

void ShowAllData()
{
  for(int i=0; i<numOfData;i++)
    ShowPhoneInfoByPtr(phoneList[i]);
}


void SearchPhoneData()
{
  printf("ã�� �˻�� �Է����ּ��� : ");
  scanf("%s",name);

  for(int i =0; i<numOfData ; i++)
  {
    // ���ڿ��� strcmp�� ���� �� �ִ�
    if(strcmp(name,phoneList[i]->name) == 0)
    {
      ShowPhoneInfoByPtr(phoneList[i]);
    }
  }
  printf("\n[*] �˻��� �Ϸ�Ǿ����ϴ�\n");
}


void DeletePhoneData()
{
  int num = 0;
  int numFlag =0;
  printf("���� �˻�� �Է����ּ��� : ");
  scanf("%s",name);
  int j=1;

  // �̸��� ���� �������� ������ ����
  for(int i =0; i<numOfData ; i++)
  {
    if(strcmp(name,phoneList[i]->name) == 0)
    {
      num++;
    }
  }

  // ���� ��ġ�ϴ� �̸��� �Ѱ���
  if (num ==1)
  {
    for(int i =0; i<numOfData ; i++)
    {
      // ���� �̸��� ���ٸ�
      if(strcmp(name,phoneList[i]->name) == 0)
      {
        // �޸� ������ �Ҵ�޾����Ƿ� �ٽ� ��ȯ�ؾ� �Ѵܴ�..o_o
        free(phoneList[i]);
      
        // i+1�� ������ ���� ���������� ������ ��ĭ�� ������ ����
        while(i+1 <= numOfData)
        {
          phoneList[i] = phoneList[i+1];
          i++;
        }
      }
    }
  }
  
  // ���� ��ġ�ϴ� �̸��� �ΰ� �̻��̸�
  else if(num >1)
  {
    printf("\n[*] ã�� �̸��� 2�� �̻��Դϴ�\n");

    for(int i = 0 ; i < numOfData ; i++)
    {
      if(strcmp(name,phoneList[i]->name) == 0)
      {
        printf("NUM. %d\n",j);
        ShowPhoneInfoByPtr(phoneList[i]);
        j++;
      }
    }

    printf("���ϴ� ��ȣ�� �����ϼ���: ");
    scanf("%d",&numFlag);
  }

  // �ٽ� j�� 1�� �ʱ�ȭ���ѳ���
  j = 1;
  
  for(int i=0; i<numOfData;i++)
  {
    if(strcmp(name,phoneList[i]->name) == 0)
    {
        
      if(numFlag == j)
      {
        free(phoneList[i]);
      
        // [���� ����] i+1�� ������ ���� ���������� ������ ��ĭ�� ������ ����
        while(i+1 <= numOfData)
        {
          phoneList[i] = phoneList[i+1];
          i++;
        }
        printf("\n[*] ������ �Ϸ�Ǿ����ϴ�\n");
      }
      j++;
    }
  }
  
  numOfData--;

  storeDataToFile();
  storeDataToFileInStruct();
  
}

// ���� �̸�, ��ȭ��ȣ�� �ִ��� Ȯ�����ִ� �Լ�
int checkSameData(phoneData *pPhone)
{
  if(numOfData == 0)
  {
    return 0;
  }
  
  for(int i=0; i<numOfData ;i++)
  {
    // �̸��� ��ȭ��ȣ�� ������ 1 ��ȯ
    if(strcmp(pPhone->name,phoneList[i]->name) == 0 && strcmp(pPhone->phoneNum,phoneList[i]->phoneNum)==0)
    {
      return 1;
    }
  }

  return 0;
}

void changePhoneData()
{
  int idxOfMatchingData[LIST_NUM];
  int matchedCount = 0;
  int selection = 0;
  int changeIdx =0;

  char changeName[NAME_LEN];
  char changeNum[PHONE_LEN];
  
  fputs("ã�� �̸���? : ",stdout);
  scanf("%s",changeName);
  
  for(int i=0; i<numOfData ;i++)
  {
    if (strcmp(changeName,phoneList[i]->name) == 0)
    {
      idxOfMatchingData[matchedCount++] = i;
    }
  }

  if(matchedCount == 0)
  {
    fputs("\n[-] ã�� �̸��� �����ϴ�!\n",stdout);
    return;
  }
  else if(matchedCount==1)
  {
    changeIdx = idxOfMatchingData[0];
  }
  else
  {
    for(int i=0; i<matchedCount; i++)
    {
      printf("NUM. %d\n",i+1);
      ShowPhoneInfoByPtr(phoneList[idxOfMatchingData[i]]);
    }

    fputs("���� : ",stdout);
    scanf("%d",&selection);
    fflush(stdin);

    changeIdx = idxOfMatchingData[selection-1];
  }


  fputs("������ ��ȭ��ȣ��? : ",stdout);
  scanf("%s",changeNum);

  strcpy(phoneList[changeIdx]->phoneNum,changeNum);

  printf("\n[*] ������ �Ϸ�ƽ��ϴ�\n");

  storeDataToFile();
  storeDataToFileInStruct();
}

void storeDataToFile()
{
  FILE *fp = fopen("phoneNum.txt","w");

  fwrite(&numOfData, sizeof(int),1,fp); // �������� �� ����

  for(int i=0; i<numOfData;i++)
  {
    fprintf(fp,"%s\n%s\n",phoneList[i]->name,phoneList[i]->phoneNum);
    free(phoneList[i]);
  }
 
  fclose(fp);
  
  /*
  if(fp == NULL)
  {
    return;
  }

  
  for(int i =0;i<numOfData;i++)
  {
      fprintf(fp,"%s\n%s\n",phoneList[i]->name,phoneList[i]->phoneNum);
  }
  */
}


void loadDataFromFile()
{
  FILE *fp = fopen("phoneNum.txt","r");
  
  
  if(fp == NULL)
  {
    return;
  }

  fread(&numOfData,sizeof(int),1,fp);

  for(int i =0; i<numOfData;i++)
  {
    
    phoneList[i] = (phoneData*)malloc(sizeof(phoneData));

    fscanf(fp,"%s\n%s\n",phoneList[i]->name,phoneList[i]->phoneNum);

  }

  fclose(fp);
  
  /*
    for(int i =0;;i++)
    {

    // ��.. �̰Ͷ����� ����� ���ž�.. ��_��
    phoneList[i] = (phoneData*)malloc(sizeof(phoneData));
    
    if(feof(fp) != 0)
    {
    numOfData = i;
    break;
    }
    
    fscanf(fp,"%s\n%s\n",phoneList[i]->name,phoneList[i]->phoneNum);
    }
  */

}

void storeDataToFileInStruct()
{
  
}

void loadDataFromFileInStruct()
{
  
}

/* end of file */
