#include "stdafx.h"
#include <opencv2/opencv.hpp>

static const int MAX_CLUSTERS = 3;	// Ŭ������ ��

static struct sSampleParam {
	int no_sample;				// ���� �������� ��
	double mean_x, mean_y;		// x, y�� ���
	double stdev_x, stdev_y;	// x, y�� ǥ�� ����
	CvScalar color_bg;			// ��� ��
} sample_param[MAX_CLUSTERS] = {
	{ 500,  500, 200,  60,  30, CV_RGB(255, 0, 0), },
	{ 1500, 200, 500, 100,  80, CV_RGB(0, 255, 0), },
	{ 1000, 400, 700,  60, 100, CV_RGB(0, 0, 255), },
};


void K_Means ()
{
	cv::RNG rng;

	IplImage *img = cvCreateImage (cvSize (1000, 1000), IPL_DEPTH_8U, 3);
	cvZero (img);

	cvNamedWindow ("result", CV_WINDOW_AUTOSIZE);

	// �н� �������� �� ���� ī��Ʈ �Ѵ�.
	int sample_count = 0;
	for (int i=0; i<MAX_CLUSTERS; i++) sample_count += sample_param[i].no_sample;

	CvMat *points   = cvCreateMat (sample_count, 2, CV_32FC1);
	CvMat *clusters = cvCreateMat (sample_count, 1, CV_32SC1);
	
	// �� Ŭ������ ���� ���Ժ����� ������ �����͸� �������� ����
	for (int i=0, k=0; i<MAX_CLUSTERS; i++){
		for (int j=0; j<sample_param[i].no_sample; j++){
			CV_MAT_ELEM(*points,  float,k,0) = (float)(sample_param[i].mean_x + rng.gaussian(sample_param[i].stdev_x));
			CV_MAT_ELEM(*points,  float,k,1) = (float)(sample_param[i].mean_y + rng.gaussian(sample_param[i].stdev_y));
			// CV_MAT_ELEM(*clusters,long, k,0) = i;
			k++;
		}
	}

	// MAX_K-means�� ���� Ŭ�����͸�
	cvKMeans2 (points, MAX_CLUSTERS, clusters, cvTermCriteria (CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 10, 1.0));

	// Ŭ�����͸��� ���� �ٲپ� ������ �׸�
	for (int k=0; k<sample_count; k++){
		int x = cvRound(CV_MAT_ELEM(*points, float,k,0));
		int y = cvRound(CV_MAT_ELEM(*points, float,k,1));
		int c = cvRound(CV_MAT_ELEM(*clusters,long, k,0));

		cvCircle (img, cvPoint(x, y), 2, sample_param[c].color_bg, CV_FILLED);
	}

	// �̹����� ǥ��
	cvShowImage ("result", img);

	// Ű�� ������ ����
	cvWaitKey (0);

	cvReleaseMat (&points);
	cvReleaseMat (&clusters);

	cvDestroyWindow ("result");
	cvReleaseImage (&img);
}


int main()
{
	K_Means ();

	return 0;
}