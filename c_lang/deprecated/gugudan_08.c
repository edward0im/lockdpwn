#include <stdio.h>
#include <stdlib.h>
#include <windows.h> 

int main(int argc, char *argv[])
{
	int i, j, h, dan, col, row, begin;

	printf(" ���۴�: ");  scanf("%d", &begin);
	printf(" ��ܾ�: "); scanf("%d", &col);
	printf(" ��  ��: "); scanf("%d", &dan);

	if ( col > 5 )
		system("mode con cols=130");

	row = (dan - begin)/col + 1;
	for(i = 1 ;i <= row ; i++)
	{
		//   int jun = i* col + begin;  //for���� ���ۺκа� ���Ǻο� �־ �ڵ带
		for(j=1;j<10;j++)       		//���� ���ĵǾ� ���̰� �� �� �ֽ��ϴ�.
		{
			if(j==1)
			{
				putchar('\n');
				SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),12);
				for( h= i * col + begin - col ; ( h < i * col + begin ) && ( h <= dan) ; h++)
					printf("   < %2d �� >   ", h);
				putchar('\n');
				for( h= i * col + begin - col ; ( h < i * col + begin ) && ( h <= dan) ; h++)
					printf(" ============= ");
				putchar('\n');
				SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),15);
			}
			for( h= i * col + begin - col ; ( h < i * col + begin ) && ( h <= dan) ; h++)
				printf(" %2d * %2d = %3d ", h, j, h*j);
			putchar('\n');
		}
	}

	if (col > 5)
	{
		printf("\n ȭ���� ����� ȭ��ũ�⸦ �⺻������ �ǵ����ϴ�. . . \n" \
				" ���� ��´ܼ��� 5�����̸� ȭ���� ������ �ʽ��ϴ�.\n");
		system(" pause");
		system("mode con cols=80");
	}

	return 0;
}
