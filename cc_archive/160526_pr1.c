#include <stdio.h>
#define SIZE 3

int sang(float e, float E);


int main()
{
  int b, i, n = 200;
  float t,e,R = 3.8;
  float E =0;


  printf("b�ڱ���=");
  scanf("%d",&b);

  printf("t�ð�=");
  scanf("%f",&t);

  printf("e����������=");
  scanf("%f",&e);


  E = -n*R*(b/t);


  printf("���������� E = -%d X %.1f X (%d/%.2f) = %.1f\n",n,R,b,t,E);


  sang(e,E);
  
}


int sang(float e, float E)
{
  float sang = 0 ;

  sang = (e-E/E)*100;

  if(sang<0)
    sang = -sang;

  else
    sang = sang;

  printf("������ = | %.1f-(%.1f)/%.1f| X 100 = %.1f\n",e,E,E,sang);
  

}














