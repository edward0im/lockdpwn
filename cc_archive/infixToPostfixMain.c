/*
  �ڷᱸ�� p237 ����ǥ��� -> ����ǥ������� ��ȯ�ϴ� main �Լ�  
*/

#include <stdio.h>
#include "infixToPostfix.h"

void main()
{
     char exp1[] = "1+2*3";
     char exp2[] = "(1+2)*3";
     char exp3[] = "((1-2)+3)*(5-2)";


     convToRPNExp(exp1);
     convToRPNExp(exp2);
     convToRPNExp(exp3);

     printf("%s \n",exp1);
     printf("%s \n",exp2);
     printf("%s \n",exp3);
     
}
