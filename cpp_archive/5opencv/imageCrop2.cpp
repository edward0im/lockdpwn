/*
	c++ ==> opencv, ga.jpg�� ���ڴ����� ������ ���� ���� ���� ���� �׾ ���� �ڵ� 
				https://github.com/jponttuset/sudoku/blob/master/sudoku_ar_solver.cpp	�ҽ��ڵ� ����
*/
/* Basic includes */
#include <iostream>
#include <stdio.h>
#include <cmath>
#include <fstream>
#include <sstream>

/* STL containers */
#include <set>
#include <vector>
#include <unordered_set>
#include <string>
#include <map>

/* OpenCV includes */
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/core/core.hpp"
#include <opencv2/imgproc/imgproc.hpp>

using namespace std;
using namespace cv;

bool intersection(Point2f o1, Point2f p1, Point2f o2, Point2f p2, Point2f &inters){
	Point2f x = o2 - o1;
	Point2f d1 = p1 - o1;
	Point2f d2 = p2 - o2;

	float cross = d1.x*d2.y - d1.y*d2.x;
	if (abs(cross) < /*EPS*/1e-8)
		return false;

	double t1 = (x.x * d2.y - x.y * d2.x) / cross;
	inters = o1 + d1 * t1;
	return true;
}

/* Displays a point in the image (small circle) */
void paint_point(Mat& img, Point center){
	int thickness = -1;
	int lineType = 8;
	circle(img, center, 3, Scalar(0, 0, 255), thickness, lineType);
}

/* Struct that helps us store and sort pairs of lines */
struct PairStruct{
	PairStruct(size_t new_id1 = 0, size_t new_id2 = 0, double new_inters = 0)
		: id1(new_id1), id2(new_id2), inters(new_inters)
	{

	}
	size_t id1;
	size_t id2;
	double inters;
};

struct Line{
	/* Extreme points */
	Point e1;
	Point e2;

	/* Id in the global container */
	std::size_t id;

	/* Id in the horizontal or vertical container */
	std::size_t hv_id;

	/* Intersections with orthogonal lines */
	multimap<double, size_t> intersections;
};

// �������� ���������� ���� Grid �κ��� ã���ִ� �Լ�
// ���� �������� ���� �κ��� ��ġ�� �ǹǷ� �̸� �Ǵ��ϴ� �ڵ��ε�
/* Function that takes two sets of lines, and looks for a pattern of ten evenly-distributed lines at the first set,
* with respect to the intersections with the other set of lines.
* - lines1 and lines2 are input vectors containing pairs with the 'Line' struct defining the lines, and their distance to the origin
* - sel_lines is the output vector containing the ids of the ten 'recognized' sets of lines
*   (e.g., all ids in sel_lines[0] are part of the left-most or upper line of the grid)
* - The function returns true only if it finds an acceptable pattern of ten lines
*/
bool classify_lines(const vector<pair<double, Line>>& lines1, const vector<pair<double, Line>>& lines2, vector<set<size_t>>& sel_lines){
	double dist_th = 5; /* At least 20 pixels apart between lines of different sets (coming from different *true* lines) */
						 // double dist_th_down = 5;  /* At most 5 pixels apart within set */

						 /* No lines? Nothing to do! */
	if (lines1.empty())
		return false;
	else{
		//cout << "else comming " << endl;
		/* We store the distance between consecutive lines, to look for nine similar 'distances' */
		vector<pair<double, PairStruct>> int_diffs;

		/* Get the line in the middle of the detected lines (for this not to be one of the Sudoku lines,
		* there should be at least ten detected lines outside the grid... we hope the background is not that messy :)
		*/
		size_t horiz_id = round(lines1.size() / 2);
		auto line_it = lines1.begin() + horiz_id;
		const Line& middle_line = line_it->second;

		/* The line in the middle intersects with less than 10 lines, no Sudoku grid in the image */
		if (middle_line.intersections.size() <= 9) {
			cout << "classify_lines fail!" << endl;
			return false;
		}
		else{
			/* Scan all pairs of consecutive intersections with the middle line and store the 'pair'*/
			auto prev_inter = middle_line.intersections.begin();
			auto      inter = middle_line.intersections.begin();
			
			++inter;
			int i = 0;
			for (; inter != middle_line.intersections.end(); ++inter, ++prev_inter) {
				
				int_diffs.push_back(make_pair(inter->first - prev_inter->first, PairStruct(prev_inter->second, inter->second, inter->first)));
			}
			/* Sort the pairs of consecutive intersections with respect to their distance */
			sort(int_diffs.begin(), int_diffs.end(), [](const std::pair<double, PairStruct> &left, const std::pair<double, PairStruct> &right) 
			{return left.first < right.first; });

			/* Look for the round of 9 most similar differences */
			auto it1 = int_diffs.begin();
			auto it2 = int_diffs.begin() + 8;
			double min_diff = 1000000;
			int min_ind = -1;
			
			size_t curr_ind = 0;
			
			for (; it2<int_diffs.end(); ++it1, ++it2, ++curr_ind){
				if (it1->first>dist_th){
					if (it2->first - it1->first<min_diff){
						//cout << "loop" << endl;
						min_diff = it2->first - it1->first;
						min_ind = (int)curr_ind;
					}
				}
			}

			/* Have we found a 'round'? */
			if (min_ind < 0) {
				cout << "min_ind < 0" << endl;
				return false;
			}
			else if (max(int_diffs[min_ind].first, int_diffs[min_ind + 8].first) / min(int_diffs[min_ind].first, int_diffs[min_ind + 8].first) > 1.3)
				return false;
			else{
				/* Put them together to sort them */
				vector<PairStruct> sel_pairs(9);
				
				for (std::size_t ii = 0; ii<9; ++ii)
					sel_pairs[ii] = int_diffs[min_ind + ii].second;
				sort(sel_pairs.begin(), sel_pairs.end(), [](const PairStruct &left, const PairStruct &right) {return left.inters < right.inters; });

				/* Start the sets of similar lines */
				sel_lines.resize(10);
				for (std::size_t ii = 0; ii<9; ++ii)
				{
					sel_lines[ii].insert(sel_pairs[ii].id1);
					sel_lines[ii + 1].insert(sel_pairs[ii].id2);
				}

				//                /* Add the rest of the lines to the corresponding sets to do the mean */
				//                for(auto inter:base_line.intersections)
				//                    for(std::size_t ii=0; ii<10; ++ii)
				//                        if(abs(inter.first-xxx))<dist_th_down)    // (*sel_lines[ii].begin()
				//                            sel_lines[ii].insert(inter.second);
			}
		}
	}

	return true;
}


