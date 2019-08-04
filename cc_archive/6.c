#include <stdio.h>

int isPrime(int n)
{
  // 1�� �Ҽ��� �ƴϹǷ� false�Դϴ�
  if (n == 1)
    return 0;

  // 2�� 3�� �Ҽ��̹Ƿ� true�Դϴ�
  else if (n == 2 || n == 3 || n == 5)
    return 1;

  // 2 or 3 or 5�� ����� �Ҽ��� �ƴϹǷ� false�Դϴ�
  else if (n % 2 == 0 || n % 3 == 0 || n % 5 == 0)
    return 0;

  //�� ��� ���ǿ� �ɸ��� ���� ���ڴ� �Ҽ��Դϴ�
  else
    return 1;
}

void main()
{
  int num = 0;
  int count = 0;

  // ���ϴ� ���ڸ� �ް�
  printf("[*] Enter a Number : ");
  scanf("%d", &num);

  // ������ ���鼭 �Է��� ���ں��� ���� �Ҽ��� ���� ����մϴ�
  for (; count <= num; count++)
  {
    if (isPrime(count))
    {
      printf("%d ", count);
    }
  }
  printf("\n");
}



