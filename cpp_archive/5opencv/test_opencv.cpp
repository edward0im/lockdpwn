#include <iostream>
#include <opencv2\opencv.hpp>

using namespace cv;
using namespace std;

/*�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�*/
//#define filename           "AVM.mp4"
#define filename             "AVM.png"
//#define filename           "rose.jpg"
#define SaveFileName         "result.png"
#define video 0 
#define image 1

/*�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�*/

/// Trackbar strings
char* window_name = "AVM";
int main() {
	// Initialize Matrix
	Mat src, BGR, HSV, gray, dst, LAB, test;
	src = imread(filename, 1);
	BGR = src.clone();
	cvtColor(src, HSV, CV_BGR2HSV);
	cvtColor(src, gray, CV_BGR2GRAY);
	cvtColor(src, LAB, CV_BGR2Lab);

	/// Create a window to display results
	namedWindow(window_name, 0);
	resizeWindow(window_name, 1000, 700);

	// BGR, HSV
	Mat B(BGR.rows, BGR.cols, CV_8UC1);
	Mat G(BGR.rows, BGR.cols, CV_8UC1);
	Mat R(BGR.rows, BGR.cols, CV_8UC1);
	Mat outBGR[] = { B, G, R };
	int from_toBGR[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&BGR, 1, outBGR, 3, from_toBGR, 3);

	Mat H(HSV.rows, HSV.cols, CV_8UC1);
	Mat S(HSV.rows, HSV.cols, CV_8UC1);
	Mat V(HSV.rows, HSV.cols, CV_8UC1);
	Mat outHSV[] = { H, S, V };
	int from_toHSV[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&HSV, 1, outHSV, 3, from_toHSV, 3);

	Mat L(LAB.rows, LAB.cols, CV_8UC1);
	Mat a(LAB.rows, LAB.cols, CV_8UC1);
	Mat b(LAB.rows, LAB.cols, CV_8UC1);
	Mat outLAB[] = { L, a, b };
	int from_toLAB[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&LAB, 1, outLAB, 3, from_toLAB, 3);

	// Harris corner variables
	int thresh = 150;
	int blockSize = 6; //5
	int apertureSize = 5; //5 
	double k = 0.06;

	while(true) {
		// save, quit operate
		int input_key = waitKey(30);
		imshow(window_name, src);
		adaptiveThreshold(gray, test, 250, CV_ADAPTIVE_THRESH_MEAN_C, CV_THRESH_BINARY, 3, 5);

		Mat img_temp = gray.clone();
		Mat img_contour, check, img2;

		img2 = 255 - img_temp;
		img_contour = img2.clone();

		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));
		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));
		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));
		///-----------------------------------------------------------------------------------------------
		Mat contour_dst;
		Canny(img_contour, contour_dst, 200, 50, 3);
		Canny(contour_dst, contour_dst, 200, 50, 3);

		morphologyEx(contour_dst, contour_dst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));
		morphologyEx(contour_dst, contour_dst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));

		Canny(contour_dst, contour_dst, 200, 50, 3);

		int contour_num = 0;
		check = gray.clone();

		Canny(check, check, 200, 50, 3);

		//adaptiveThreshold(check, check, 255, CV_ADAPTIVE_THRESH_MEAN_C, CV_THRESH_BINARY_INV, 3, 5);

		morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));
		//morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));
		//morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));
		//morphologyEx(check, check, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15,15)));

		///-----------------------------------------------------------------------------------------------
		// Contour limitation for detecting license
		Mat drawing = gray.clone();
		Mat drawing2 = gray.clone();
		Mat drawing3 = gray.clone();
		cvtColor(drawing, drawing, CV_GRAY2BGR);
		cvtColor(drawing2, drawing2, CV_GRAY2BGR);
		cvtColor(drawing3, drawing3, CV_GRAY2BGR);

		Mat dst_norm3, dst_norm_scaled3, dst3;

		thresh = 160;
		blockSize = 3;
		apertureSize = 3;
		k = 0.06;

		cornerHarris(check, dst3, blockSize, apertureSize, k, BORDER_DEFAULT);
		normalize(dst3, dst_norm3, 0, 255, NORM_MINMAX, CV_32FC1, Mat());
		convertScaleAbs(dst_norm3, dst_norm_scaled3);
		/// Drawing a circle around corners
		for (int j = 0; j < dst_norm3.rows; j++) {
			for (int i = 0; i < dst_norm3.cols; i++) {
				if ((int)dst_norm3.at<float>(j, i) > thresh) {
					circle(drawing, Point(i, j), 5, Scalar(255,0,0), 2, 8, 0);
				}
			}
		}

		///-----------------------------------------------------------------------------------------------
		vector<Vec4i> lines, lines2, lines3;
		//HoughLinesP(check, lines, 1, CV_PI/180, 50, 2, 1);
		//for (size_t i = 0; i < lines.size(); i++) {
		//	Vec4i l = lines[i];
		//	line(drawing, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0,255,0), 2, CV_AA);
		//}

		HoughLinesP(contour_dst, lines, 1, CV_PI/180, 50, 10, 1);
		HoughLinesP(contour_dst, lines2, 1, CV_PI/180, 50, 5, 5);
		HoughLinesP(contour_dst, lines3, 1, CV_PI/180, 50, 2, 10);
		for (size_t i = 0; i < lines.size(); i++) {
			Vec4i l = lines[i];
			line(drawing2, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0,0,255), 2, CV_AA);
		}
		for (size_t i = 0; i < lines2.size(); i++) {
			Vec4i l = lines2[i];
			line(drawing2, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0,255,0), 2, CV_AA);
		}
		for (size_t i = 0; i < lines3.size(); i++) {
			Vec4i l = lines3[i];
			line(drawing2, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(255,0,0), 2, CV_AA);
		}

		///-----------------------------------------------------------------------------------------------
		vector<vector<Point>> contours;
		Mat hierarchy;
		findContours(contour_dst, contours, hierarchy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));

		drawing3 = Scalar(0);

		for (int i = 0; i < contours.size(); i++) {
			approxPolyDP(Mat(contours[i]), contours_poly[i], 3, true);
			boundRect[i] = boundingRect(Mat(contours_poly[i]));
		}


		/// Draw contours
		for (int i = 0; i < contours.size(); i++) {
			drawContours(drawing3, contours, i, Scalar(0,0,255), 2, 8, hierarchy, 0, Point());
		}
		///-----------------------------------------------------------------------------------------------
		//cvtColor(drawing3, drawing3, CV_BGR2GRAY);
		//cornerHarris(drawing3, dst3, blockSize, apertureSize, k, BORDER_DEFAULT);
		//normalize(dst3, dst_norm3, 0, 255, NORM_MINMAX, CV_32FC1, Mat());
		//convertScaleAbs(dst_norm3, dst_norm_scaled3);

		//cvtColor(drawing3, drawing3, CV_GRAY2BGR);
		//for (int j = 0; j < dst_norm3.rows; j++) {
		//	for (int i = 0; i < dst_norm3.cols; i++) {
		//		if ((int)dst_norm3.at<float>(j, i) > 180) {
		//			circle(drawing3, Point(i, j), 5, Scalar(0, 0, 255), 1, 8, 0);
		//			//circle(imageROI, Point(i, j), 5, Scalar(0, 0, 255), 1, 8, 0);
		//		}
		//	}
		//}
		///-----------------------------------------------------------------------------------------------
		Mat gray_modified = gray.clone();
		gray_modified = Scalar(0);
		for (int i = 0; i < gray.rows; i++) {
			for (int j = 0; j < gray.cols; j++) {
				if (gray.at<uchar>(i, j) > 185) {
					gray_modified.at<uchar>(i, j) = 255;
				}
			}
		}
		///-----------------------------------------------------------------------------------------------

		if (input_key == 'q' || input_key == 'Q') {
			cout << "Program Termination" << endl;
			break;
		}
		else if (input_key == 'c' || input_key == 'C') {
			imwrite(SaveFileName, dst);
		}
		input_key = 0;
	}

	return 0;
}