Point2f mean_intersection(const set<size_t>& h_set, const set<size_t>& v_set, const vector<pair<double, Line>>& horiz, const vector<pair<double, Line>>& verti){
	/* Get all interesections */
	std::vector<Point2f> all_int;
	for (auto it1 : h_set){
		for (auto it2 : v_set)
		{
			Point2f inters;
			if (intersection(horiz[it1].second.e1, horiz[it1].second.e2,
				verti[it2].second.e1, verti[it2].second.e2,
				inters))
				all_int.push_back(inters);
		}
	}

	/* Get the mean */
	Point2f mean = all_int[0];
	for (std::size_t ii = 1; ii<all_int.size(); ++ii)
		mean = mean + all_int[ii];
	mean.x = mean.x / (float)all_int.size();
	mean.y = mean.y / (float)all_int.size();
	return mean;
}

/// ���콺�� Ŭ���ϸ� �߻��ϸ� �ݹ��Լ�
void CallBackFunc(int event, int x, int y, int flags, void* userdata) {
	if (event == EVENT_LBUTTONDOWN) {
		cout << "Left button of the mouse is clicked - position (" << x << ", " << y << ")" << endl;
	}
	else if (event == EVENT_RBUTTONDOWN) {
		cout << "Right button of the mouse is clicked - position (" << x << ", " << y << ")" << endl;
	}
	else if (event == EVENT_MBUTTONDOWN) {
		cout << "Middle button of the mouse is clicked - position (" << x << ", " << y << ")" << endl;
	}
}

