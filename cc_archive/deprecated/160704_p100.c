#include <stdio.h>


int arrSum(int* arr, int arrLen);



void main()
{
  int arr1[3] = {5,10,15};
  int arr2[5] = {1,2,3,4,5};


  int sumOfArrResult;

  sumOfArrResult = arrSum(arr1,sizeof(arr1)/sizeof(int));
  printf("arr1 �迭�� ���� %d\n", sumOfArrResult);
  
  sumOfArrResult = arrSum(arr2,sizeof(arr2)/sizeof(int));
  printf("arr2 �迭�� ���� %d\n",sumOfArrResult);

  
}



int arrSum(int* arr, int arrLen)
{
  int sum = 0;
  int i =0;

  for(i; i<arrLen;i++)
  {
    sum = sum + arr[i];
  }

  return sum;
  
  
  /* �̷��� ���ϴ� �͵� ������
  while(1)
  {
    if(arr[i] == 0)
      break;


    i++;
    
    if(i>100)
      break;
  }
  */
  
  
}
