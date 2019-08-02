/*
  ���� �ڷᱸ�� p236 Stack�� ���� ǥ����� �̿��� ���� �����
  ����ǥ��� �˰���
 */

#include "ListBaseStack.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>


// �� �����ڵ��� �켱���� ���ϱ�
int getOpPrec(char op)
{
     switch(op)
     {
     case '*':
     case '/':
          return 5;
     case '+':
     case '-':
          return 3;
     case '(':
          return 1;
     }

     return -1;

          
}

// �켱������ ���� ���ϰ��� �����Ѵ�
int whoPrecOp(char op1,char op2)
{
     int op1Prec = getOpPrec(op1);
     int op2Prec = getOpPrec(op2);

     if(op1Prec > op2Prec)
     {
          return 1;
     }

     else if(op1Prec < op2Prec)
     {
          return -1;
     }

     else
     {
          return 0;
     }
          
}


// ���� ǥ����� (���� ����) ���� ǥ������� ��ȯ�ϴ� �˰���
void convToRPNExp(char exp[])
{
     Stack *stack;

     int expLen = strlen(exp);
     char *convExp = (char*)malloc(expLen + 1);
     
     int i, idx= 0;
     char tok, popOp;
     
     memset(convExp, 0, sizeof(char)*expLen+1);
     StackInit(&stack);

     for(i=0; i<expLen;i++)
     {
          tok = exp[i];
          if(isdigit(tok))
          {
               convExp[idx++] = tok;
          }
          else
          {
               switch(tok)
               {
               case '(':
                    SPush(&stack,tok);
                    break;


               case ')':
                    while(1)
                    {
                         popOp = SPop(&stack);
                         if(popOp == '(')
                         {
                              break;
                         }
                         convExp[idx++] = popOp;
                    }
                    break;
               case '+': case '-':
               case '*': case '/':
                    // �����ȣ���� whoPrecOp�� �̿��� �켱������ ���� ���ÿ� �ִ°��� �����⵵ �ϰ� �ֱ⵵ �Ѵ�
                    while(!SIsEmpty(&stack) && whoPrecOp(SPeek(&stack),tok) >= 0)
                         convExp[idx++] = SPop(&stack);

                    SPush(&stack,tok);
                    break;

                    
               }
          }
          
          
     }

 
     while(!SIsEmpty(&stack))
     {
          convExp[idx++] = SPop(&stack);
     }

     strcpy(exp,convExp);
     free(convExp);
     
}





