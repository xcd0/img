#include <opencv2/opencv.hpp>

#include <opencv2/imgproc.hpp> // cv::Canny

int main() {
	cv::Mat img = cv::imread("./lena.jpg");

	// imgを白黒にしてimg_binに代入
	cv::Mat img_bin;
	cv::cvtColor(img, img_bin, cv::COLOR_BGR2GRAY);

	// チャンネル数の確認
	std::cout << "img     : " << img.channels() << " channel" << std::endl;
	std::cout << "img_bin : " << img_bin.channels() << " channel" << std::endl;

	cv::imshow("img", img);
	cv::waitKey(0); // キーが押されるまで待機

	// Canny法によるエッジ検出
	cv::Mat img_canny;
	cv::Canny(img, img_canny, 500.0, 700.0);
	cv::imshow("img_canny", img_canny);

	cv::waitKey(0); // キーが押されるまで待機
	return 0;
}
