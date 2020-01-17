/*
	c++ ==> opencv, �ΰ��� ķ�ڴ��κ��� ������ �޾ƿ� ���� ��ģ ���� �����ϴ� �ڵ�
*/
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace cv;

int main() {
	Mat img, img2;	// ������ ���� ����� ���� ��� ����
	VideoCapture cap(0);	    // ķ���κ��� ������ �޾ƿ´� (Ȥ�� 1��)
	VideoCapture cap2(0);

	int count = 0;
	char savefile[200];		// �̹��� ���� �̸��� 200�� �̳��� �����ϱ� ���� char ���� ����

	while (1) {
		cap >> img;
		cap2 >> img2;

		imshow("image", img);	  // ���� ���	
		imshow("image2", img2);

		// �ΰ��� �̹����� �����ִ� ������ ��ɾ� :-)
		hconcat(img, img2, img);

		resize(img, img, Size(200, 100), 0, 0, INTER_CUBIC); // �������� ������ ���� ũ�⸦ downsizing�ؼ� �����Ѵ�
		sprintf(savefile, "image%d.jpg", count++);
		imwrite(savefile, img);		// img�� ���Ϸ� �����Ѵ�.

		if (waitKey(100) == 27)  break; // esc�� ������ �����Ѵ�
	}
	return 0;
}
