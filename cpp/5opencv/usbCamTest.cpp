/*
	c++ ==> opencv, ������ USB ķ�� ������ ����ϴ� �ڵ�
*/
#include "opencv2/opencv.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main(int, char**){
	//��ĸ���� ���� ������ �о���� ���� �غ�
	VideoCapture cap1(1);

	if (!cap1.isOpened()) 
		cout << "ù��° ī�޶� �� �� �����ϴ�." << endl;

	Mat frame1;
	namedWindow("camera1", 1);

	while (1) {
		//��ĸ���κ��� �� �������� �о��
		cap1 >> frame1;
		imshow("camera1", frame1);
		// escŰ�� ������ ����
		if (waitKey(1) == 27) break;
	}

	return 0;
}
