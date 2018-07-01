#include <iostream>

#include <google/protobuf/util/json_util.h>
#include <google/protobuf/empty.pb.h>
#include <google/protobuf/any.h>

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

int main() {
  //std::cout << "Hello, World: " << std::endl;
  //google::protobuf::util::JsonParseOptions opts;
  //auto e = new google::protobuf::Empty();
  //printf("E2 size: %zu", e->ByteSizeLong());
  //std::cout << "Byte size: " << e->ByteSizeLong() << std::endl;
  //std::cout << "Hello, World: " << google::protobuf::internal::GetEmptyString() << std::endl;

  cv::Mat mat = cv::imread("/tmp/sample.png");
  cv::Mat matOut(400,400,CV_8UC3);
  std::cout << "Rows: " << mat.rows << std::endl;

  cv::resize(mat,matOut, cv::Size(), 0.75, 0.75);

  cv::imwrite("/tmp/sample4.jpeg",matOut);
  //cv::imshow("sample",mat);
  //cv::waitKey();

  return 0;
}