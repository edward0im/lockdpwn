#include <stdio.h>

int main(int argc, char *argv[])
{
	int  h, i, j, k, dan, col, row, begin, jun;

	putchar('\n');
	printf(" ���۴�: ");
	scanf("%d", &begin);
	printf(" ��ܾ�: ");
	scanf("%d", &col);
	printf(" ��  ��: ");
	scanf("%d", &dan);
	row = (dan - begin)/col + 1;
	i = 1;
	while( i<= row )
	{
		jun = i* col + begin;		
		h   =  jun - col ;		
		j    =  1;
		while ( j < 10 )			// j=�Ŵܸ���  �������� �� 1 ~ 9		
		{
			if( j ==1 )
			{
				putchar('\n');
				k=h;
		      		while ( k < jun  &&  k <= dan)
				{
					printf("    %2d ��      ", k);
					k++;
				}
				putchar('\n');
				k=h;
				while ( k < jun  &&  k <= dan)
				{
					printf(" ============= ");
					k++;
				}
				putchar('\n');
			}
			k=h;
			while ( k < jun  &&  k <= dan )
			{
				printf(" %2d * %2d = %3d ", k, j, k*j);
				k++;
			}
			putchar('\n');
			j++;
		}
		i++;
	}
	return 0;
}
