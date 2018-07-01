#include <iostream>

#include <google/protobuf/util/json_util.h>
#include <google/protobuf/empty.pb.h>
#include <google/protobuf/any.h>

int main() {
  //std::cout << "Hello, World: " << std::endl;
  //google::protobuf::util::JsonParseOptions opts;
  auto e = new google::protobuf::Empty();
  printf("E2 size: %zu", e->ByteSizeLong());
  //std::cout << "Byte size: " << e->ByteSizeLong() << std::endl;
  //std::cout << "Hello, World: " << google::protobuf::internal::GetEmptyString() << std::endl;


  return 0;
}