int main(int argc, const char *argv[]) {
	Mat image = imread("sudoku.jpg");
	/* Frame containers */
	Mat raw_frame, frame_gray, blurred_frame_gray, detected_edges, color_edges;

	/* Canny parameters */
	int ratio2 = 3;
	int kernel_size = 3;
	int lowThreshold = 30;

	/* Some constants */
	size_t sx = image.cols;
	size_t sy = image.rows;

	if (!image.data) return 0;

	/* To gray and blur for the Canny */
	cvtColor(image, frame_gray, CV_BGR2GRAY);
	blur(frame_gray, blurred_frame_gray, Size(3, 3));


	/* Canny edge detector */
	Canny(blurred_frame_gray, detected_edges, lowThreshold, lowThreshold*ratio2, kernel_size);


	/* Detect lines by Hough */
	vector<Vec2f> det_lines;
	HoughLines(detected_edges, det_lines, 2, CV_PI / 180, 300, 0, 0);
	

	/* Extract segments out of the lines to paint them on the frame - OpenCV expects a segment */
	vector<Line> lines(det_lines.size());
	for (size_t ii = 0; ii < det_lines.size(); ++ii){
		float rho = det_lines[ii][0], theta = det_lines[ii][1];
		double a = cos(theta), b = sin(theta);
		double x0 = a*rho, y0 = b*rho;
		lines[ii].e1.x = cvRound(x0 + 2000 * (-b));
		lines[ii].e1.y = cvRound(y0 + 2000 * (a));
		lines[ii].e2.x = cvRound(x0 - 2000 * (-b));
		lines[ii].e2.y = cvRound(y0 - 2000 * (a));
		lines[ii].id = ii;
	}

	/* Separate them into horizontal and vertical  by setting a threshold on the slope*/
	vector<pair<double, Line>> horiz;
	vector<pair<double, Line>> verti;
	vector<pair<double, Line>> other;

	for (size_t ii = 0; ii < lines.size(); ++ii)
		if (det_lines[ii][1]<CV_PI / 20 || det_lines[ii][1]>CV_PI - CV_PI / 20) /* Vertical if close to 180 deg or to 0 deg */
			verti.push_back(make_pair(det_lines[ii][0], lines[ii]));
		else if (abs(det_lines[ii][1] - CV_PI / 2)<CV_PI / 20)                  /* Horizontal if close to 90 deg */
			horiz.push_back(make_pair(det_lines[ii][0], lines[ii]));
		else
			other.push_back(make_pair(det_lines[ii][0], lines[ii]));

	/* Sort them in order of rho */
	std::sort(verti.begin(), verti.end(), [](const std::pair<double, Line> &left, const std::pair<double, Line> &right) {return left.first < right.first; });
	std::sort(horiz.begin(), horiz.end(), [](const std::pair<double, Line> &left, const std::pair<double, Line> &right) {return left.first < right.first; });

	/* And now store their relative position (order) in the frame sorted by rho */
	for (std::size_t ii = 0; ii<verti.size(); ++ii)
		verti[ii].second.hv_id = ii;
	for (std::size_t ii = 0; ii<horiz.size(); ++ii)
		horiz[ii].second.hv_id = ii;
		

	// �������� grid�� ���� �׷��ִ� �ڵ�
	/* Paint them on the frame 
	for (auto it : verti)
		line(image, it.second.e1, it.second.e2, Scalar(0, 0, 255), 2, CV_AA);
	for (auto it : horiz)
		line(image, it.second.e1, it.second.e2, Scalar(255, 0, 0), 2, CV_AA);
	for (auto it : other)
		line(image, it.second.e1, it.second.e2, Scalar(0, 0, 0), 1, CV_AA);
	*/

	/* Compute pairwise intersections between vertical and horizontal lines */
	for (auto& vert_it : verti){
		for (auto& hori_it : horiz){
			Point2f inters;
			if (intersection(vert_it.second.e1, vert_it.second.e2,
							hori_it.second.e1, hori_it.second.e2, inters)){
				if (inters.x >= 0 && inters.x < sx && inters.y >= 0 && inters.y < sy){
					vert_it.second.intersections.insert(make_pair(inters.y, hori_it.second.hv_id));
					hori_it.second.intersections.insert(make_pair(inters.x, vert_it.second.hv_id));
				}
			}
		}
	}

	// sel_v�� sel_h�� �������� ������ ��ȯ�Ѵ�
	/* Scan one line in the center (less likely to be erroneous) and classify the orthogonal lines */
	vector<set<size_t>> sel_v;
	bool good1 = classify_lines(horiz, verti, sel_v);

	vector<set<size_t>> sel_h;
	bool good2 = classify_lines(verti, horiz, sel_h);
	
	cout << "sel_v : " << sel_v.size() << ",  sel_h : " << sel_h.size() << endl;

	if (good1 || good2)
	{
		// �������� grid �ڳʿ� ������ ���� �׷��ִ� �ڵ�
		// �Ƹ� ���簢���� �� �۵��ϴ� �� �ϴ� �� �ڵ带 ���� good1 && good2 ����
		// sudoku.jpg ������ ���������� �ν��Ѵ�
		/* Find the corner points of the cells */
		vector<vector<Point2f>> corners(8, vector<Point2f>(8));
		for (std::size_t ii = 0; ii < 8; ++ii)
			for (std::size_t jj = 0; jj < 8; ++jj) {
				corners[ii][jj] = mean_intersection(sel_h[ii], sel_v[jj], horiz, verti);
			}

		/* Plot the corners */
		for (std::size_t ii = 0; ii < 8; ++ii)
			for (std::size_t jj = 0; jj < 8; ++jj)
				paint_point(image, corners[ii][jj]);
	}

	namedWindow("image2", CV_WINDOW_NORMAL);
	resizeWindow("image2", 600, 600);
	imshow("image2", image);
		
	/// �ݹ��Լ��� ȣ���Ѵ�
	//set the callback function for any mouse event
	setMouseCallback("image", CallBackFunc, NULL);

	waitKey(0);
	return 0;
}

