cmake_minimum_required(VERSION 3.10)
include(${CMAKE_CURRENT_LIST_DIR}/.cunit/cunit.cmake)

project(cunit_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")

find_package(Protobuf REQUIRED)
message(status "Proto: ${Protobuf_LIBRARIES}")
add_executable(cunit_example main.cpp)
target_link_libraries(cunit_example Protobuf::Protobuf pthread)