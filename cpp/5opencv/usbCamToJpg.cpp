/*
	c++ ==> opencv, ��ķ�� ������ ����԰� ���ÿ� 
					1�ʿ� 10���� �̹����� jpg ���Ϸ� ���� ����� �ٿ��� �����ϴ� �ڵ�
*/
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace cv;

int main() {
	Mat img;				// ������ ���� ����� ���� ��� ����
	VideoCapture cap(0);	// ķ���κ��� ������ �޾ƿ´� (Ȥ�� 1��)

	int count = 0;
	char savefile[200];		// �̹��� ���� �̸��� 200�� �̳��� �����ϱ� ���� char ���� ����

	while(1){
		cap >> img;		
		imshow("image", img);	  // ���� ���	

		resize(img, img, Size(60, 60), 0, 0, INTER_CUBIC);		// �������� ������ ���� ũ�⸦ downsizing�ؼ� �����Ѵ�
		sprintf(savefile, "image%d.jpg", count++);
		imwrite(savefile, img);		// img�� ���Ϸ� �����Ѵ�.

		if (waitKey(100) == 27)  break; // esc�� ������ �����Ѵ�
	}
	return 0;
}
