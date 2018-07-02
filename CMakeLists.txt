
# THIS IS UGLY - NEEDS CLEANUP - LESS EXHAUSTION :)

cmake_minimum_required(VERSION 3.10)
include(${CMAKE_CURRENT_LIST_DIR}/.cunit/cunit.cmake)

project(cunit_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")

#find_tool(Protobuf REQUIRED)

add_executable(cunit_example main.cpp)


foreach(_pkg OpenCV FFMPEG ZLIB TIFF JPEG PNG)
  find_package(${_pkg} REQUIRED)
  message(STATUS "${_pkg}: ${${_pkg}_LIBRARIES}")
  target_link_libraries(cunit_example ${${_pkg}_LIBRARIES})
endforeach()


target_link_libraries(cunit_example dl pthread)


