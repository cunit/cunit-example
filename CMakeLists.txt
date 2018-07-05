
# THIS IS UGLY - NEEDS CLEANUP - LESS EXHAUSTION :)

cmake_minimum_required(VERSION 3.10)
include(${CMAKE_CURRENT_LIST_DIR}/.cunit/cunit.cmake)

project(cunit_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")


file(GLOB PROTO_SRC ${CMAKE_CURRENT_LIST_DIR}/proto/*.proto)
find_tool(Protobuf REQUIRED)
PROTOC(${CMAKE_CURRENT_BINARY_DIR}/generated PROTO_CPP_SRC ${PROTO_SRC})
message("Protobuf generated cpp: ${PROTO_CPP_SRC}")

add_executable(cunit_example main.cpp ${PROTO_CPP_SRC})
target_include_directories(cunit_example PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/generated)

foreach(_pkg Protobuf OpenCV FFMPEG ZLIB JPEG PNG)
  find_package(${_pkg} REQUIRED)
  message(STATUS "${_pkg}: ${${_pkg}_LIBRARIES}")
  target_link_libraries(cunit_example ${${_pkg}_LIBRARIES})
endforeach()


target_link_libraries(cunit_example dl pthread)


