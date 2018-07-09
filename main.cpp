#include <iostream>

#include <google/protobuf/util/json_util.h>
#include <google/protobuf/empty.pb.h>
#include <google/protobuf/any.h>

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <test.pb.h>

//extern "C" {
//#include <libavcodec/avcodec.h>
//}

int main() {

  // CHECK FFMPEG
  //avcodec_register_all();
  //AVCodec * codec = av_codec_next(NULL);
  //while(codec != NULL) {
  //  std::cout << codec->long_name << std::endl;
  //  codec = av_codec_next(codec);
  //}

  // CHECK OPENCV
  cv::Mat mat = cv::imread("./sample.png");
  cv::Mat matOut(400,400,CV_8UC3);
  cv::resize(mat,matOut, cv::Size(), 0.75, 0.75);
  cv::imwrite("/tmp/sample4.jpeg",matOut);

  // PROTOBUF
  cunit::test::CUnitTestMessage msg;
  msg.set_name("Joey");
  std::cout << "My name is: " << msg.name() << std::endl;

  std::string json;
  google::protobuf::util::MessageToJsonString(msg,&json);
  std::cout << "My name is: " << json << std::endl;
  return 0;
}