cmake_minimum_required(VERSION 3.10)
include(${CMAKE_CURRENT_LIST_DIR}/.cunit/cunit.cmake)

project(cunit_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")

find_package(Protobuf REQUIRED)
find_package(OpenCV REQUIRED)
find_package(ZLIB REQUIRED)
find_package(TIFF REQUIRED)
find_package(JPEG REQUIRED)
find_package(PNG REQUIRED)

message(STATUS "OpenCV Targets: ${OpenCV_ALL}")
message(STATUS "OpenCV Libs: ${OpenCV_LIBRARIES}")

add_executable(cunit_example main.cpp)
target_link_libraries(cunit_example
  ${PROTOBUF_LIBRARY}
  ${OpenCV_ALL}
  ${TIFF_LIBRARY}
  ${LIBPNG_LIBRARIES}
  ${JPEG_LIBRARY}
  ${ZLIB_LIBRARIES}
  dl
  pthread
  )